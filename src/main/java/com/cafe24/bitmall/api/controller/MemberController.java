	package com.cafe24.bitmall.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.dto.JSonResult;
import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.vo.MemberVo;
	
@RequestMapping("/api/member")
@Controller(value="memberApiController")
public class MemberController {
	@Autowired
	private MemberService memberServ;
	
	@ResponseBody
	@RequestMapping(value="/checkid", method=RequestMethod.GET)
	public JSonResult checkEmail(
			@RequestParam(value = "id", required = true, defaultValue="") String id ) {
		MemberVo vo = memberServ.getMember(id);
		System.out.println(id);
		return JSonResult.success(vo == null? "notExist" :"exist");
	}
}
