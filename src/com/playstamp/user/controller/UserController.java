package com.playstamp.user.controller;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	//@ResponseBody
	@RequestMapping(value="/completeSignup.action", method=RequestMethod.POST)
	public String userInsert(@ModelAttribute("user") User user) throws ClassNotFoundException, SQLException 
	{ 
		String result = "";
		
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		//dao.userInsert(user);
	 
		dao.userInsertProcedure(user);
		
		result = "/NewFile.jsp";
	
		return result; 
	}
	 

	 
}
