	package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.vo.MemberVo;

@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberServ;
	
	@RequestMapping(value = "/join", method=RequestMethod.GET )
	public String joinform() {
		return "member/member_join";
	}
	
	@RequestMapping(value = "/join", method=RequestMethod.POST )
	public String join(MemberVo member) {
		System.out.println(member);
		memberServ.addMember(member);
		return "redirect:/member/welcome";
	}
	
	@RequestMapping(value = "/welcome", method=RequestMethod.GET )
	public String welcom() {
		return "member/member_joinend";
	}
	
	@RequestMapping(value = "/login", method=RequestMethod.GET )
	public String login() {
		return "member/member_login";
	}
}
