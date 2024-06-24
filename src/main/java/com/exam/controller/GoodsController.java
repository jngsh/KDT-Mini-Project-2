package com.exam.controller;

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
	
	@GetMapping(value={"/goodsDetail"})
    public String goodsDetail(@RequestParam("bookId") String bookId, ModelMap model) {
       
		GoodsDTO goodsRetrieve = goodsService.goodsRetrieve(bookId);
        
        if (goodsRetrieve == null) {
            return "error";
        }
        
        model.addAttribute("goodsRetrieve", goodsRetrieve);
        return "goodsDetail";
    }

}
