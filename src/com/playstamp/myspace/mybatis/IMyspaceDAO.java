package com.playstamp.myspace.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import com.playstamp.myspace.Cash;
import com.playstamp.myspace.MySpace;
import com.playstamp.myspace.MySpaceComp;
import com.playstamp.myspace.Point;
import com.playstamp.user.User;

public interface IMyspaceDAO
{
	public User searchUserInfo(String userId) throws SQLException;
	public void updateUserInfo(User user) throws SQLException;
	public void updateUserImg(String userId, String userImg) throws SQLException;
	
	public ArrayList<Point> userPointList(String userId);
	public int countingLike(String userId);
	public ArrayList<Cash> userCashList(String userId);
	
	public void userDropProcedure(String user, int y) throws SQLException;
	public int countingRev(String userCode);
	public int countingJjim(String userCode);
	
	// 통계
	public MySpace statisticRevTotal(String year);
	public MySpace statisticRevUser(String year, String code);
	public int totalUser();
	public MySpaceComp statisticCompanion(String year, String code);
	public MySpace statisticMoney(String year, String code);
}
