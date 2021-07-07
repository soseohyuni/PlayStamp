package com.playstamp.report.mybatis;

import com.playstamp.report.ReportComment;
import com.playstamp.report.ReportPlayRev;

public interface IReportDAO
{
	//@@ 신고 추가 메소드
	public int addReportPlayRev(ReportPlayRev reportPlayRev);
	
	public int addReportComment(ReportComment reportComment);
}
