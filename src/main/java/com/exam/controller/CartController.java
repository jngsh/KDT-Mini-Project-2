package com.exam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.exam.dto.CartDTO;
import com.exam.dto.GoodsDTO;
import com.exam.dto.MemberDTO;
import com.exam.service.CartService;

@Controller
public class CartController {

    Logger logger = LoggerFactory.getLogger(getClass());


    CartService cartService;

    public CartController(CartService cartService) {

		this.cartService = cartService;
	}    
    
    

    @PostMapping("/addToCart")
    public @ResponseBody Map<String, String> addToCart(
            @RequestParam("bookId") String bookId,
            @RequestParam("cCount") int cCount,
            @RequestParam("totalPrice") int totalPrice,
            HttpSession session
    ) {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	MemberDTO xxx = (MemberDTO)auth.getPrincipal();

    	
    	String userId = xxx.getUserId();
    	
        CartDTO cartDTO = new CartDTO();
        
        if(cartService.selectBookId(bookId)!=null) {
        	
        	cartService.updateCartItem(userId, bookId, cCount, totalPrice);
        	
        }
        else {
        cartDTO.setUserId(userId);
        cartDTO.setBookId(bookId);
        cartDTO.setcCount(cCount);
        cartDTO.setTotalPrice(totalPrice);
        cartService.addToCart(cartDTO);

        
    }
        Map<String, String> response = new HashMap<>();
        response.put("message", bookId + "가 장바구니에 담겼습니다. 수량: " + cCount);
        response.put("redirect", "main"); // 리다이렉트할 경로 설정
        return response;
    }
        
    
    @GetMapping("/cartItems")
    public String cartList(@RequestParam("userId") String userId, Model m) {
    	
    	int cartItemCount = cartService.selectCart(userId);
    	List<CartDTO> cartList =  cartService.cartList(userId);
    	m.addAttribute("cartList",cartList);
    	m.addAttribute("cartItemCount", cartItemCount);
		
        return "cart";
    }
    
  
    @PostMapping("/cartDelete")
    public String deleteSelectedBooks(@RequestParam("selectedBookIds") String selectedBookIds,
                                      @RequestParam("userId") String userId) {
        String[] bookIds = selectedBookIds.split(",");
        
        // 선택된 책들 삭제 로직
        for (String bookId : bookIds) {
            cartService.deleteItem(bookId,userId);
        }
        
        // userId를 쿼리 파라미터로 함께 전달하여 cartItems 페이지로 리다이렉트
        return "redirect:/cartItems?userId=" + userId;
    }

    
    
}
