/*=========================
     AddReview.java
     - 컨트롤러 객체
     - Annotation으로 구성
===========================*/

package com.playstamp.review.mybatis;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playstamp.review.DistinctReview;
import com.playstamp.review.MSeatReview;
import com.playstamp.review.Play;
import com.playstamp.review.SeatReview;


@Controller
public class AddReviewController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 리뷰 입력 전, 공연 정보를 모두 조회해서 페이지로 가져오는 메소드
	@RequestMapping(value="/addreviewsearchform.action", method=RequestMethod.GET)
	public String searchedPlay(Model model)
	{
		IAddReviewDAO dao = sqlSession.getMapper(IAddReviewDAO.class);

		model.addAttribute("list", dao.playList());
		
		return "WEB-INF/views/review/AddReviewSearchForm.jsp";
	}
	
	
	// 리뷰 검색 후 공연을 선택하면
	// 리뷰 식별 코드 테이블에 Insert 한 뒤,
	// 선택한 공연 관련 정보를 가지고 좌석 리뷰 입력 페이지로 이동
	@RequestMapping(value="/addreviewseatform.action", method=RequestMethod.POST)
	public String addDistinctReview(Model model, HttpServletRequest request)
	{
		IAddReviewDAO dao = sqlSession.getMapper(IAddReviewDAO.class);
		
		// 검색 페이지(AddReviewSearchForm.jsp)로부터 정보 수신
		String user_cd = request.getParameter("user_cd");
		String play_nm = request.getParameter("play_nm");
		String play_cd = dao.searchPlayCd(play_nm);
		
		DistinctReview distinctReview = new DistinctReview();
		distinctReview.setPlay_cd(play_cd);
		distinctReview.setUser_cd(user_cd);
		
		// 리뷰 식별 테이블에 Insert (리뷰식별코드, 공연코드, 사용자코드)
		dao.addDistinctReview(distinctReview);
		
		// insert 된 리뷰 식별 코드 가져오기
		String rev_distin_cd = dao.searchRevDistinCd(distinctReview);
		
		// 페이지로 이동하면서 리뷰식별코드 전달
		model.addAttribute("rev_distin_cd", rev_distin_cd);
		
		// 선택한 공연에 대한 모든 정보(공연객체) 전달
		Play play = new Play();
		play = dao.searchPlay(play_cd);
		
		model.addAttribute("play", play);

		return "WEB-INF/views/review/AddReviewSeatForm.jsp";
	}
	
	//-------------------------- 아래부터 좌석 리뷰 입력
	
	// 좌석 리뷰 입력 후 버튼을 클릭하면
	// 일반 공연장인지, 5대 공연장인지 판별하여 리뷰 입력
	@RequestMapping(value="/addreviewdetailform.action", method=RequestMethod.POST)
	public String addReviewSeat(Model model, HttpServletRequest request)
	{
		IAddReviewDAO dao = sqlSession.getMapper(IAddReviewDAO.class);
		
		// 좌석 리뷰 입력 페이지(AddReviewSeatForm.jsp)로부터 수신
		String play_cd = request.getParameter("play_cd");				// 공연 코드 (사용자가 선택한)
		String theater_cd = request.getParameter("theater_cd");			// 공연장 코드
		String rev_distin_cd = request.getParameter("rev_distin_cd");   // 리뷰 식별 코드
		
		//-- selectbox: name 속성을 통해 배열로 받는다.
		String[] viewArr = request.getParameterValues("view_rating");		// 시야 평점
		String[] seatArr = request.getParameterValues("seat_rating");		// 좌석 평점
		String[] lightArr = request.getParameterValues("light_rating");		// 조명 평점
		String[] soundArr = request.getParameterValues("sound_rating");		// 음향 평점
		
		String view_rating = "";
		String seat_rating = "";
		String light_rating = "";
		String sound_rating = "";
		
		// 선택한 평점들 꺼내기
		if(viewArr != null)
		{
			for(String list : viewArr)
				view_rating += list;
		}
		if(seatArr != null)
		{
			for(String list : seatArr)
				seat_rating += list;
		}
		if(lightArr != null)
		{
			for(String list : lightArr)
				light_rating += list;
		}
		if(soundArr != null)
		{
			for(String list : soundArr)
				sound_rating += list;
		}
		
		String seat_flow = request.getParameter("seat_flow");			// 층 (좌석정보)
		String seat_area = request.getParameter("seat_area");			// 구역
		String seat_line = request.getParameter("seat_line");			// 열
		String seat_num = request.getParameter("seat_num");				// 번호
		String seat_rev = request.getParameter("seat_rev");				// 좌석 상세 리뷰
		
		
		// 좌석 리뷰 테이블에 Insert (일반/5대 공연장 확인)
		if(theater_cd.equals("FC000011") || theater_cd.equals("FC000031") || theater_cd.equals("FC000012")
				|| theater_cd.equals("FC000001") || theater_cd.equals("FC000014"))
		{
			String mseat_sort_cd = request.getParameter("mseat_sort_cd");  // 좌석 구분 코드 (A1~A14 구역)
			
			// 5대 공연장 좌석 리뷰 객체 생성해 정보 담고 넘기기
			MSeatReview mseatreview = new MSeatReview();
			
			mseatreview.setRev_distin_cd(rev_distin_cd);
			mseatreview.setMseat_sort_cd(mseat_sort_cd);
			mseatreview.setView_rating(view_rating);
			mseatreview.setSeat_rating(seat_rating);
			mseatreview.setLight_rating(light_rating);
			mseatreview.setSound_rating(sound_rating);
			mseatreview.setSeat_flow(seat_flow);
			mseatreview.setSeat_area(seat_area);
			mseatreview.setSeat_line(seat_line);
			mseatreview.setSeat_num(seat_num);
			mseatreview.setSeat_rev(seat_rev);
			
			// 5대 공연장 좌석 리뷰에 insert
			dao.addMSeatReview(mseatreview);
			
		}else
		{
			// 일반 공연장 좌석 리뷰 객체 생성해 정보 담고 넘기기
			SeatReview seatreview = new SeatReview();
			
			seatreview.setRev_distin_cd(rev_distin_cd);
			seatreview.setView_rating(view_rating);
			seatreview.setSeat_rating(seat_rating);
			seatreview.setLight_rating(light_rating);
			seatreview.setSound_rating(sound_rating);
			seatreview.setSeat_flow(seat_flow);
			seatreview.setSeat_area(seat_area);
			seatreview.setSeat_line(seat_line);
			seatreview.setSeat_num(seat_num);
			seatreview.setSeat_rev(seat_rev);
			
			// 일반 공연장 좌석 리뷰에 insert
			dao.addSeatReview(seatreview);
		}
		
		// 다음 페이지에 Play 객체 넘기기 (공연코드 가져와서 넘기기)
		Play play = new Play();
		play = dao.searchPlay(play_cd);
		
		model.addAttribute("play", play);
		
		return "WEB-INF/views/review/AddReviewDetailForm.jsp";
	}
	
	
}
