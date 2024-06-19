package com.exam.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.exam.dto.MemberDTO;
import com.exam.service.MemberService;

@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(getClass());

	MemberService memberService;
	
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	@GetMapping(value={"/signup"})
	public String showSignupPage(ModelMap model) {
		
		model.put("member", new MemberDTO());
		return "memberForm";
	}

	@PostMapping(value={"/signup"})
	public String showSignUpSuccessPage(@Valid MemberDTO member, BindingResult result) {
		logger.info("logger:{}", member);
		
		if(result.hasErrors()) {
			return "memberForm";
		}

		String encryptPw = new BCryptPasswordEncoder().encode(member.getUserPw());
		member.setUserPw(encryptPw);
		
		int n = memberService.save(member);

		return "redirect:main";
	}
	
	@GetMapping(value={"/mypage"})
	public String mypage() {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		logger.info("logger:Authentication:{}", auth);
		MemberDTO member = (MemberDTO)auth.getPrincipal();
		logger.info("logger:Member:{}", member);
		
		return "redirect:mypage";
	}
	
}