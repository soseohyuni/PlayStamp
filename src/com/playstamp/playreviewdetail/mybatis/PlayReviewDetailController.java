package com.playstamp.playreviewdetail.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playstamp.play.PlayList;
import com.playstamp.play.mybatis.IPlayListDAO;
import com.playstamp.playreviewdetail.Comment;

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
	
	/*
	 * @RequestMapping(value="comment.action", method=RequestMethod.GET)
	 * 
	 * @ResponseBody public String sendCommentList(HttpServletRequest request,
	 * ModelMap model) throws SQLException { IPlayReviewDetailDAO dao =
	 * sqlSession.getMapper(IPlayReviewDetailDAO.class);
	 * 
	 * String playrev_cd = request.getParameter("playrev_cd");
	 * 
	 * //System.out.println(playrev_cd); // addAttribute 를 통해 전송
	 * model.addAttribute("commentList", dao.getCommentList(playrev_cd));
	 * 
	 * return "WEB-INF/views/PlayReviewDetail.jsp"; }
	 */
	
	//@@ ajax 로 댓글 리스트 전송
	@RequestMapping(value="/comment.action", method= RequestMethod.GET)
	public @ResponseBody ArrayList<Comment> getCommentList(@RequestParam("playrev_cd") String playrev_cd) throws SQLException
	{
		IPlayReviewDetailDAO dao = sqlSession.getMapper(IPlayReviewDetailDAO.class);
		
		//String playrev_cd = request.getParameter("playrev_cd");
		
		//Map<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<Comment> result = dao.getCommentList(playrev_cd);
		//map.put("result", list);
		
		return result;	  
	}	
}
