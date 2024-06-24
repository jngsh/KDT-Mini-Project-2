package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.GoodsDTO;

@Mapper
public interface GoodsMapper {
	
	public List<GoodsDTO> goodsList(String gCategory);
	public GoodsDTO goodsRetrieve(String bookId);
	public List<GoodsDTO> selectAll();
	public List<GoodsDTO> getGoodsByCategory(String category, int offset, int itemsPerPage);
    public int countGoodsByCategory(String category);
    public List<GoodsDTO> selectAllWithPaging(int offset, int itemPerPage);
	
}
