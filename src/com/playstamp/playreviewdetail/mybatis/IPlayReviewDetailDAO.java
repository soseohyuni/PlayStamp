package com.playstamp.playreviewdetail.mybatis;

import java.util.ArrayList;

import com.playstamp.playreviewdetail.Comment;
import com.playstamp.playreviewdetail.Like;
import com.playstamp.playreviewdetail.PlayReviewDetail;

public interface IPlayReviewDetailDAO
{
	//@@ 공연리뷰 상세에 정보를 뿌려 줄 메소드
	public ArrayList<PlayReviewDetail> getPlayReviewDetail(String playrev_cd);
	
	//@@ 댓글 목록 출력 메소드
	public ArrayList<Comment> getCommentList(String playrev_cd);
	
	//@@ 댓글 추가 메소드
	public int addComment(Comment comment);
	
	//@@ 댓글 코드로 댓글을 삭제하는 메소드
	public int removeComment(Comment comment);
	
	//@@ 좋아요 추가 메소드
	public int addHeart(Like like);
	
	//@@ 좋아요 카운트 메소드
	public int countHeart(Like like);
	
	//@@ 좋아요 중복 체크 메소드
	public int checkHeart(Like like);
	
	//@@ 좋아요 제거 메소드
	public int delHeart(Like like);

}
