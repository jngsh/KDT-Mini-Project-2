package com.exam.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.service.MemberService;

@Controller
public class LoginController {

	Logger logger = LoggerFactory.getLogger(getClass());

	MemberService memberService;

	public LoginController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping(value={"/login"})
	public String showLoginPage() {
		return "loginForm";
	}
	
	@PostMapping(value={"/login_fail"})
	public String showlogin_failPage(RedirectAttributes redirectAttributes) {
		logger.info("logger:showlogin_failPage");
		redirectAttributes.addFlashAttribute("loginFailed", true);
		return "redirect:login";
	}
	
	@GetMapping(value={"/login_success"})
	public String showlogin_successPage() {
		logger.info("logger:showlogin_successPage");
		return "redirect:main";
	}
	
}