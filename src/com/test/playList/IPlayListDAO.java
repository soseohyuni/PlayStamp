package com.test.playList;

import java.sql.SQLException;
import java.util.ArrayList;

// 공연정보 인터페이스
public interface IPlayListDAO
{
	// 공연중인 뮤지컬 출력 메소드
	public ArrayList<PlayList> getIngMusicalList() throws SQLException;
	// 공연예정인 뮤지컬 출력 메소드
	public ArrayList<PlayList> getWillMusicalList() throws SQLException;
	// 공연완료인 뮤지컬 출력 메소드
	public ArrayList<PlayList> getEdMusicalList() throws SQLException;
	
	// 공연중인 연극 출력 메소드
	public ArrayList<PlayList> getIngDramaList() throws SQLException;
	// 공연예정인 연극 출력 메소드
	public ArrayList<PlayList> getWillDramaList() throws SQLException;
	// 공연완료인 연극 출력 메소드
	public ArrayList<PlayList> getEdDramaList() throws SQLException;
	
	
}
