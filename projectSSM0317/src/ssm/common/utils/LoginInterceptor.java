package ssm.common.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		try { //logininfo 세션값이 널일경우 
			System.out.println("LoginInterceptor handle try>>>>");
			System.out.println(">>>>>>>>>>>>>>>>>>뭐양" + request.getSession().getAttribute("isLogOn"));
			
			
			if(request.getSession().getAttribute("isLogOn") == null ){ //로그인페이지로 redirect 
				response.setContentType("text/html; charset=EUC-KR");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
				out.flush();
//				response.sendRedirect(request.getContextPath()+"/"); 
				return false; 
			}//if 
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return true; //널이 아니면 정상적으로 컨트롤러 호출 
	}//preHandle

}//class
