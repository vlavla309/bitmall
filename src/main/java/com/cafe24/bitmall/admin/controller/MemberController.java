package com.cafe24.bitmall.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.service.AdminService;
import com.cafe24.bitmall.service.ProductService;
import com.cafe24.bitmall.vo.ProductVo;

@RequestMapping("/admin/member")
@Controller(value="adminMemberController")
public class MemberController {
	
	//Member
	@RequestMapping(value = "", method = RequestMethod.GET )
	public String member() {
		return "admin/member";
	}

}
