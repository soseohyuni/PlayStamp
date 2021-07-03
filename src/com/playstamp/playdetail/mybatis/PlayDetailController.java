/*===========================
 	PlayDetailController.java
 	- 컨트롤러
============================*/

package com.playstamp.playdetail.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

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
	public String sendPlayDetail(ModelMap model, String play_cd) throws SQLException
	{
		IPlayDetailDAO dao = sqlSession.getMapper(IPlayDetailDAO.class);
		
		// 변수 선언 및 초기화
		int mseatCheck = 0;
		int seatCheck = 0;
		
		ArrayList<SeatRev> seatRev = new ArrayList<SeatRev>();
		
		// 어떤 seatRev 를 가지고 갈 것인지 판별
		mseatCheck = dao.getMseatCheck(play_cd);
		seatCheck = dao.getSeatCheck(play_cd);
		
		if(mseatCheck > 0)
			seatRev = dao.getMseatRev(play_cd);
		else if (seatCheck > 0)
			seatRev = dao.getSeatRev(play_cd);
		
		// addAttribute 를 통해 전송
		model.addAttribute("seatRev", seatRev);
		model.addAttribute("playDetail", dao.getPlayDetail(play_cd));
		model.addAttribute("playRevPre", dao.getPlayRevPre(play_cd));
		
		return "WEB-INF/views/PlayDetail.jsp";
	}
}
