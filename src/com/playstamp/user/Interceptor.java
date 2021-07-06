package com.playstamp.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter
{
	@Override
	public boolean preHandle(HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws Exception
	{
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("id"));
		
		if(session.getAttribute("id") == null)
		{
			System.out.println("비어있어...");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter printwriter = response.getWriter();
			
			printwriter.print("<script>alert('노오오오');"
					+ "location.href='signinform.action'</script>");
			printwriter.flush();
			printwriter.close();
			
			//response.sendRedirect("signinform.action");
			//return false;
			
	    }
		else
		{
			return true;
		}
		
		return true;
	}
	
}
