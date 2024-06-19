package com.exam.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.dto.GoodsDTO;
import com.exam.service.GoodsService;




@Controller
public class MainController {

	Logger logger = LoggerFactory.getLogger(getClass());

	GoodsService goodsService;
	
	
	public MainController(GoodsService goodsService) {

		this.goodsService = goodsService;
	}

	@GetMapping("/main")
	public String main(@RequestParam(required = false) String category,
			ModelMap m) {
	    
	    List<GoodsDTO> goodsList;
  
	    if (category == null || category.isEmpty()) {
	        goodsList = goodsService.selectAll(); // 모든 책들을 가져오는 메서드
	    
	    } else {
	    	goodsList = goodsService.goodsList(category);
        
	    }
	    m.addAttribute("goodsList", goodsList);
	    logger.info("logger: ",m);

	    return "main";
	}
	
//	@GetMapping("/main")
//	public String main(@RequestParam(required = false) String category,
//	                   ModelMap m) {
//	    
////	    // 한 페이지에 보여줄 상품 수
////	    int itemsPerPage = 8;
////	    
////	    // 현재 페이지에서 가져올 상품의 시작 위치 계산
////	    int offset = (page - 1) * itemsPerPage;
////	    
////	    List<GoodsDTO> goodsList;
////	    int totalItems;
////	    
//	    if (category == null || category.isEmpty()) {
//	        // 전체 상품 수
////	        totalItems = goodsService.selectAll().size();
////	        
//	        // 페이징 처리된 전체 상품 목록 가져오기
//	        goodsList = goodsService.selectAll();
//	    } else {
//	        // 특정 카테고리에 속하는 상품 수
////	        totalItems = goodsService.countGoodsByCategory(category);
////	        
//	        // 특정 카테고리의 페이징 처리된 상품 목록 가져오기
//	        goodsList = goodsService.goodsList(category);
//	    }
//	    
//	    // 전체 페이지 수 계산
////	    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
////	    
////	
////	    m.addAttribute("currentPage", page);
////
////	    m.addAttribute("totalPages", totalPages);
////	
////	    m.addAttribute("totalItems", totalItems);
//	    // 상품 목록을 모델에 추가
//	    m.addAttribute("goodsList", goodsList);

//	    return "main";
//	}


}