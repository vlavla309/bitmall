	package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.security.Auth;
import com.cafe24.bitmall.security.AuthMember;
import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.service.OrderService;
import com.cafe24.bitmall.util.OrderParam;
import com.cafe24.bitmall.vo.MemberVo;
	
@RequestMapping("/member")
@Controller
public class MemberController {
	private static final int ORDER_PER_PAGE = 3;
	private static final int PAGINATION_PER_PAGE = 5;
	
	@Autowired
	private MemberService memberServ;
	@Autowired
	private OrderService orderServ;
	
	@RequestMapping(value = "/join", method=RequestMethod.GET )
	public String joinform(@AuthMember MemberVo authMember) {
		if(authMember != null) {
			return "redirect:/";
		}
		return "member/member_join";
	}
	
	@RequestMapping(value = "/join", method=RequestMethod.POST )
	public String join(MemberVo member) {
		System.out.println(member);
		memberServ.addMember(member);
		return "redirect:/member/welcome";
	}
	
	@RequestMapping(value = "/welcome", method=RequestMethod.GET )
	public String welcom(@AuthMember MemberVo authMember) {
		if(authMember != null) {
			return "redirect:/";
		}
		return "member/member_joinend";
	}
	
	@RequestMapping(value = "/login", method=RequestMethod.GET )
	public String login(
			Model model, 
			@AuthMember MemberVo authMember,
			@RequestParam(value = "returnURI", required=false, defaultValue="") String returnURI,
			@RequestHeader HttpHeaders headers) {
		System.out.println(headers);
		if(authMember != null) {
			return "redirect:/";
		}
		
		if(returnURI.equals("")) {
			returnURI=headers.get("referer").get(0);
		}
		model.addAttribute("returnURI", returnURI);
		return "member/member_login";
	}
	
	@Auth
	@RequestMapping(value = "/modify", method=RequestMethod.GET )
	public String modifyForm(
			Model model, 
			@AuthMember MemberVo authMember) {
		model.addAllAttributes(memberServ.getModifyMember(authMember.getNo()));
		return "member/member_modify";
	}
	
	@Auth
	@RequestMapping("/order")
	public String myOrder(
			Model model,
			@AuthMember MemberVo authMember,
			OrderParam params
			) {
		params.setSearchType("member");
		params.setSearchValue(authMember.getNo()+"");
		//System.out.println(params);
		model.addAllAttributes(orderServ.getOrderListByParam(params,ORDER_PER_PAGE, PAGINATION_PER_PAGE));
		return "order/order";
	}
	
	
	@RequestMapping("/agreement")
	public String agreement(
			Model model,
			@AuthMember MemberVo authMember,
			OrderParam params
			) {
		if(authMember != null) {
			return "redirect:/";
		}
		return "member/member_agree";
	}
}
