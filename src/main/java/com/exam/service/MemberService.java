package com.exam.service;

import com.exam.dto.MemberDTO;

public interface MemberService {
	
	public int save(MemberDTO member);
	public int idCheck(String userId);
	public MemberDTO findById(String userId);
	public MemberDTO mypage(String userId);
	public void updateMember(MemberDTO member);
}
