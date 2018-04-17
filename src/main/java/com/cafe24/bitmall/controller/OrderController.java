	package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.security.AuthMember;
import com.cafe24.bitmall.service.OrderService;
import com.cafe24.bitmall.vo.MemberVo;
import com.cafe24.bitmall.vo.OrderVo;
import com.cafe24.bitmall.vo.PaymentCardVo;
import com.cafe24.bitmall.vo.PaymentDepositVo;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderServ;
	
		
	@RequestMapping( value = "/add", method=RequestMethod.POST)
	public String addOrder(
			Model model, 
			@AuthMember MemberVo authMember,
			@RequestParam("data") String jsonStr,
			@RequestParam(value = "cart", required=false, defaultValue="") String cart) {
		System.out.println(jsonStr);
		model.addAllAttributes(orderServ.getOrderFormInfo(jsonStr, authMember));
		model.addAttribute("cart", cart);
		return "order/order_form";
	}
	
	@RequestMapping( value = "/pay", method=RequestMethod.POST)
	public String payOrder(
			Model model, 
			@AuthMember MemberVo authMember,
			@RequestParam("data") String jsonStr,
			OrderVo order) {
		//System.out.println(jsonStr);
		//System.out.println(order);
		model.addAttribute("order", order);
		model.addAllAttributes(orderServ.getOrderFormInfo(jsonStr, authMember));
		return "order/order_pay";
	}
	
	@RequestMapping( value = "/submit", method=RequestMethod.POST)
	public String submitOrder(
			Model model, 
			@RequestParam("data") String jsonStr,
			OrderVo order,
			PaymentCardVo card,
			PaymentDepositVo deposit
			) {
		
		
		orderServ.addOrder(order, jsonStr, card, deposit);
		
		return "redirect:/order/done?code="+order.getCode();
	}
	
	@RequestMapping( value = "/done", method=RequestMethod.GET)
	public String confirmOrder(
			Model model,
			@RequestParam("code") String orderCode) {
		System.out.println(orderCode);
		model.addAttribute("orderCode", orderCode);
		return "order/order_ok";
	}
	
	@RequestMapping( value = "", method=RequestMethod.GET)
	public String orderList(@AuthMember MemberVo authMember) {
		if(authMember != null) {
			return "redirect:/member/order";
		}
		return "member/member_login_with_order";
	}
	
	@RequestMapping( value = "/{orderCode}", method=RequestMethod.GET)
	public String orderDetail(
			Model model, 
			@PathVariable("orderCode") String orderCode) {
		model.addAllAttributes(orderServ.getOrderDetail(orderCode));
		return "order/order_info";
	}
}
