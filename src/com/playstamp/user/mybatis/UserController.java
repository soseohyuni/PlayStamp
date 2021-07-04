package com.playstamp.user.mybatis;


import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerInterceptor;

import com.playstamp.user.User;


@Controller
public class UserController
{
	@Autowired
	private SqlSession sqlSession;
	
	//-- 로그인 페이지로 이동
	@RequestMapping("/signinform.action")
	public String signInForm()
	{
		String result = "";
		
		result = "/WEB-INF/views/main/LoginForm.jsp";

		return result;
	}
		
	//-- 회원가입 페이지로 이동
	@RequestMapping("/signupform.action")
	public String signUpForm()
	{
		String result = "";
		
		result = "/WEB-INF/views/main/UserSignUpForm.jsp";

		return result;
	}
	
	//-- 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/checkSignup.action", method=RequestMethod.POST)
	public String userIdCheck(@RequestParam("userId") String userId)
	{
		String str = "";
		
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		int result = 0;
		try
		{
			result = dao.userIdCheck(userId);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		if(result!=0) // 이미 존재하는 아이디
			str = "NO";
		else
			str = "YES";
		
		return str;
	}
	
	@RequestMapping(value="/completesignup.action", method=RequestMethod.POST)
	public String userInsert(@ModelAttribute("user") User user) throws ClassNotFoundException, SQLException 
	{ 
		String result = "";
		
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		//dao.userInsert(user);
	 
		dao.userInsertProcedure(user);
		
		result = "WEB-INF/views/main/Welcome.jsp";
	
		return result; 
	}
	
	// 사용자 로그인
	@RequestMapping(value="/login.action", method=RequestMethod.POST)
	public String userLogin(HttpServletRequest request, Model model) throws SQLException
	{ 
		String result = ""; 
		
		// 넘어온 값 받아오기
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String admin = request.getParameter("admin");
		
		// ! 세션은 사용자의 프로필 / 모델은 페이지에서 사용할 데이터
		
		// 테스트(admin 체크 안 하면 null 로 넘어오는 것 확인)
		//System.out.println("admin="+ admin);
		
		if (admin!=null) // 관리자로 로그인 시도
		{
			// 관리자 테이블 조회 해야 함
			// ...
			
			System.out.println("관리자 로그인 성공");
			result = "WEB-INF/views/main/Welcome.jsp";
		}
		else // 사용자로 로그인 시도
		{
			System.out.println("사용자로 로그인 시도");
			
			// 유저 테이블 조회
			IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
			String str = dao.userLogin(id, pw);
			
			if(str!=null) // 테이블 정보가 일치 == 로그인 성공
			{
				System.out.println("사용자로 로그인 성공");
				
				// 세션 얻어오기
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("nick", str);
				//System.out.println(str);
				model.addAttribute("msg", "success");
				
				result = "WEB-INF/views/main/Main.jsp";
			}
			else // 로그인 실패
			{
				System.out.println("로그인 실패");
				request.setAttribute("msg", "fail");
				result = "/WEB-INF/views/main/LoginForm.jsp";
			}
		}
		
		return result; 
	}
	
	// 사용자 로그아웃
	@RequestMapping("/logout.action")
	public String userLogout(HttpSession session)
	{ 
		String result = ""; 
		session.invalidate();
		
		result = "WEB-INF/views/main/Main.jsp";
		
		return result;
	}
	
	// 비회원 접근
	@RequestMapping("/nonuserlogin.action")
	public String nonUser(HttpServletRequest request)
	{
		String result = "";
		
		request.setAttribute("msg", "nonUser");
		result = "/WEB-INF/views/main/LoginForm.jsp";
				
		return result;
	}
	 
}
