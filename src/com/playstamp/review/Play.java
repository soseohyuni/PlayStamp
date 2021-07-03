package com.playstamp.review;

import java.sql.Date;

public class Play
{
	private String play_cd, theater_cd;	//-- 공연 코드, 공연장 코드
	private int genre_cd;				//-- 공연 장르 코드
	private String mng_cd, play_nm;		//-- 관리자코드, 공연명
	private Date play_start, play_end; 	//-- 공연 시작일자, 공연 종료일자
	private String play_img, play_cast;	//-- 포스터, 출연진
	private Date playRegister;			//-- 등록일
	
	// getter, setter 구성
	public String getPlay_cd()
	{
		return play_cd;
	}
	public void setPlay_cd(String play_cd)
	{
		this.play_cd = play_cd;
	}
	public String getTheater_cd()
	{
		return theater_cd;
	}
	public void setTheater_cd(String theater_cd)
	{
		this.theater_cd = theater_cd;
	}
	public int getGenre_cd()
	{
		return genre_cd;
	}
	public void setGenre_cd(int genre_cd)
	{
		this.genre_cd = genre_cd;
	}
	public String getMng_cd()
	{
		return mng_cd;
	}
	public void setMng_cd(String mng_cd)
	{
		this.mng_cd = mng_cd;
	}
	public String getPlay_nm()
	{
		return play_nm;
	}
	public void setPlay_nm(String play_nm)
	{
		this.play_nm = play_nm;
	}
	public Date getPlay_start()
	{
		return play_start;
	}
	public void setPlay_start(Date play_start)
	{
		this.play_start = play_start;
	}
	public Date getPlay_end()
	{
		return play_end;
	}
	public void setPlay_end(Date play_end)
	{
		this.play_end = play_end;
	}
	public String getPlay_img()
	{
		return play_img;
	}
	public void setPlay_img(String play_img)
	{
		this.play_img = play_img;
	}
	public String getPlay_cast()
	{
		return play_cast;
	}
	public void setPlay_cast(String play_cast)
	{
		this.play_cast = play_cast;
	}
	public Date getPlayRegister()
	{
		return playRegister;
	}
	public void setPlayRegister(Date playRegister)
	{
		this.playRegister = playRegister;
	}
	
	/*
	private String playCd, theaterCd;	//-- 공연 코드, 공연장 코드
	private int genreCd;				//-- 공연 장르 코드
	private int stateCd;				//-- 공연 상태코드
	private String mngCd, playNm;		//-- 관리자코드, 공연명
	private Date playStart, playEnd; 	//-- 공연 시작일자, 공연 종료일자
	private String playImg, playCast;	//-- 포스터, 출연진
	private Date playRegister;			//-- 등록일
	*/
	
	
	
	/*
	public String getPlayCd()
	{
		return playCd;
	}
	public void setPlayCd(String playCd)
	{
		this.playCd = playCd;
	}
	public String getTheaterCd()
	{
		return theaterCd;
	}
	public void setTheaterCd(String theaterCd)
	{
		this.theaterCd = theaterCd;
	}
	public int getGenreCd()
	{
		return genreCd;
	}
	public void setGenreCd(int genreCd)
	{
		this.genreCd = genreCd;
	}
	public int getStateCd()
	{
		return stateCd;
	}
	public void setStateCd(int stateCd)
	{
		this.stateCd = stateCd;
	}
	public String getMngCd()
	{
		return mngCd;
	}
	public void setMngCd(String mngCd)
	{
		this.mngCd = mngCd;
	}
	public String getPlayNm()
	{
		return playNm;
	}
	public void setPlayNm(String playNm)
	{
		this.playNm = playNm;
	}
	public Date getPlayStart()
	{
		return playStart;
	}
	public void setPlayStart(Date playStart)
	{
		this.playStart = playStart;
	}
	public Date getPlayEnd()
	{
		return playEnd;
	}
	public void setPlayEnd(Date playEnd)
	{
		this.playEnd = playEnd;
	}
	public String getPlayImg()
	{
		return playImg;
	}
	public void setPlayImg(String playImg)
	{
		this.playImg = playImg;
	}
	public String getPlayCast()
	{
		return playCast;
	}
	public void setPlayCast(String playCast)
	{
		this.playCast = playCast;
	}
	public Date getPlayRegister()
	{
		return playRegister;
	}
	public void setPlayRegister(Date playRegister)
	{
		this.playRegister = playRegister;
	}
	*/
}
