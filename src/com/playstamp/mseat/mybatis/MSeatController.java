package com.playstamp.mseat.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playstamp.mseat.MSeatDTO;


@Controller
public class MSeatController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/mseat.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String mSeatMain()	
	{
		return "WEB-INF/views/MSeatMain.jsp";
		
	}
	
	@RequestMapping(value = "/seatratingprint.action",method= {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody Map<String, Object> listSac(@RequestParam Map<String, Object> param) throws SQLException 
	{
		IMSeatDAO dao = sqlSession.getMapper(IMSeatDAO.class);
		
		Map<String, Object> map = new HashMap<String, Object>();
		  
		ArrayList<MSeatDTO> listSac = dao.listSac((String)param.get("seatName"));
		
		// 테스트
		//System.out.println((String)param.get("seatName"));
		
		map.put("listSac", listSac);
		
		return map;	  
	}		 
}
