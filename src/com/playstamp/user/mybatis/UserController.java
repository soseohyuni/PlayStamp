package com.playstamp.user.mybatis;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playstamp.myspace.Point;
import com.playstamp.myspace.mybatis.IMyspaceDAO;
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
	
	// 이메일 인증
	@RequestMapping(value="/mailcheck.action", method=RequestMethod.GET)
	public String mailCheck(String email)
	{
		System.out.println("이메일 데이터 전송확인");
		System.out.println("인증 메일 : "+email);
		
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111; // 111111 - 999999
		System.out.println("인증번호 : "+checkNum);
		
		//이메일 보내기
		String setFrom = "shyunnkk@gmail.com";
		String toEmail = email;
		String title = "독거노인 회원가입 인증 이메일 입니다.";
		String content = "독거노인에 가입해주셔서 감사합니다."+ "<br/><br/>"+"인증 번호는 "+checkNum+" 입니다.<br/>"+
							"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toEmail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        return num;
	}
	
	
	// 사용자 회원가입 완료
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
			IUserDAO userDao = sqlSession.getMapper(IUserDAO.class);
			String str = userDao.userLogin(id, pw);
			
			if(str!=null) // 테이블 정보가 일치 == 로그인 성공
			{
				System.out.println("사용자로 로그인 성공");
				
				// 사용자 정보 세션에 담기
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("nick", str);
				
				/* 등급 처리 */
				
				// 세션 객체 안에 있는 ID 얻어오기
				String userId = (String)session.getAttribute("id");
				
				// 포인트 리스트 받아오기
				IMyspaceDAO dao = sqlSession.getMapper(IMyspaceDAO.class);
				
				ArrayList<Point> pointList = new ArrayList<Point>();
				pointList = dao.userPointList(userId);
				
				// 리스트 제일 앞에 있는 값 꺼내기 = 현재 포인트
				int userPoint = Integer.parseInt(pointList.get(0).getUser_point());
				
				// 좋아요 개수 받아오기
				int countingLike = dao.countingLike(userId);
				
				// 등급 확인
				String grade = null;
				
				if(countingLike >= 20 && userPoint >= 200)
					grade = "우수회원";
				else if(countingLike >= 10 && userPoint >= 100)
					grade = "일반회원";
				else if(countingLike >= 3 && userPoint >= 30)
					grade = "준회원";
				else if(userPoint < 0)
					grade = "어둠회원";
				else
					grade = "뉴비";
				
				System.out.println("포인트 : " + userPoint + " | 좋아요 : " + countingLike + " | 등급 : " + grade);
				
				// 세션에 담아놓기
				session.setAttribute("grade", grade);
				
				//System.out.println(str);
				model.addAttribute("msg", "success");
				
				result = "WEB-INF/views/main/Main.jsp";
			}
			else // 로그인 실패
			{
				System.out.println("로그인 실패");
				System.out.println(id + pw);
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
	
}
