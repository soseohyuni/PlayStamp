/*
	User.java
	- 사용자 주요 속성 구성(DTO)
*/
package com.playstamp.user;

import org.springframework.stereotype.Repository;

@Repository
public class User
{
	private String userId, userNm, userTel, userPw
			     , userNick, userMail, joinDt, userImg;

	public String getUserId()
	{
		return userId;
	}

	public void setUserId(String userId)
	{
		this.userId = userId;
	}

	public String getUserNm()
	{
		return userNm;
	}

	public void setUserNm(String userNm)
	{
		this.userNm = userNm;
	}

	public String getUserTel()
	{
		return userTel;
	}

	public void setUserTel(String userTel)
	{
		this.userTel = userTel;
	}

	public String getUserPw()
	{
		return userPw;
	}

	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}

	public String getUserNick()
	{
		return userNick;
	}

	public void setUserNick(String userNick)
	{
		this.userNick = userNick;
	}

	public String getUserMail()
	{
		return userMail;
	}

	public void setUserMail(String userMail)
	{
		this.userMail = userMail;
	}

	public String getJoinDt()
	{
		return joinDt;
	}

	public void setJoinDt(String joinDt)
	{
		this.joinDt = joinDt;
	}

	public String getUserImg()
	{
		return userImg;
	}

	public void setUserImg(String userImg)
	{
		this.userImg = userImg;
	}
	
	
}
