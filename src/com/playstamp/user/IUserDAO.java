package com.playstamp.user;

import java.sql.SQLException;

public interface IUserDAO
{
	public void userInsert(User user) throws SQLException, ClassNotFoundException;
	public int userIdCheck(String userId) throws SQLException, ClassNotFoundException;
}
