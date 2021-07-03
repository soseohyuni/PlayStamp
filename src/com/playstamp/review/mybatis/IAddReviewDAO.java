/*======================
     IAddReviewDAO.java
     - 인터페이스
=======================*/

package com.playstamp.review.mybatis;

import java.util.ArrayList;

import com.playstamp.review.DistinctReview;
import com.playstamp.review.MSeatReview;
import com.playstamp.review.Play;
import com.playstamp.review.SeatReview;

public interface IAddReviewDAO
{
	public ArrayList<Play> playList();  							//-- 공연 정보를 모두 조회해서 가져오는 메소드
	public String searchPlayCd(String play_nm);						//-- 사용자가 선택한 공연명에 대한 공연 코드를 가져오는 메소드
	public int addDistinctReview(DistinctReview distinctReview);    //-- 리뷰 식별 테이블에 Insert하는 메소드
	public String searchRevDistinCd(DistinctReview distinctReview); //-- 리뷰 식별코드 가져오는 메소드
	public Play searchPlay(String play_cd);							//-- 공연코드로 모든 공연 정보를 가져오는 메소드
	
	public int addSeatReview(SeatReview seatreview);				//-- 일반 공연장의 좌석 리뷰 테이블에 Insert 하는 메소드
	public int addMSeatReview(MSeatReview mseatreview);				//-- 5대 공연장의 좌석 리뷰 테이블에 Insert 하는 메소드
	
}
