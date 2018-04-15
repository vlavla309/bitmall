	package com.cafe24.bitmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/member")
@Controller
public class MemberController {
	
	@RequestMapping(value = "/join", method=RequestMethod.GET )
	public String joinform() {
		return "member/member_join";
	}
	
	@RequestMapping(value = "/login", method=RequestMethod.GET )
	public String login() {
		return "member/member_login";
	}
}
