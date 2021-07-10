package com.playstamp.manager.memberlist.mybatis;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playstamp.manager.memberlist.ManagingPointList;
import com.playstamp.manager.memberlist.MemberList;
import com.playstamp.paging.Criteria;
import com.playstamp.paging.PageDTO;

@Controller 
public class MemberListController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 전체 회원 리스트 조회
	@RequestMapping(value = "/memberlist.action", method= RequestMethod.GET)
	public String memberlist(Criteria cri, Model model)
	{	
		IMemberListDAO dao = sqlSession.getMapper(IMemberListDAO.class);
		
		ArrayList<MemberList> memberlist = dao.memberlist(cri);
		int total = dao.membercount();
		
		model.addAttribute("memberlist", memberlist);
		model.addAttribute("PageMaker", new PageDTO(cri, total));
		
		return "WEB-INF/views/manager/MemberList.jsp";
	}
	
	// 회원의 포인트 변경 팝업 띄우기
	@RequestMapping(value = "/modifypointpopup.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String modifypointpopup()
	{	
		return "WEB-INF/views/manager/ModifyPointPopup.jsp";
	}
	
	
	// 회원의 포인트 변경
	@RequestMapping(value = "/modifypoint.action", method= {RequestMethod.GET, RequestMethod.POST})
	public void modifypoint(HttpServletRequest request, HttpServletResponse response) throws IOException
	{	
		String user_id = request.getParameter("user_id");
		String point = request.getParameter("point");
		
		IMemberListDAO dao = sqlSession.getMapper(IMemberListDAO.class);
		
		dao.modifypoint(user_id, point);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printwriter = response.getWriter();
		
		printwriter.print("<script>alert('수정이 완료되었습니다!');"
	               + "window.opener.location.reload();window.close();</script>");
		printwriter.flush();
		printwriter.close();
		
	}
	
	// 특정 회원의 포인트 내역 조회
	@RequestMapping(value = "/managingpointlist.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String managingpointlist(HttpServletRequest request, ModelMap model)
	{
		String result = "";
		
		// 클릭한 회원의 아이디값 가져오기
		String user_id = request.getParameter("user_id");
		String grade = request.getParameter("grade");
		
		// 포인트 리스트 받아오기
		IMemberListDAO dao = sqlSession.getMapper(IMemberListDAO.class);
		
		ArrayList<ManagingPointList> pointList = new ArrayList<ManagingPointList>();
		pointList = dao.managingpointlist(user_id);
		
		// 리스트 제일 앞에 있는 값 꺼내기 = 현재 포인트
		int userPoint = 0;
		if( pointList.size()!=0)
		{ userPoint = Integer.parseInt(pointList.get(0).getUser_point()); }
		
		// addAttribute 를 통해 전송
		model.addAttribute("pointList", pointList);
		model.addAttribute("userPoint", userPoint);
		model.addAttribute("user_id", user_id);
		model.addAttribute("grade", grade);
				
		result = "/WEB-INF/views/manager/ManagingPointList.jsp";

		return result;
	}

}
