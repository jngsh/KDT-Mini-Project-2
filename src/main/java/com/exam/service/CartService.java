package com.exam.service;

import java.util.List;

import com.exam.dto.CartDTO;

public interface CartService {
	public void addToCart(CartDTO cartDTO);
	public List<CartDTO> cartList(String userId);
	public void deleteItem(String bookId, String userId);
	public int selectCart(String userId);
}
