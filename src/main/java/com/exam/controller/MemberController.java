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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

		return "redirect:login";
	}
	
	@GetMapping("/idCheck")
	public @ResponseBody String idCheck(@RequestParam(name = "userId") String userId) {
		
		int idCount = memberService.idCheck(userId);
		
		String mesg = "사용가능";
		if(idCount == 1) {
//			logger.info("logger:idCount == 1: idCount={}", idCount);
			mesg = "사용불가";
		} else {
//			logger.info("logger:idCount == 1: idCount={}", idCount);
		}
		return mesg;
	}
	
	@GetMapping(value={"/mypage"})
	public String mypage(ModelMap model) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		logger.info("logger:Authentication:{}", auth);
		
        if (auth != null && auth.isAuthenticated()) {
        	MemberDTO member = (MemberDTO)auth.getPrincipal();
        	logger.info("logger:MemberDTO:{}", member);
        	model.addAttribute("member", member);
        	return "mypage";
        } else {
        	return "redirect:login";
        }
        
	}
	
//	@PostMapping(value={"/updateMember"})
//	public @ResponseBody MemberDTO updateMember(@RequestBody MemberDTO updatedMemberDTO, ModelMap model) {
////		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
////		MemberDTO member = (MemberDTO)auth.getPrincipal();
//		logger.info("logger:updateMember 전 memberDTO={}", updatedMemberDTO);
//		
//		memberService.updateMember(updatedMemberDTO);
//		logger.info("logger:updateMember 후 memberDTO={}", updatedMemberDTO);
//		return updatedMemberDTO;
//	}
	
	@PostMapping(value={"/updateMember"})
	public @ResponseBody void updateMember(@RequestBody MemberDTO updatedMemberDTO, ModelMap model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		MemberDTO member = (MemberDTO)auth.getPrincipal();
		logger.info("logger:updateMember 전 memberDTO={}", updatedMemberDTO);
		
		memberService.updateMember(updatedMemberDTO);
		logger.info("logger:updateMember 후 memberDTO={}", updatedMemberDTO);
		
		if (auth != null && auth.isAuthenticated()) {
        	MemberDTO member = (MemberDTO)auth.getPrincipal();
        	logger.info("logger:MemberDTO:{}", member);
        	model.addAttribute("member", member);
        }
//		return "hello";
	}
	
}