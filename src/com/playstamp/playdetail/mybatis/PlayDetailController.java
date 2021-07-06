/*===========================
 	PlayDetailController.java
 	- 컨트롤러
============================*/

package com.playstamp.playdetail.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playstamp.playdetail.Jjim;
import com.playstamp.playdetail.SeatRev;
import com.playstamp.playreviewdetail.Like;
import com.playstamp.playreviewdetail.mybatis.IPlayReviewDetailDAO;

@Controller
public class PlayDetailController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value="playdetail.action", method=RequestMethod.GET)
	public String sendPlayDetail(HttpServletRequest request, ModelMap model, HttpSession session) throws SQLException
	{
		IPlayDetailDAO dao = sqlSession.getMapper(IPlayDetailDAO.class);
		String play_cd = request.getParameter("play_cd");
		String user_cd = (String)session.getAttribute("code");
		
		// 변수 선언 및 초기화
		int mseatCheck = 0;
		int seatCheck = 0;
		
		ArrayList<SeatRev> seatRev = new ArrayList<SeatRev>();
		
		// 어떤 seatRev 를 가지고 갈 것인지 판별
		if (dao.getMseatCheck(play_cd) != null)
			mseatCheck = dao.getMseatCheck(play_cd);
		if (dao.getSeatCheck(play_cd) != null)
			seatCheck = dao.getSeatCheck(play_cd);
				
		if(mseatCheck > 0)
			seatRev = dao.getMseatRev(play_cd);
		if(seatCheck > 0)
			seatRev = dao.getSeatRev(play_cd);
		
		//@@ 좋아요 체크 메소드 
		int checkJjim = 0;
		
		Jjim jjim = new Jjim();
		
		jjim.setPlay_cd(play_cd);
		jjim.setUser_cd(user_cd);
		
		//@@ 있을 경우 1, 없을 경우 0 반환
		if (dao.checkJjim(jjim) != 0)
			checkJjim = 1;
			
		model.addAttribute("checkJjim",checkJjim);
				
		// addAttribute 를 통해 전송
		model.addAttribute("seatRevList", seatRev);
		model.addAttribute("playDetailList", dao.getPlayDetail(play_cd));
		model.addAttribute("playRevPreList", dao.getPlayRevPre(play_cd));
		
		//테스트
		//System.out.println("값: " + play_cd);
		return "WEB-INF/views/PlayDetail.jsp";
	}
	
	//@@ 찜 버튼 클릭시 
	@RequestMapping(value="/jjimclick.action", method= {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Map<String, Object> addHeart(@RequestBody Jjim jjim, HttpSession session) throws SQLException
	{
		IPlayDetailDAO dao = sqlSession.getMapper(IPlayDetailDAO.class);	
		Map<String, Object> result = new HashMap<String, Object>(); 
		
		int returnValue = 0;
		
		try
		{	
			//@@ 이미 좋아요를 눌렀을 경우
			if (dao.checkJjim(jjim)!=0)
			{
				// 좋아요를 삭제하고 
				dao.delJjim(jjim);
				// 0을 반환
				returnValue = 0;
			}
			else if(dao.checkJjim(jjim)==0)
			{
				dao.addJjim(jjim);
				returnValue = 1;
			}
			
			
			result.put("returnValue", returnValue);

		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
}
