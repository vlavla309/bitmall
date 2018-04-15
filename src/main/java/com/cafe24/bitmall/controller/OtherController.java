	package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.util.ProductParam;


@Controller
public class OtherController {
	
	@Autowired
	private CartService cartServ;
	
	@RequestMapping( "/cart" )
	public String cart(
			Model model, 
			ProductParam params,
			@CookieValue("cart") String cartCookieValue
			) {
		System.out.println(cartCookieValue);
		
		model.addAllAttributes(cartServ.getCartInfo(cartCookieValue));
		return "cart";
	}
	@RequestMapping( "/company" )
	public String company(Model model, ProductParam params) {
		return "company";
	}
	@RequestMapping( "/policy" )
	public String policy(Model model, ProductParam params) {
		return "policy";
	}
	@RequestMapping( "/info" )
	public String useinfo(Model model, ProductParam params) {
		return "useinfo";
	}
}
