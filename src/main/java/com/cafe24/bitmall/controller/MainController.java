	package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.bitmall.service.CategoryService;
import com.cafe24.bitmall.service.ProductService;
import com.cafe24.bitmall.util.ProductParam;

@Controller
public class MainController {
	private static final int PRODUCT_PER_PAGE = 8;
	
	@Autowired
	private ProductService productServ;
	@Autowired
	private CategoryService categoryServ;
	
	@RequestMapping( "" )
	public String index(Model model, ProductParam params) {
		params.setSort("new");
		model.addAllAttributes(productServ.getProductListByParam(params, PRODUCT_PER_PAGE, 1));
		model.addAllAttributes(categoryServ.getCategories());
		return "main/index";
	}
}
