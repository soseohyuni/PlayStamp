package com.playstamp.myspace.mybatis;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playstamp.myspace.Cash;
import com.playstamp.myspace.Point;
import com.playstamp.user.User;


@Controller
public class MySpaceController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 사용자 포인트 내역
	@RequestMapping("/pointlist.action")
	public String userPointList(HttpSession session, ModelMap model)
	{
		String result = "";
		
		// 세션 객체 안에 있는 ID 얻어오기
		String userId = (String)session.getAttribute("id");
		//System.out.println("회원 세션에서 얻은 아이디 : " + userId);
		
		
		// 포인트 리스트 받아오기
		IMyspaceDAO dao = sqlSession.getMapper(IMyspaceDAO.class);
		
		ArrayList<Point> pointList = new ArrayList<Point>();
		pointList = dao.userPointList(userId);
		
		// 리스트 제일 앞에 있는 값 꺼내기 = 현재 포인트
		int userPoint = Integer.parseInt(pointList.get(0).getUser_point());
		
		// addAttribute 를 통해 전송
		model.addAttribute("pointList", pointList);
		model.addAttribute("userPoint", userPoint);
				
		result = "/WEB-INF/views/myspace/PointList.jsp";

		return result;
	}
	
	// 사용자 캐시 내역
	@RequestMapping("/cashlist.action")
	public String userCashList(HttpSession session, ModelMap model)
	{
		String result = "";
		
		// 세션 객체 안에 있는 ID 얻어오기
		String userId = (String)session.getAttribute("id");
		
		// 포인트 리스트 받아오기
		IMyspaceDAO dao = sqlSession.getMapper(IMyspaceDAO.class);
		
		ArrayList<Cash> cashList = new ArrayList<Cash>();
		cashList = dao.userCashList(userId);
		
		// 리스트 제일 앞에 있는 값 꺼내기 = 현재 캐시
		int userCash = Integer.parseInt(cashList.get(0).getUser_cash());
		
		// addAttribute 를 통해 전송
		model.addAttribute("cashList", cashList);
		model.addAttribute("userCash", userCash);
		
		result = "/WEB-INF/views/myspace/CashList.jsp";

		return result;
	}
	
	// 사용자 정보 조회
	@RequestMapping("/myprofile.action")
	public String searchUserInfo(HttpSession session, Model model) throws SQLException
	{
		String result = "";
		
		// 세션 객체 안에 있는 ID 정보 저장
		String userId = (String)session.getAttribute("id");
		System.out.println("회원 세션에서 얻은 아이디 : " + userId);
		
		// 회원 정보 보기 호출
		IMyspaceDAO dao = sqlSession.getMapper(IMyspaceDAO.class);
		User userInfo = dao.searchUserInfo(userId);
		
		// 얻어온 정보 저장
		model.addAttribute("userInfo", userInfo);
		System.out.println("얻은 유저 정보 : " + userInfo.getJoin_Dt());
		
		result = "/WEB-INF/views/myspace/MyProfileForm.jsp";

		return result;
	}
	
	// 사용자 정보 업데이트
	@RequestMapping(value="/update.action", method=RequestMethod.POST)
	public void updateUserInfo(User user, Model model, HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException
	{
		
		System.out.println("업데이트 진입");
		System.out.println("닉네임 : " + user.getUser_Nick());
		System.out.println("아이디 : " + user.getUser_Id());
		System.out.println("메일 : " + user.getUser_Mail());

		// 회원 정보 업데이트 호출
		IMyspaceDAO dao = sqlSession.getMapper(IMyspaceDAO.class);
		dao.updateUserInfo(user);
		
		HttpSession session = request.getSession();
		session.setAttribute("nick", user.getUser_Nick());
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printwriter = response.getWriter();
		
		printwriter.print("<script>alert('정보 수정이 완료됐습니다.');"
				+ "location.href='myprofile.action'</script>");
		printwriter.flush();
		printwriter.close();
		
	}
	
	// 사용자 프로필 사진 수정
	@RequestMapping("/uploadimg.action")
    public void uploadUserImg(HttpSession session, HttpServletResponse response) throws SQLException, IOException
	{
		IMyspaceDAO dao = sqlSession.getMapper(IMyspaceDAO.class);
		String userId = (String)session.getAttribute("id");
		String userImg = (String)session.getAttribute("userProfile");
		
		dao.updateUserImg(userId, userImg);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printwriter = response.getWriter();
		
		printwriter.print("<script>alert('정보 수정이 완료됐습니다.');"
				+ "location.href='myprofile.action'</script>");
		printwriter.flush();
		printwriter.close();
	}

	
	@RequestMapping("/dropform.action")
	public String dropView()
	{
		String result = "";
		
		result = "/WEB-INF/views/myspace/DropForm.jsp";

		return result;
	}
	
	@RequestMapping("/dropcashcheck.action")
	public String dropCashCheckView()
	{
		String result = "";
		
		result = "/WEB-INF/views/myspace/DropCashCheck.jsp";

		return result;
	}
}
