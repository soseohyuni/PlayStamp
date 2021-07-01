package com.playstamp.myspace;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MySpaceController
{
	
	@RequestMapping("/pointlist.action")
	public String pointView()
	{
		String result = "";
		
		result = "/WEB-INF/views/myspace/PointList.jsp";

		return result;
	}
	
	@RequestMapping("/cashlist.action")
	public String cashView()
	{
		String result = "";
		
		result = "/WEB-INF/views/myspace/CashList.jsp";

		return result;
	}
}
