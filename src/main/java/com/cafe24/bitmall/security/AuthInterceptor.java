package com.cafe24.bitmall.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.vo.MemberVo;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(
		HttpServletRequest request,
		HttpServletResponse response,
		Object handler)
			throws Exception {
		//1. handler 종류 확인
		if( handler instanceof HandlerMethod == false ) {
			return true;
		}
		
		//2. casting
		HandlerMethod handlerMethod = (HandlerMethod)handler; 
		
		//3. @Auth 받아오기.
		Auth auth = handlerMethod.getMethodAnnotation( Auth.class );

		//4. Method에 @Auth가 없는 경우
		if( auth == null ) {
			return true;
		}
		
		System.out.println(request.getRequestURL());
		System.out.println(request.getRequestURI());
		//5. @Auth 가 붙어 있는 경우, 인증여부 체크
		HttpSession session = request.getSession();
		if( session == null ) {
			response.sendRedirect( request.getContextPath() + "/member/login?returnURI="+request.getRequestURI() );
			return false;
		}
		
		MemberVo authUser = (MemberVo)session.getAttribute( "authMember" );
		if( authUser == null ) {
			response.sendRedirect( request.getContextPath() + "/member/login?returnURI="+request.getRequestURI() );
			return false;
		}
		
		//6. 접근 허가
		return true;
	}
}
