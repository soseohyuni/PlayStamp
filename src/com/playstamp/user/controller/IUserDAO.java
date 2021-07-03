package com.playstamp.user.controller;

import java.sql.SQLException;
import java.util.List;

import com.playstamp.user.User;

public interface IUserDAO
{
	public int userInsert(User user) throws SQLException, ClassNotFoundException;
	public int userIdCheck(String userId) throws SQLException, ClassNotFoundException;
	public int userInsertProcedure(User user) throws SQLException, ClassNotFoundException;
	
	public String userLogin(String userId, String userPw) throws SQLException;
}
