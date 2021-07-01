/*=================
 	MemberMain.java
 	- 컨트롤러
===================*/
package com.test.playList;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class PlayListController
{
	//@@ 마이바티스가 일하기 위해 필요한 sqlSession
	//@@ 세터 완성하지 않더라도 오토와이어드로 셋 가능.
	//@@ 마이바티스를 사용하기 위해 sql Session 이 필요하고, 이건 dispatcher servlet 으로 가서
	//   스프링 컨테이너가 찾아서 이걸 딱.. 만들어서 주는 거임. 
	// mybatis 객체 의존성 (자동) 주입 ~~! ~! ~ ! ~!
	@Autowired
	private SqlSession sqlSession;
	
	// /memberlist.action
	//@@ Model 도 되고.. ModelMap 을 써두 됨. setAttribute 만 되면 되니깐
		  
	  @RequestMapping(value="/musicallist.action", method= {RequestMethod.POST, RequestMethod.GET})
	  public @ResponseBody Map<String, Object> getMusicalList(@RequestParam Map<String, Object> param) throws SQLException
	  {
		  IPlayListDAO dao = sqlSession.getMapper(IPlayListDAO.class);
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  
		  ArrayList<PlayList> list = dao.getMusicalList((String)param.get("playState"));
		  map.put("result", list);
		  
		  
		  return map;	  
	  }
	  
	  @RequestMapping(value="/musicalhome.action")
	  public String musicalHome()
	  {
		  return "WEB-INF/views/MusicalList.jsp";
	  }
		/*
		 * @SuppressWarnings("unchecked")
		 * 
		 * @RequestMapping(value="/musicallist.action") public void
		 * musicalList(HttpServletResponse resp, HttpServletRequest req) throws
		 * SQLException, IOException { IPlayListDAO dao =
		 * sqlSession.getMapper(IPlayListDAO.class);
		 * 
		 * ArrayList<PlayList> list = dao.getIngMusicalList();
		 * 
		 * JSONArray jsonArray = new JSONArray();
		 * 
		 * for (PlayList play : list) { JSONObject jsonObject = new JSONObject();
		 * jsonObject.put("playCd", play.getPlayCd()); jsonObject.put("playImg",
		 * play.getPlayImg());
		 * 
		 * jsonArray.add(jsonObject); }
		 * 
		 * 
		 * 
		 * for(int n=1; n<=5; n++) // 1 ~ 5 { StringBuffer sb = new StringBuffer();
		 * sb.append("{\"num\":\"" + n + "\""); sb.append(",\"name\":\"" + name + n +
		 * "\"");
		 * 
		 * result += sb.toString(); } JSONObject json = new JSONObject();
		 * json.put("list", list);
		 * 
		 * PrintWriter pw = resp.getWriter();
		 * 
		 * pw.println(json); }
		 * 
		 * 
		 * @ResponseBody
		 * 
		 * @RequestMapping(value="/musicallist.action", method = RequestMethod.POST)
		 * 
		 * 
		 * @RequestMapping(value="/musicallist.action", method = RequestMethod.POST)
		 * public String memberList(@RequestBody param) throws SQLException { //@@ dao
		 * 객체는 마이바티스가 생성해야 댐. //@@★★★★★★★★★★★★★★★★★★★★★★★★★★ 핵심 내용! IPlayListDAO dao =
		 * sqlSession.getMapper(IPlayListDAO.class); //IMeberDAO dao = new IMemberDAO();
		 * 
		 * ArrayList<PlayList> list= dao.getIngMusicalList());
		 * 
		 * 
		 * return "WEB-INF/views/MemberList.jsp?list=" + list; }
		 */
		 
}
