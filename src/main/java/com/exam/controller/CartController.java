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
        Object principal = auth.getPrincipal();
        
        if (principal instanceof MemberDTO) {
            MemberDTO xxx = (MemberDTO) principal;
            String userId = xxx.getUserId();
            
            
            
            if (cartService.selectBookId(bookId,userId) != null) {
                cartService.updateCartItem(userId, bookId, cCount, totalPrice);
            } else {
            	CartDTO cartDTO = new CartDTO();
                cartDTO.setUserId(userId);
                cartDTO.setBookId(bookId);
                cartDTO.setcCount(cCount);
                cartDTO.setTotalPrice(totalPrice);
                cartService.addToCart(cartDTO);
            }
            
            Map<String, String> response = new HashMap<>();
            response.put("message", bookId + "가 장바구니에 담겼습니다. 수량: " + cCount);
            response.put("redirect", "main");
            return response;
        } else {
            Map<String, String> response = new HashMap<>();
            response.put("message", "로그인이 필요한 서비스입니다.");
            response.put("redirect", "login");
            return response;
        }
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
        
        for (String bookId : bookIds) {
            cartService.deleteItem(bookId,userId);
        }
        
        return "redirect:/cartItems?userId=" + userId;
    }

    
    
}
