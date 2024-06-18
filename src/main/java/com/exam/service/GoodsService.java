package com.exam.service;

import java.util.List;

import com.exam.dto.GoodsDTO;

public interface GoodsService {
	public List<GoodsDTO> goodsList(String category);
	public GoodsDTO goodsRetrieve(String bookId);
	public List<GoodsDTO> selectAll();
	public List<GoodsDTO> getGoodsByCategory(String category, int offset, int itemsPerPage);
    public int countGoodsByCategory(String category);
    public List<GoodsDTO> selectAllWithPaging(int offset, int itemsPerPage);
    
}
