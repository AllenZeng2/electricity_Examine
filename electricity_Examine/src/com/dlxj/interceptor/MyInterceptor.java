package com.dlxj.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.dlxj.entity.Users;

public class MyInterceptor implements HandlerInterceptor {
	@Override
	// ���Ʋ�������ϣ�������ת���
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	// ���Ʋ�������ϣ���û��ת
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	// ���Ʋ�����֮ǰ
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		Users u = (Users) request.getSession().getAttribute("user");
		if (u == null) {
			response.sendRedirect("login.jsp");
			return false;
		} else
			return true;

	}
}
