package com.exam.service;

import org.springframework.stereotype.Service;

import com.exam.dto.MemberDTO;
import com.exam.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	MemberMapper memberMapper;

	public MemberServiceImpl(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public int save(MemberDTO member) {
		return memberMapper.save(member);
	}

	@Override
	public MemberDTO findById(String userId) {
		return memberMapper.findById(userId);
	}

	@Override
	public MemberDTO mypage(String userId) {
		return memberMapper.mypage(userId);
	}

	@Override
	public void updateMember(MemberDTO member) {
		memberMapper.updateMember(member);
	}

	@Override
	public int idCheck(String userId) {
		return memberMapper.idCheck(userId);
	}

}
