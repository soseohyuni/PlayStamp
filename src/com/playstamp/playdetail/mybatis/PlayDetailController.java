/*===========================
 	PlayDetailController.java
 	- 컨트롤러
============================*/

package com.playstamp.playdetail.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playstamp.playdetail.SeatRev;

@Controller
public class PlayDetailController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value="playdetail.action", method=RequestMethod.GET)
	public String sendPlayDetail(HttpServletRequest request, ModelMap model) throws SQLException
	{
		IPlayDetailDAO dao = sqlSession.getMapper(IPlayDetailDAO.class);
		String play_cd = request.getParameter("play_cd");
		
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
		
		// addAttribute 를 통해 전송
		model.addAttribute("seatRevList", seatRev);
		model.addAttribute("playDetailList", dao.getPlayDetail(play_cd));
		model.addAttribute("playRevPreList", dao.getPlayRevPre(play_cd));
		
		//테스트
		//System.out.println("값: " + play_cd);
		return "WEB-INF/views/PlayDetail.jsp";
	}
}
