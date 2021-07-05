package com.playstamp.playreviewdetail.mybatis;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PlayReviewDetailController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="playreviewdetail.action", method=RequestMethod.GET)
	public String sendPlayReviewDetail(HttpServletRequest request, ModelMap model) throws SQLException
	{
		IPlayReviewDetailDAO dao = sqlSession.getMapper(IPlayReviewDetailDAO.class);
		
		String playrev_cd = request.getParameter("playrev_cd");
		
		//System.out.println(playrev_cd);
		// addAttribute 를 통해 전송
		model.addAttribute("playReviewDetail", dao.getPlayReviewDetail(playrev_cd));

		return "WEB-INF/views/PlayReviewDetail.jsp";
	}
}
