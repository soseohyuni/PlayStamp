package com.playstamp.user.mybatis;

import java.sql.SQLException;

import com.playstamp.user.User;

public interface IUserDAO
{
	// 사용자 회원가입 관련 메서드
	public int userInsert(User user) throws SQLException, ClassNotFoundException;
	public int userIdCheck(String userId) throws SQLException, ClassNotFoundException;
	public int userInsertProcedure(User user) throws SQLException, ClassNotFoundException;
	
	// 사용자 로그인 관련 메서드
	public String userLogin(String userId, String userPw) throws SQLException;
	public String userCode(String userId) throws SQLException;
	public String managerLogin(String userId, String userPw) throws SQLException;
	

	// 아이디 찾기/비밀번호 찾기 관련 메서드
	public String[] selectFindId(String userMail);
	public int selectIdMail(String userId, String userMail);
	public void changePw(String userPw, String userId);

}
