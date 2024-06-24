package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.CartDTO;
import com.exam.dto.GoodsDTO;

@Mapper
public interface CartMapper {
	public void insertCart(CartDTO cartDTO);
	public List<CartDTO> cartList(String userId);
	public void deleteItem(CartDTO cartDTO);
	public int selectCart(String userId);
	public CartDTO selectBookId(String bookId, String userId);
	public void updateCartItem(String userId, String bookId, int cCount, int totalPrice);
}
