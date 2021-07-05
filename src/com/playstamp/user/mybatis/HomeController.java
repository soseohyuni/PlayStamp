package com.playstamp.user.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController
{
	@Autowired
	
	@RequestMapping("/main.action")
	public String mainView()
	{
		String result = "";
		
		result = "/WEB-INF/views/main/Main.jsp";

		return result;
	}
	
	@RequestMapping("/myspace.action")
	public String myspaceView()
	{
		String result = "";
		
		result = "/WEB-INF/views/myspace/MySpaceHome.jsp";

		return result;
	}
	
}
