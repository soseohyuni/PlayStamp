package com.playstamp.playreviewdetail.mybatis;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playstamp.play.PlayList;
import com.playstamp.play.mybatis.IPlayListDAO;
import com.playstamp.playreviewdetail.Comment;
import com.playstamp.playreviewdetail.Like;

@Controller
public class PlayReviewDetailController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="playreviewdetail.action", method=RequestMethod.GET)
	public String sendPlayReviewDetail(HttpServletRequest request, ModelMap model, HttpSession session) throws SQLException
	{
		IPlayReviewDetailDAO dao = sqlSession.getMapper(IPlayReviewDetailDAO.class);
		
		String playrev_cd = request.getParameter("playrev_cd");
		
		String user_cd = (String)session.getAttribute("code");
		
		Like like = new Like();
		
		like.setPlayrev_cd(playrev_cd);
		like.setUser_cd(user_cd);
		
		//@@ 좋아요 체크 메소드 
		int checkHeart = 0;
		
		//@@ 있을 경우 1, 없을 경우 0 반환
		if (dao.checkHeart(like) != 0)
			checkHeart = 1;
			
		model.addAttribute("checkHeart",checkHeart);
		
		//System.out.println(playrev_cd);
		// addAttribute 를 통해 전송
		model.addAttribute("playReviewDetail", dao.getPlayReviewDetail(playrev_cd));
		
		//@@ 코멘트 리스트 전송 구문도 추가
		model.addAttribute("commentList", dao.getCommentList(playrev_cd));
	
		return "WEB-INF/views/PlayReviewDetail.jsp";
	}

	
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
	
	//@@ 댓글 추가
	@RequestMapping(value="/commentadd.action", method= {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String addComment(@RequestBody Comment comment) throws SQLException
	{
		IPlayReviewDetailDAO dao = sqlSession.getMapper(IPlayReviewDetailDAO.class);	

		//System.out.println("닉:" + comment.getUser_nick());

		try
		{
			dao.addComment(comment);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return "success";
	}	
	
	//@@ 댓글 삭제
	@RequestMapping(value="/commentremove.action", method= {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String removeComment(@RequestBody Comment comment) throws SQLException
	{
		IPlayReviewDetailDAO dao = sqlSession.getMapper(IPlayReviewDetailDAO.class);	
		
		//System.out.println("댓글코드: " + comment.getComment_cd());
		
		try
		{
			dao.removeComment(comment);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return "success";
	}	
	
	//@@ 좋아요 버튼 클릭시 
	@RequestMapping(value="/heartclick.action", method= {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody Map<String, Object> addHeart(@RequestBody Like like, HttpSession session) throws SQLException
	{
		IPlayReviewDetailDAO dao = sqlSession.getMapper(IPlayReviewDetailDAO.class);	
		Map<String, Object> result = new HashMap<String, Object>(); 
		
		int returnValue = 0;
		
		try
		{	
			//@@ 이미 좋아요를 눌렀을 경우
			if (dao.checkHeart(like)!=0)
			{
				// 좋아요를 삭제하고 
				dao.delHeart(like);
				// 0을 반환
				returnValue = 0;
			}
			else if(dao.checkHeart(like)==0)
			{
				dao.addHeart(like);
				returnValue = 1;
			}
			
			
			result.put("lcount", dao.countHeart(like));
			result.put("returnValue", returnValue);

		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	/*
	 * //@@ 좋아요 삭제
	 * 
	 * @RequestMapping(value="/heartdel.action", method= {RequestMethod.POST,
	 * RequestMethod.GET}) public @ResponseBody int delHeart(@RequestBody Like like,
	 * HttpSession session) throws SQLException { IPlayReviewDetailDAO dao =
	 * sqlSession.getMapper(IPlayReviewDetailDAO.class); int result = 0;
	 * 
	 * try { dao.delHeart(like);
	 * 
	 * result = dao.countHeart(like);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return result; }
	 */
	
	
}
