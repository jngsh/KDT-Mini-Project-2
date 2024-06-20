package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.CartDTO;

@Mapper
public interface CartMapper {
	public void insertCart(CartDTO cartDTO);
	public List<CartDTO> cartList(String userId);
	public void deleteItem(CartDTO cartDTO);
	public int selectCart(String userId);
}
