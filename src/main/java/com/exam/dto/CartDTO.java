package com.exam.dto;

import java.util.List;

import com.exam.dto.GoodsDTO;

public class CartDTO {
	
	int cartId;
	String bookId;
	int cCount;
	String userId;
	int totalPrice;
	
	List<GoodsDTO> goodsList;
	
	public CartDTO() {}
	public CartDTO(int cartId, String bookId, int cCount, String userId, int totalPrice,
			List<GoodsDTO> goodsList) {

		this.cartId = cartId;
		this.bookId = bookId;
		this.cCount = cCount;
		this.userId = userId;
		this.totalPrice=totalPrice;
		this.goodsList=goodsList;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public int getcCount() {
		return cCount;
	}
	public void setcCount(int cCount) {
		this.cCount = cCount;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public List<GoodsDTO> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<GoodsDTO> goodsList) {
		this.goodsList = goodsList;
	}
	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", bookId=" + bookId + ", cCount=" + cCount + ", userId=" + userId
				+ ", totalPrice=" + totalPrice + ", goodsList=" + goodsList + "]";
	}
	
	
	
	
	
	
}
