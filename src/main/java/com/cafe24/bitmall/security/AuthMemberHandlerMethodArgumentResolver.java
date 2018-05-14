package com.cafe24.bitmall.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.cafe24.bitmall.vo.MemberVo;

public class AuthMemberHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {

	@Override
	public Object resolveArgument(
		MethodParameter parameter,
		ModelAndViewContainer mavContainer,
		NativeWebRequest webRequest,
		WebDataBinderFactory binderFactory) throws Exception {
		System.out.println("아규먼트 리졸버");
		if( supportsParameter( parameter ) == false ) {
			return WebArgumentResolver.UNRESOLVED;
		}
		
		// @AuthMember가 붙어 있고 파라미터 타입이 UserMember
		HttpServletRequest request = 
			webRequest.getNativeRequest( HttpServletRequest.class );
		
		HttpSession session = request.getSession();
		if( session == null ) {
			return null;
		}
		
		return session.getAttribute( "authMember" );
	}

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		//1. @AuthMember 가 붙어 있는지 확인
		AuthMember authMember = 
			parameter.getParameterAnnotation( AuthMember.class );
		
		//2. @AuthMember 가 안 붙어 있음
		if( authMember == null ) {
			return false;
		}
		
		//3. Type이 MemberVo가 아님
		if(parameter.getParameterType().equals(MemberVo.class) == false) {
			return false;
		}
		
		return true;
	}

}
