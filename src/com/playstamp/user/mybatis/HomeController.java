package com.playstamp.user.mybatis;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController
{
	@RequestMapping("/main.action")
	public String mainView()
	{
		String result = "";
		
		// 추후 세션 분기처리 추가
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
