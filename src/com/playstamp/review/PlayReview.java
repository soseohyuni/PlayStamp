package com.playstamp.review;

import java.sql.Date;

public class PlayReview
{
	// 공연리뷰 테이블 구조와 동일
	String playrev_cd;				// 공연리뷰 코드
	String rev_distin_cd;			// 리뷰 식별 코드
	int companion_cd;				// 동행인 분류 코드
	Date playrev_dt;				// 작성일자
	String title;					// 리뷰 제목
	int rating_cd;					// 평점 코드
	String contents;				// 리뷰 내용
	String play_img;				// 포스터 (첨부 사진)
	Date play_dt;					// 공연 날짜
	String play_time;				// 관람 시간 (공연 시작 시간)
	int play_money;					// 티켓 금액
	String play_cast;				// 출연진
	int view_cnt;					// 조회수
	
	
	public String getPlayrev_cd()
	{
		return playrev_cd;
	}
	public void setPlayrev_cd(String playrev_cd)
	{
		this.playrev_cd = playrev_cd;
	}
	public String getRev_distin_cd()
	{
		return rev_distin_cd;
	}
	public void setRev_distin_cd(String rev_distin_cd)
	{
		this.rev_distin_cd = rev_distin_cd;
	}
	public int getCompanion_cd()
	{
		return companion_cd;
	}
	public void setCompanion_cd(int companion_cd)
	{
		this.companion_cd = companion_cd;
	}
	public Date getPlayrev_dt()
	{
		return playrev_dt;
	}
	public void setPlayrev_dt(Date playrev_dt)
	{
		this.playrev_dt = playrev_dt;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public int getRating_cd()
	{
		return rating_cd;
	}
	public void setRating_cd(int rating_cd)
	{
		this.rating_cd = rating_cd;
	}
	public String getContents()
	{
		return contents;
	}
	public void setContents(String contents)
	{
		this.contents = contents;
	}
	public String getPlay_img()
	{
		return play_img;
	}
	public void setPlay_img(String play_img)
	{
		this.play_img = play_img;
	}
	public Date getPlay_dt()
	{
		return play_dt;
	}
	public void setPlay_dt(Date play_dt)
	{
		this.play_dt = play_dt;
	}
	public String getPlay_time()
	{
		return play_time;
	}
	public void setPlay_time(String play_time)
	{
		this.play_time = play_time;
	}
	public int getPlay_money()
	{
		return play_money;
	}
	public void setPlay_money(int play_money)
	{
		this.play_money = play_money;
	}
	public String getPlay_cast()
	{
		return play_cast;
	}
	public void setPlay_cast(String play_cast)
	{
		this.play_cast = play_cast;
	}
	public int getView_cnt()
	{
		return view_cnt;
	}
	public void setView_cnt(int view_cnt)
	{
		this.view_cnt = view_cnt;
	}
}
