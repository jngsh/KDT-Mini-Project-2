package com.exam.service;

import com.exam.dto.MemberDTO;

public interface MemberService {
	
	public int save(MemberDTO member);
	public MemberDTO findById(String userId);
}
