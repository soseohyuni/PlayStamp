package com.test.playList;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

// 공연정보 인터페이스
public interface IPlayListDAO
{
	// 공연중인 뮤지컬 출력 메소드
	public ArrayList<PlayList> getMusicalList(String playState) throws SQLException;

	// 공연완료인 연극 출력 메소드
	public ArrayList<PlayList> getDramaList(String playState) throws SQLException;	
}
