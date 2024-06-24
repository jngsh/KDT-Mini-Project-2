package com.exam.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityFilterChainConfig {

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		
		
		http.authorizeRequests()
			.antMatchers("/mypage").authenticated()
		    .antMatchers("/goodsDetail","/addToCart", "/goods/**","/login", "/main", "/signup", "/idCheck","/webjars/**", "/image/**", "/assets/**", "/css/**", "/js/**").permitAll()
		    .anyRequest()
		    .authenticated();
		
		http.csrf().disable();
		
		http.formLogin()    
		    .loginPage("/login") 
		    .loginProcessingUrl("/auth") 
		    .usernameParameter("userId")  
		    .passwordParameter("userPw")       
		    .failureForwardUrl("/login_fail")       
		    .defaultSuccessUrl("/login_success", true);
		
		 http.logout()
		     .logoutUrl("/logout")  
		     .logoutSuccessUrl("/main");  
		     
		 
		return http.build();
	}
	
}
