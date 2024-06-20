package com.exam.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.MemberDTO;

@Mapper
public interface MemberMapper {
	
	public int save(MemberDTO member);
	public int idCheck(String userId);
	public MemberDTO findById(String userId);
	public MemberDTO mypage(String userId);
	public void updateMember(MemberDTO member);
}
