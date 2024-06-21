package com.exam.dto;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

@Alias("OrderDTO")
public class OrderDTO {

	String orderId;
	LocalDate orderDate;
	String userId;
	String title;
	int cCount;
	String imageCode;
	String bookId;
	int totalPrice;
	
	public OrderDTO() {}

	public OrderDTO(String orderId, LocalDate orderDate, String userId, String title, int cCount, String imageCode,
			String bookId, int totalPrice) {
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.userId = userId;
		this.title = title;
		this.cCount = cCount;
		this.imageCode = imageCode;
		this.bookId = bookId;
		this.totalPrice = totalPrice;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public LocalDate getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getcCount() {
		return cCount;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	public String getImageCode() {
		return imageCode;
	}

	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "OrderDTO [orderId=" + orderId + ", orderDate=" + orderDate + ", userId=" + userId + ", title=" + title
				+ ", cCount=" + cCount + ", imageCode=" + imageCode + ", bookId=" + bookId + ", totalPrice="
				+ totalPrice + "]";
	}
	
}
