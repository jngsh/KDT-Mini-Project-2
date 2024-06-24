package com.exam.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.dto.GoodsDTO;
import com.exam.service.CartService;
import com.exam.service.GoodsService;




@Controller
public class MainController {

	Logger logger = LoggerFactory.getLogger(getClass());

	GoodsService goodsService;
	CartService cartService;
	
	
	public MainController(GoodsService goodsService, CartService cartService) {
        this.cartService = cartService;
		this.goodsService = goodsService;
	}

	@GetMapping(value={"/main"})
	public String main(@RequestParam(required = false) String category,
			ModelMap m, HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
		int cartItemCount = cartService.selectCart(userId);
		System.out.println("++++===========");
		System.out.println(cartItemCount);
		
		m.addAttribute("cartItemCount", cartItemCount);
	    
		cartService.cartList(category);
	    
	    List<GoodsDTO> goodsList;
  
	    if (category == null || category.isEmpty()) {
	        goodsList = goodsService.selectAll();

	        
	    } else {

	    	goodsList = goodsService.goodsList(category);
        
	    }
	    m.addAttribute("goodsList", goodsList);

	    return "main";
	}

}