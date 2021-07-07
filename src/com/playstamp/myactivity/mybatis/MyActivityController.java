package com.playstamp.myactivity.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playstamp.paging.Criteria;
import com.playstamp.paging.PageDTO;

@Controller
public class MyActivityController
{
	@Autowired
	private SqlSession sqlSession;
	
	// PageDTO를 사용할 수 있도록 Model에 담아서 화면에 전달하는 메소드
	@RequestMapping(value="/mylikecommentreviewlist.action", method=RequestMethod.GET)
	public String myLikeCommentReviewlist(Criteria cri, Model model)
	{
		IMyActivityDAO dao = sqlSession.getMapper(IMyActivityDAO.class);
		
		// 임시 테스트
		String user_cd = "U00003"; //-- 좋아요 테스트
		//String user_cd = "U0001"; //-- 댓글 테스트
		
		// 한 페이지에 보여지게 할 게시물 수, 특정한 페이지 조회시 사용하기 위해
		// Criteria 객체 생성 (매개변수로 받음)
		
		// 좋아요 한 리뷰의 전체 데이터 수 가져오기
		int liketotal = dao.likeReviewCount(user_cd);
		
		// 댓글 단 리뷰의 전체 데이터 수 가져오기
		int commenttotal = dao.commentReviewCount(user_cd);
		
		// 좋아요 한 리뷰의 전체 글 담기
		//-- 단, 페이지 클릭시마다 해당 내용만 가져올 수 있도록 Criteria를 매개변수로 받음
		model.addAttribute("likeList", dao.getLikeListWithPaging(cri, user_cd));
		
		// 댓글 단 리뷰의 전체 글 담기
		model.addAttribute("commentList", dao.getCommentListWithPaging(cri, user_cd));
		
		// 좋아요 한 리뷰의 전체 데이터 수 받아 PageDTO 구성해서 넘기기
		model.addAttribute("likePageMaker", new PageDTO(cri, liketotal));
		
		// 댓글 단 리뷰의 전체 데이터 수 받아 PageDTO 구성해서 넘기기
		model.addAttribute("commentPageMaker", new PageDTO(cri, commenttotal));
		
		
		return "WEB-INF/views/myspace/MyLikeCommentReviewList.jsp";
	}
	
	// 글 제목 누르면 해당 리뷰글 요청 리다이렉트
	// public void goToReviewDetail(String rev_distin_cd);
}
