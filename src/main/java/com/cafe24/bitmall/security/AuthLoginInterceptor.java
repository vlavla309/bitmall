package com.cafe24.bitmall.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.vo.MemberVo;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter {

	//@Autowired
	//private UserService userService;
	
	@Override
	public boolean preHandle(
		HttpServletRequest request,
		HttpServletResponse response,
		Object handler)
		throws Exception {
		
		String id = request.getParameter( "id" );
		String password = request.getParameter( "password" );
		
		System.out.println("id:"+id);
		System.out.println("password:"+password);
		
		
		ApplicationContext ac = 
		WebApplicationContextUtils.
		getWebApplicationContext(request.getServletContext());
		
		MemberService memberService = ac.getBean(MemberService.class);
		MemberVo authMember = memberService.getAuthMember(id, password);
		
		if(authMember == null) {
			response.sendRedirect( request.getContextPath() + "/member/login" );
			return false;
		}
		
		HttpSession session = request.getSession(true);
		session.setAttribute( "authMember", authMember);
		response.sendRedirect( request.getContextPath() );
		
		return false;
	}

}