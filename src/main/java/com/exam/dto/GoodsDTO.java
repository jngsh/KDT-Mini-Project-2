package com.exam.dto;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

@Alias("GoodsDTO")
public class GoodsDTO {
	
	String bookId;
	String title;
	String author;
	int price;
	String category;
	String publisher;
	String imageCode;
	LocalDate publishDate;
	
	int currentPage;
	int itemsPerPage;
	int totalItems;
	int totalPages;
	
	public GoodsDTO() {}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getImageCode() {
		return imageCode;
	}

	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}

	public LocalDate getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(LocalDate publishDate) {
		this.publishDate = publishDate;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getItemsPerPage() {
		return itemsPerPage;
	}

	public void setItemsPerPage(int itemsPerPage) {
		this.itemsPerPage = itemsPerPage;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public GoodsDTO(String bookId, String title, String author, int price, String category, String publisher,
			String imageCode, LocalDate publishDate, int currentPage, int itemsPerPage, int totalItems,
			int totalPages) {
		super();
		this.bookId = bookId;
		this.title = title;
		this.author = author;
		this.price = price;
		this.category = category;
		this.publisher = publisher;
		this.imageCode = imageCode;
		this.publishDate = publishDate;
		this.currentPage = currentPage;
		this.itemsPerPage = itemsPerPage;
		this.totalItems = totalItems;
		this.totalPages = totalPages;
	}

	@Override
	public String toString() {
		return "GoodsDTO [bookId=" + bookId + ", title=" + title + ", author=" + author + ", price=" + price
				+ ", category=" + category + ", publisher=" + publisher + ", imageCode=" + imageCode + ", publishDate="
				+ publishDate + ", currentPage=" + currentPage + ", itemsPerPage=" + itemsPerPage + ", totalItems="
				+ totalItems + ", totalPages=" + totalPages + "]";
	}



	
	
}
