package com.mftour.spring.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MyHandlerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// 就简单判断了一下，如果要详细控制可以用spring security
	
		/* if(url.endsWith("welcome")) */
		return true;
		/*
		 * if(url.contains("/apk/")) return true; if(request.getSession() !=
		 * null &&
		 * request.getSession().getAttribute(Constants.USER_INFO_SESSION) !=
		 * null) return true;
		 * 
		 * response.sendRedirect(request.getContextPath() + "/index.jsp");
		 * return false;
		 */

	}

}
