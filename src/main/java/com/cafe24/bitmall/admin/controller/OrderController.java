package com.cafe24.bitmall.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.service.AdminService;
import com.cafe24.bitmall.service.OrderService;
import com.cafe24.bitmall.util.OrderParam;

@RequestMapping("/admin/order")
@Controller(value="adminOrderController")
public class OrderController {
	private static final int ORDER_PER_PAGE = 5;
	private static final int PAGINATION_PER_PAGE = 5;
	
	@Autowired
	private AdminService adminServ;
	@Autowired
	private OrderService orderServ;

	//Order
	@RequestMapping(value="", method=RequestMethod.GET)
	public String listOrder(
			Model model,
			OrderParam params) {
		
		System.out.println(params);
		model.addAllAttributes(orderServ.getOrderListByParam(params,ORDER_PER_PAGE, PAGINATION_PER_PAGE));
		return "admin/order";
	}

	//Order
	@RequestMapping(value="/{orderCode}", method=RequestMethod.GET)
	public String orderInfo(
			Model model,
			@ModelAttribute("params") OrderParam params,
			@PathVariable("orderCode") String orderCode) {
		params.build();
		model.addAllAttributes(orderServ.getOrderDetail(orderCode));
		return "admin/order_info";
	}
	
	@RequestMapping(value="/edit/{orderCode}", method=RequestMethod.POST)
	public String setOrderStatus(
			Model model,
			@PathVariable("orderCode") String orderCode,
			@RequestParam("status") String status) {
		System.out.println(orderCode);
		System.out.println(status);
		orderServ.setOrderStatus(orderCode, status);
		return "redirect:/admin/order";
	}
}
