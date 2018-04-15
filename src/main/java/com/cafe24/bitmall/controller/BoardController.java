	package com.cafe24.bitmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/board")
@Controller
public class BoardController {
	
	
	@RequestMapping( "/faq" )
	public String faq() {
		return "board/faq";
	}
	
	
	@RequestMapping( "/qna" )
	public String qna() {
		return "board/qa";
	}
}
