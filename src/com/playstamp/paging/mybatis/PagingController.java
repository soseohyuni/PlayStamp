package com.playstamp.paging.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.playstamp.paging.Criteria;
import com.playstamp.paging.PageMaker;

@Controller
public class PagingController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/addreviewsearchform.action", method=RequestMethod.GET)
	public ModelAndView openBoardList(Criteria cri) throws Exception
	{
        // Criteria cri: 현재 페이지 번호와 페이지당 보여 줄 게시글 수가 담긴 Criteria 객체 사용
	    ModelAndView mav = new ModelAndView("/board/boardList");
	    
	    // PageMaker 객체를 생성하여 현재 페이지 번호, 페이지당 보여 줄 게시글 수 세팅
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(100);	//-- 총 게시글 수 (우선 임의의 수 100 넣음)
	    
	    // 원래의 목록 조회 로직 넣기
	    //List<Map<String,Object>> list = boardServcie.selectBoardList(cri);
	    mav.addObject("list", list);
	    mav.addObject("pageMaker", pageMaker); //-- 페이징을 위한 버튼 값이 들어있음
	        
	    return mav;
}
