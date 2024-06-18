package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.dto.GoodsDTO;
import com.exam.dto.MemberDTO;
import com.exam.mapper.GoodsMapper;
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


}
