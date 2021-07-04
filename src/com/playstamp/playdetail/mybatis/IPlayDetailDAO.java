package com.playstamp.playdetail.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import com.playstamp.playdetail.PlayDetail;
import com.playstamp.playdetail.PlayRevPre;
import com.playstamp.playdetail.SeatRev;

public interface IPlayDetailDAO
{
	// 5대 공연 좌석 리뷰인지 체크하는 메소드
	//(일종의 DelCheck 처럼 참조관계를 확인하는 메소드로, 0보다 클 경우 5대 공연 좌석 리뷰임을 의미)
	public Integer getMseatCheck(String play_cd) throws SQLException;

	// 일반 공연 좌석 리뷰인지 체크하는 메소드
	// (상동)
	public Integer getSeatCheck(String play_cd) throws SQLException;
	
	// getSeatCheck, getMseatCheck 값을 바탕으로
	// 해당 공연이 5대 공연장에서 진행될 경우, 5대 공연장  테이블을 조회해좌석 리뷰를 보여주는 메소드
	public ArrayList<SeatRev> getMseatRev(String play_cd);
	
	// getSeatCheck, getMseatCheck 값을 바탕으로
	// 해당 공연이 일반 공연장에서 진행될 경우, 일반 공연장 테이블을 조회해 좌석 리뷰를 보여주는 메소드
	public ArrayList<SeatRev> getSeatRev(String play_cd);
	
	// 공연 상세 조회 메소드
	public ArrayList<PlayDetail> getPlayDetail(String play_cd);
	
	// 해당 공연에 해당하는 공연 리뷰 프리뷰 조회 메소드
	public ArrayList<PlayRevPre> getPlayRevPre(String play_cd);
}
