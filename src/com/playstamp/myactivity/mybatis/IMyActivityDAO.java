package com.playstamp.myactivity.mybatis;

import java.util.ArrayList;

import com.playstamp.myactivity.MyLikeCommentReview;
import com.playstamp.paging.Criteria;
import com.playstamp.paging.PageDTO;

public interface IMyActivityDAO
{
	// 나의 활동 내역 - 좋아요한 리뷰 글, 댓글 단 리뷰 글 조회, 신고 된 글, 신고한 글 조회 관련 메소드
	
	// 전체 데이터 수를 파라미터로 받아 총 페이지 구성하기
	//-- (PageDTO): 이전, 다음, 마지막 페이지 구성
	public PageDTO page(int total);
	
	// 내가 좋아요 한 리뷰 글 개수 가져오기
	public int likeReviewCount(String user_cd);
	
	// 내가 댓글 단 리뷰 글 개수 가져오기
	public int commentReviewCount(String user_cd);
	
	// 내가 좋아요 한 리뷰 글 목록 가져오기
	//-- Criteria 객체 사용해서 가져올 때 한 페이지 당 보이게 할 게시글 수와 페이지 수 정해서 그만큼만 가져오기
	public ArrayList<MyLikeCommentReview> getLikeListWithPaging(Criteria cri, String user_cd);
	
	// 내가 댓글 단 리뷰 글 목록 가져오기
	public ArrayList<MyLikeCommentReview> getCommentListWithPaging(Criteria cri, String user_cd);
	

	// 내가 신고한 글 개수 가져오기
	
	// 내가 신고 당한 글 개수 가져오기
	
	// 내가 신고한 글 목록 가져오기
	
	// 내가 신고 당한 내역 글 목록 가져오기
	
	// 글 제목 누르면 해당 신고글 요청 리다이렉트 (조회만 가능)

}
