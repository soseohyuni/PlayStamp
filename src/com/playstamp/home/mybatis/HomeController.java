package com.playstamp.home.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController
{
	
	@RequestMapping("/home.action")
	public String mainView(HttpServletRequest request)
	{
		String result = "";
		
		int nonuser = 0;
		
		HttpSession session = request.getSession();
		session.setAttribute("nonuser", nonuser);
		
		result = "/WEB-INF/views/main/Home.jsp";

		return result;
	}
	
	@RequestMapping("/managerhome.action")
	public String adminHome()
	{
		String result = "";
		
		result = "/WEB-INF/views/manager/ManagerHome.jsp";

		return result;
	}
	
}
