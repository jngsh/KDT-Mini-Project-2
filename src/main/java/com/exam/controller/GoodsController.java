package com.exam.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.dto.GoodsDTO;
import com.exam.service.GoodsService;


@Controller
public class GoodsController {
	
	
	GoodsService goodsService;
	
	
	public GoodsController(GoodsService goodsService) {

		this.goodsService = goodsService;
	}
	
//	@GetMapping("/goodsDetail")
	@GetMapping(value={"/goodsDetail"})
    public String goodsDetail(@RequestParam("bookId") String bookId, ModelMap model) {
       
		GoodsDTO goodsRetrieve = goodsService.goodsRetrieve(bookId);
        
        if (goodsRetrieve == null) {
            // 책 정보가 없을 경우 처리할 내용
            return "error"; // 예시로 "error" 페이지로 이동하도록 설정
        }
        
        model.addAttribute("goodsRetrieve", goodsRetrieve);
        return "goodsDetail"; // goodsDetail.jsp 페이지로 이동
    }

}
