package com.playstamp.playreviewdetail.mybatis;

import java.util.ArrayList;

import com.playstamp.playreviewdetail.Comment;
import com.playstamp.playreviewdetail.PlayReviewDetail;

public interface IPlayReviewDetailDAO
{
	//@@ 공연리뷰 상세에 정보를 뿌려 줄 메소드
	public ArrayList<PlayReviewDetail> getPlayReviewDetail(String playrev_cd);
	
	//@@ 댓글 목록 출력 메소드
	public ArrayList<Comment> getCommentList(String playrev_cd);
	
	//@@ 댓글 추가 메소드
	public int addComment(Comment comment);
	
	//@@ 닉네임을 통한 USER_CD 검색 메소드
	public String searchUserCd(String user_nick);
}
