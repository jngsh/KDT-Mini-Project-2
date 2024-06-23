package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.dto.CartDTO;
import com.exam.mapper.CartMapper;


@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartMapper cartMapper;
	
	@Override
	public void addToCart(CartDTO cartDTO) {
		
		cartMapper.insertCart(cartDTO);
		
	}

	@Override
	public List<CartDTO> cartList(String userId) {
		
		return cartMapper.cartList(userId);
	}


	@Override
    public void deleteItem(String bookId, String userId) {
        CartDTO cartDTO = new CartDTO();
        cartDTO.setBookId(bookId);
        cartDTO.setUserId(userId);
        cartMapper.deleteItem(cartDTO);
    }

	@Override
	public int selectCart(String userId) {
	
		return cartMapper.selectCart(userId);
	}

	@Override
	public CartDTO selectBookId(String bookId) {
		
		return cartMapper.selectBookId(bookId);
	}

	@Override
	public void updateCartItem(String userId, String bookId, int cCount, int totalPrice) {
		cartMapper.updateCartItem(userId, bookId, cCount, totalPrice);
		
	}

	

	
	
	
	
}
