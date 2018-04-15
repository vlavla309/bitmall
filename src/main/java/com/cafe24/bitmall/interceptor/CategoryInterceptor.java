package com.cafe24.bitmall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.service.CategoryService;

public class CategoryInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private CategoryService categoryServ;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

		if(modelAndView != null) {
			modelAndView.addAllObjects(categoryServ.getCategories());
		}
		super.postHandle(request, response, handler, modelAndView);
	}



}
