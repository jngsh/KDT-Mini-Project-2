package com.exam.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.dto.CartDTO;
import com.exam.dto.MemberDTO;
import com.exam.dto.OrderDTO;
import com.exam.service.CartService;
import com.exam.service.OrderService;

@Controller
public class OrderController {
	
	CartService cartService;
	OrderService orderService;

    public OrderController(CartService cartService, OrderService orderService) {

		this.cartService = cartService;
		this.orderService = orderService;
		
	}    
    
    @PostMapping("/purchaseBook")
    public @ResponseBody Map<String, String> purchaseSelectBooks(@RequestBody List<Map<Object, Object>> selectedBooks,
                                                                 HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        
        // 장바구니에서 선택된 책 삭제, 주문 테이블에 선택 된 책 저장
        for (Map<Object, Object> book : selectedBooks) {
            String bookId = (String) book.get("bookId");
//            System.out.println(bookId);
            int cCount = (int) book.get("cCount");
            System.out.println(cCount);
            int totalPrice = (int) book.get("totalPrice");
            System.out.println(totalPrice);
            String title = (String) book.get("title");
            System.out.println(title);
            LocalDate orderDate = LocalDate.now();
            System.out.println(orderDate);
            String imageCode = (String) book.get("imageCode");
            System.out.println(imageCode);
            // 장바구니에서 선택된 책 삭제
            cartService.deleteItem(bookId, userId);
            
            // 주문 테이블에 선택된 책 저장
            OrderDTO orderDTO = new OrderDTO();
            orderDTO.setBookId(bookId);
            orderDTO.setUserId(userId);
            orderDTO.setcCount(cCount);
            orderDTO.setTotalPrice(totalPrice);
            orderDTO.setTitle(title);
            orderDTO.setOrderDate(orderDate);
            orderDTO.setImageCode(imageCode);
            
            orderService.insertOrder(orderDTO);
        }
        
        Map<String, String> response = new HashMap<>();
        response.put("message", "구매완료되었습니다.");
        response.put("redirect", "cartItems");
        
        return response;
    }



//	@PostMapping("/addToCart")
//    public @ResponseBody Map<String, String> addToCart(
//            @RequestParam("bookId") String bookId,
//            @RequestParam("cCount") int cCount,
//            @RequestParam("totalPrice") int totalPrice,
//            HttpSession session
//    ) {
//    	
//    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//    	logger.info("logger:Authentication:{}", auth);
//    	MemberDTO xxx = (MemberDTO)auth.getPrincipal();
//    	logger.info("logger:Member:{}", xxx);
//    	String userId = xxx.getUserId();
//    	
//        CartDTO cartDTO = new CartDTO();
//        cartDTO.setUserId(userId);
//        cartDTO.setBookId(bookId);
//        cartDTO.setcCount(cCount);
//        cartDTO.setTotalPrice(totalPrice);
//        cartService.addToCart(cartDTO);
//
//        Map<String, String> response = new HashMap<>();
//        response.put("message", bookId + "가 장바구니에 담겼습니다. 수량: " + cCount);
//        response.put("redirect", "main"); // 리다이렉트할 경로 설정
//        return response;
//    }    
}
