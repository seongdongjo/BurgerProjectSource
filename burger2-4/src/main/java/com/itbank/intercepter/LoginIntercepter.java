package com.itbank.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.itbank.member.MemberDTO;

public class LoginIntercepter extends HandlerInterceptorAdapter {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		HttpSession session = request.getSession();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		
		if(login != null) {
			return true;
		}
		
		String url = request.getRequestURL().toString();
		
		String cpath = request.getContextPath();
		
		response.sendRedirect(cpath + "/login?url=" + url);
		
		// 반환값에 따라서 요청에 대한 처리를 그대로 진행 -> true
		// 진행을 중단하고 새로운 응답을 만들어서 내보낸다 -> false
		return false;
	}
}
