package com.playstamp.manager.home.mybatis;

import com.playstamp.manager.home.ManagerHome;

public interface IManagerHomeDAO
{
	// 총 사용자 수 구하기
	public int countUser();
	
	// 총 리뷰 수 구하기
	public int countPlayRev();
	
	// 가입 회원 통계
	public ManagerHome statisticsUserTotal(String year);
	
	// 방문 회원 통계
	public ManagerHome statisticsVisitorTotal(String year);
}
