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

	@Override
	public List<GoodsDTO> selectAll() {
		return goodsMapper.selectAll();
	}
	
	@Override
    public List<GoodsDTO> getGoodsByCategory(String category, int offset, int itemsPerPage) {
        return goodsMapper.getGoodsByCategory(category, offset, itemsPerPage);
    }

    @Override
    public int countGoodsByCategory(String category) {
        return goodsMapper.countGoodsByCategory(category);
    }

	@Override
	public List<GoodsDTO> selectAllWithPaging(int offset, int itemsPerPage) {
		
		return goodsMapper.selectAllWithPaging(offset, itemsPerPage);
	}

}
