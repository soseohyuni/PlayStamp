package com.playstamp.myactivity.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playstamp.paging.Criteria;
import com.playstamp.paging.PageDTO;
import com.playstamp.paging.ReverseCriteria;

@Controller
public class MyActivityController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 좋아요 누른 리뷰글 가져오기
	@RequestMapping(value="/mylikereviewlist.action", method=RequestMethod.GET)
	public String myLikeReviewlist(Criteria cri, Model model, HttpSession session, HttpServletRequest request)
	{
		IMyActivityDAO dao = sqlSession.getMapper(IMyActivityDAO.class);
		
		// 로그인 한 사용자 코드 가져오기
		//String user_cd = (String) session.getAttribute("code");
		String user_cd="U00003";
		
		// 페이지로부터 pageNum, amount 받아오기
		String pageNum = request.getParameter("pageNum");
		String amount = request.getParameter("amount");
		
		// 처음 페이지가 로드되었을 때는 pageNum, amount가 null 이므로
		// (사용자가 아직 페이지 번호를 누르지 않았기 때문에)
		// 1페이지에 10개의 글이 보이도록 설정한다.
		if(pageNum==null || amount==null)
		{
			pageNum="1";
			amount="10";
		}
		
		// 좋아요 한 리뷰의 전체 데이터 수 가져오기
		int total = dao.likeReviewCount(user_cd);
				
		// 페이지 번호 누를 때마다 그에 해당하는 글을 가져오기 위한 객체 준비
		ReverseCriteria rc = new ReverseCriteria();
		
		rc.setPageNum(Integer.parseInt(pageNum));
		rc.setAmount(Integer.parseInt(amount));
		rc.setTotal(total);
		rc.setUser_cd(user_cd);
		
		
		// 좋아요 한 리뷰의 전체 글 담기
		//-- 단, 페이지 클릭시마다 해당 내용만 가져올 수 있도록 Criteria를 매개변수로 받음
		model.addAttribute("likeList", dao.getLikeListWithPaging(rc));
		
		// 좋아요 한 리뷰의 전체 데이터 수 받아 PageDTO 구성해서 넘기기
		model.addAttribute("likePageMaker", new PageDTO(cri, total));
		//model.addAttribute("likePageMaker", new PageDTO(cri, playtotal));
		
		
		return "WEB-INF/views/myspace/MyLikeReviewList.jsp";
	}
	
	// 댓글 단 리뷰 글 가져오기
	@RequestMapping(value="/mycommentreviewlist.action", method=RequestMethod.GET)
	public String myCommentReviewlist(Criteria cri, Model model, HttpSession session, HttpServletRequest request)
	{
		IMyActivityDAO dao = sqlSession.getMapper(IMyActivityDAO.class);
		
		// 로그인 한 사용자 코드 가져오기
		//String user_cd = (String) session.getAttribute("code");
		String user_cd="U00001";
		//cri.setUser_cd(user_cd);
		
		// 페이지로부터 pageNum, amount 받아오기
		String pageNum = request.getParameter("pageNum");
		String amount = request.getParameter("amount");
		
		// 처음 페이지가 로드되었을 때는 pageNum, amount가 null 이므로
		// (사용자가 아직 페이지 번호를 누르지 않았기 때문에)
		// 1페이지에 10개의 글이 보이도록 설정한다.
		if(pageNum==null || amount==null)
		{
			pageNum="1";
			amount="10";
		}
		
		// 좋아요 한 리뷰의 전체 데이터 수 가져오기
		int total = dao.commentReviewCount(user_cd);
				
		// 페이지 번호 누를 때마다 그에 해당하는 글을 가져오기 위한 객체 준비
		ReverseCriteria rc = new ReverseCriteria();
		
		rc.setPageNum(Integer.parseInt(pageNum));
		rc.setAmount(Integer.parseInt(amount));
		rc.setTotal(total);
		rc.setUser_cd(user_cd);
		
		// 댓글 단 리뷰의 전체 글 담기
		model.addAttribute("commentList", dao.getCommentListWithPaging(rc));
		
		// 댓글 단 리뷰의 전체 데이터 수 받아 PageDTO 구성해서 넘기기
		model.addAttribute("commentPageMaker", new PageDTO(cri, total));
		
		
		return "WEB-INF/views/myspace/MyCommentReviewList.jsp";
	}
	
	
	
	// 글 제목 누르면 해당 리뷰글 요청 리다이렉트
	// public void goToReviewDetail(String rev_distin_cd);
}
