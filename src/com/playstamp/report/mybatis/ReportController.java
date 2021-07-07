package com.playstamp.report.mybatis;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playstamp.playreviewdetail.Comment;
import com.playstamp.playreviewdetail.mybatis.IPlayReviewDetailDAO;
import com.playstamp.report.ReportComment;
import com.playstamp.report.ReportPlayRev;

@Controller
public class ReportController
{
	@Autowired
	private SqlSession sqlSession;
	
	//@@ 신고 추가
	@RequestMapping(value="report.action", method= RequestMethod.GET)
	public String addComment(HttpServletRequest request, HttpSession session, ModelMap model) throws SQLException, IOException
	{
		IReportDAO dao = sqlSession.getMapper(IReportDAO.class);	

		String playrev_cd = request.getParameter("playrev_cd");
		String rep_y_cd = request.getParameter("rep_y_cd");
		String user_cd = (String)session.getAttribute("code");
		String comment_cd = request.getParameter("comment_cd");
		
		ReportPlayRev reportPlayRev = new ReportPlayRev();
		ReportComment reportComment = new ReportComment();
		
		//@@ 값 넘어옴!
		//System.out.println(comment_cd);

		int result = 0;
		
		try
		{
			//result = dao.addReport(report);
			if (comment_cd!=null)
			{	reportComment.setComment_cd(comment_cd);
				reportComment.setRep_y_cd(rep_y_cd);
				reportComment.setUser_cd(user_cd);
				
				result = dao.addReportComment(reportComment);
				
				//@@ 신고 접수 후 alert 창으로 신고 접수가 완료되었음을 알려 주기!
				if (result>0)
					model.addAttribute("msg", "신고 접수가 완료되었습니다.");
				else
					model.addAttribute("msg", "신고 접수에 실패하였습니다.");
					
				model.addAttribute("url", "playreviewdetail.action?playrev_cd="+playrev_cd);
			}
			/*
			 * else if (seat_rev_cd!=null) {
			 * 
			 * } else if (mseat_rev_cd!=null) {
			 * 
			 * }
			 */
			else if (playrev_cd!=null)
			{
				reportPlayRev.setPlayrev_cd(playrev_cd);
				reportPlayRev.setRep_y_cd(rep_y_cd);
				reportPlayRev.setUser_cd(user_cd);
				
				result = dao.addReportPlayRev(reportPlayRev);
				
				//@@ 신고 접수 후 alert 창으로 신고 접수가 완료되었음을 알려 주기!
				if (result>0)
					model.addAttribute("msg", "신고 접수가 완료되었습니다.");
				else
					model.addAttribute("msg", "신고 접수에 실패하였습니다.");
					
				model.addAttribute("url", "playreviewdetail.action?playrev_cd="+playrev_cd);
			}
			
			
			

			 
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return "WEB-INF/views/ReportAlert.jsp";
	}	
}
