	package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.service.OrderService;
import com.cafe24.bitmall.vo.OrderVo;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderServ;
	
		
	@RequestMapping( value = "/add", method=RequestMethod.GET)
	public String addOrder(
			Model model, 
			@RequestParam("data") String jsonStr) {
		System.out.println(jsonStr);
		model.addAllAttributes(orderServ.getOrderFormInfo(jsonStr));
		return "order/order_form";
	}
	
	@RequestMapping( value = "/pay", method=RequestMethod.GET)
	public String payOrder(
			OrderVo order) {
		return "order/order_pay";
	}
	
	@RequestMapping( value = "/ok", method=RequestMethod.GET)
	public String confirmOrder() {
		return "order/order_ok";
	}
	
	@RequestMapping( value = "/order", method=RequestMethod.GET)
	public String jumunOrder() {
		return "order/order";
	}
	
	@RequestMapping( value = "/orderinfo", method=RequestMethod.GET)
	public String jumun() {
		return "order/order_info";
	}
}
