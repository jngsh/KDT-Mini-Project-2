package com.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.service.CartService;

@Controller
public class OrderController {
	
	CartService cartService;

    public OrderController(CartService cartService) {

		this.cartService = cartService;
	}    
    
	
	@PostMapping("/purchaseBook")
    public String purchaseSelectBooks(@RequestParam("selectedBookIds") String selectedBookIds,
                                      @RequestParam("userId") String userId) {
        String[] bookIds = selectedBookIds.split(",");
        
        // 장바구니에서 선택된 책 삭제, 주문 테이블에 선택 된 책 저장
        for (String bookId : bookIds) {
            cartService.deleteItem(bookId,userId);
            
        }
        
        // userId를 쿼리 파라미터로 함께 전달하여 cartItems 페이지로 리다이렉트
        return "redirect:/cartItems?userId=" + userId;
    }

    
}
