package com.exam.dto;

public class CartDTO {
	
	int cartId;
	String bookId;
	int cCount;
	String userId;
	public CartDTO() {}
	public CartDTO(int cartId, String bookId, int cCount, String userId) {

		this.cartId = cartId;
		this.bookId = bookId;
		this.cCount = cCount;
		this.userId = userId;
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
	
	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", bookId=" + bookId + ", cCount=" + cCount + ", userId=" + userId + "]";
	}
	
	
	
}
