package com.playstamp.user.mybatis;

import java.sql.SQLException;

import com.playstamp.user.User;

public interface IUserDAO
{
	public int userInsert(User user) throws SQLException, ClassNotFoundException;
	public int userIdCheck(String userId) throws SQLException, ClassNotFoundException;
	public int userInsertProcedure(User user) throws SQLException, ClassNotFoundException;
	
	public String userLogin(String userId, String userPw) throws SQLException;
	public String managerLogin(String userId, String userPw) throws SQLException;
	
	public String userCode(String userId) throws SQLException;
}
