/*=========================
     AddReview.java
     - 컨트롤러 객체
     - Annotation으로 구성
===========================*/

package com.playstamp.review.mybatis;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playstamp.review.Play;


@Controller
public class AddReviewController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 리뷰 입력 전, 공연 정보를 모두 조회해서 페이지로 가져오는 메소드
	//-- Map으로 공연코드, 공연명 매핑해서 넘겨주기
	/*
	@RequestMapping(value="/addreviewsearchform.action", method=RequestMethod.GET)
	public String searchedPlay(Model model)
	{
		IAddReviewDAO dao = sqlSession.getMapper(IAddReviewDAO.class);
		
		// 공연 정보 테이블의 모든 리스트 가져와서 ArrayList에 담기
		ArrayList<Play> playList = dao.playList();
		
		playList.set
		
		HashMap<String, String> map = new HashMap<String, String>();

				
				
		map.put(, value)
		
		
		// 그걸 모델에 넘겨주고 이름, 코드 각각 꺼내쓰기..
		
		model.addAttribute("list", dao.playList());
		
		//return "WEB-INF/views/AddReviewSearchForm.jsp";
		return "WEB-INF/views/AddReviewSearchForm.jsp";
	}
	*/
	// 리뷰 입력 전, 공연 정보를 모두 조회해서 페이지로 가져오는 메소드
	
	@RequestMapping(value="/addreviewsearchform.action", method=RequestMethod.GET)
	public String searchedPlay(Model model)
	{
		IAddReviewDAO dao = sqlSession.getMapper(IAddReviewDAO.class);

		model.addAttribute("list", dao.playList());
		
		return "WEB-INF/views/AddReviewSearchForm.jsp";
	}
	
	
}
