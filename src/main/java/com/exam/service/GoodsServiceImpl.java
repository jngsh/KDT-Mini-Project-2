package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.dto.GoodsDTO;
import com.exam.mapper.GoodsMapper;

@Service
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	GoodsMapper goodsMapper;
	
	@Override
	public List<GoodsDTO> goodsList(String category) {

		return goodsMapper.goodsList(category);
	}

	@Override
	public GoodsDTO goodsRetrieve(String bookId) {
	
		return goodsMapper.goodsRetrieve(bookId);
	}

}
