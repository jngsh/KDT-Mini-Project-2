package com.exam.controller;

import javax.servlet.http.HttpSession;
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

	@GetMapping(value = { "/signup" })
	public String showSignupPage(ModelMap model) {

		model.put("member", new MemberDTO());
		return "memberForm";
	}

	@PostMapping(value = { "/signup" })
	public String showSignUpSuccessPage(@Valid MemberDTO member, BindingResult result) {
		logger.info("logger:{}", member);

		if (result.hasErrors()) {
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
		if (idCount == 1) {
			mesg = "사용불가";
		} else {
		}
		return mesg;
	}

	@GetMapping(value = { "/mypage" })
	public String mypage(ModelMap model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		logger.info("logger:mypage:Authentication:{}", auth);

		if (auth != null && auth.isAuthenticated()) {
			MemberDTO member = (MemberDTO) auth.getPrincipal();
			logger.info("logger:mypage:MemberDTO:{}", member);
			model.addAttribute("member", member);
			return "mypage";
		} else {
			return "redirect:login";
		}

	}

	@PostMapping(value = { "/updateMember" })
	public @ResponseBody void updateMember(@RequestBody MemberDTO updatedMemberDTO, ModelMap model, HttpSession session) {

		memberService.updateMember(updatedMemberDTO);
		logger.info("logger:updateMember 후 memberDTO={}", updatedMemberDTO);

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDTO member = (MemberDTO) auth.getPrincipal();
		logger.info("logger:update 전 member={}", member);
		
		member.setUserName(updatedMemberDTO.getUserName());
		member.setAddr1(updatedMemberDTO.getAddr1());
		member.setAddr2(updatedMemberDTO.getAddr2());
		member.setPost(updatedMemberDTO.getPost());
		member.setEmail1(updatedMemberDTO.getEmail1());
		member.setEmail2(updatedMemberDTO.getEmail2());
		member.setPhone1(updatedMemberDTO.getPhone1());
		member.setPhone2(updatedMemberDTO.getPhone2());
		member.setPhone3(updatedMemberDTO.getPhone3());
		
		logger.info("logger:update 후 member={}", member);
				
		model.addAttribute("updatedMemberDTO", updatedMemberDTO);
		session.setAttribute("userId", updatedMemberDTO.getUserId());
	}

}