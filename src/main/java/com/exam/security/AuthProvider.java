package com.exam.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.exam.dto.MemberDTO;
import com.exam.service.MemberService;

@Component
public class AuthProvider implements AuthenticationProvider {
	
	MemberService memberService;
	
	public AuthProvider(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String userId = (String)authentication.getPrincipal(); 
		String userPw = (String)authentication.getCredentials(); 
		
		
		MemberDTO member = memberService.findById(userId);
		
		
		UsernamePasswordAuthenticationToken token=null;
		if(member!=null && new BCryptPasswordEncoder().matches(userPw, member.getUserPw())) {
			
			List<GrantedAuthority> list = new ArrayList<>();
			list.add(new SimpleGrantedAuthority("USER"));
			
			member.setUserPw(userPw);
			token = new UsernamePasswordAuthenticationToken(member, null, list);
			return token;
		}
		throw new BadCredentialsException("비밀번호가 일치하지 않습니다. 다시 확인하세요.");
		
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}




