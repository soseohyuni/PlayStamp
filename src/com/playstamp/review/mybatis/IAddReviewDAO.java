/*======================
     IAddReviewDAO.java
     - 인터페이스
=======================*/

package com.playstamp.review.mybatis;

import java.util.ArrayList;

import com.playstamp.review.Play;

public interface IAddReviewDAO
{
	public ArrayList<Play> playList(); //-- 공연 정보를 모두 조회해서 가져오는 메소드
	
	public ArrayList<String> list();	//-- 검색 단어를 매개변수로 받아 공연 정보를 가져오는 메소드 (필요없을듯)

}
