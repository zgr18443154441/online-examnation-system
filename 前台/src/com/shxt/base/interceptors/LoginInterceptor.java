package com.shxt.base.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	private HttpSession session;

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		session = request.getSession();
		String url = request.getServletPath();
		if("/login.jsp".equals(url) || "/user/login".equals(url)|| "/user/to_register".equals(url)|| "/user/register".equals(url)|| "/user/built_account".equals(url)){
			return true;
		}else if(session.getAttribute("islogin")=="success"){
			return true;
		}
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		return false;
	}

}
