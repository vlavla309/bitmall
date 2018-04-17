	package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.service.ProductService;
import com.cafe24.bitmall.util.ProductParam;

@RequestMapping("/product")
@Controller
public class ProductController {
	
	
	@Autowired
	private ProductService productServ;
	
	@RequestMapping(value= "", method=RequestMethod.GET )
	public String list(
			Model model,
			ProductParam params
			) {
		
		System.out.println(params);
		model.addAllAttributes(productServ.getProductListByParam(params));
		return "product/product";
	}
	
	@RequestMapping(value= "/{productNo}", method=RequestMethod.GET)
	public String detail(
			Model model,
			@PathVariable("productNo") Long productNo
			) {
		model.addAllAttributes(productServ.getProductDetail(productNo));
		return "product/product_detail";
	}
	
	@RequestMapping(value= "/search", method=RequestMethod.GET)
	public String search() {
		return "product/product_search";
	}
}
