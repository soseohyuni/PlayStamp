package com.test.playList;

public class PlayList
{
	private String playCd, playImg;
	
	PlayList(String playCd, String playImg)
	{
		this.playCd = playCd;
		this.playImg = playImg;
	}
	
	public String getPlayCd()
	{
		return playCd;
	}

	public void setPlayCd(String playCd)
	{
		this.playCd = playCd;
	}

	public String getPlayImg()
	{
		return playImg;
	}

	public void setPlayImg(String playImg)
	{
		this.playImg = playImg;
	}
	
	
}