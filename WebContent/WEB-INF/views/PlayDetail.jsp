<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>PlayDetail.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">	
	#img { text-align:center;}
	
	#playTable td {	width:100px; height:20px;
					text-align: center;}
		
	#tab { width: 60%; margin: auto; }
	
	.tab-content { border: 0.3px solid gray; }
	
	#pageTitle { float: left; margin: auto;}
	
	#backList { float: right;}
	
	.container { width: 1300px;}
	
	#header { margin: auto;}
	
	#table { margin: auto; width: 80%;}
	
</style>
<script type="text/javascript">
	$(function()
	{
		$("#backList").click(function()
		{
				$(location).attr("href", "musicallist.action");
		});
	});
</script>
</head>

<body>
<div class="container">
<!-- 상단바 -->
	<div id="header">
		<c:import url="/WEB-INF/views/header.jsp"></c:import>
	</div>
<!-- 내용 출력 시작 -->	
	<div id="wrapper">
		<div>
		
		<!-- 메뉴 -->
			<div id="pageTitle" class="container">공연 상세 정보
			<button type="button" id="backList">목록으로</button>
			</div>
			
			<br><hr>
			
			
		<!-- 공연 상세 출력 -->
			<div id="table">
				<table class="table table-borderless" id="playTable">
				<c:forEach var="playDetail" items="${playDetailList }">
					<tr>
						<td rowspan="4">
						<div id="img"><img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF174380_210507_102341.gif" style="height: 240px;"></div>
						</td>
						<td>공연명</td>
						<td><input type="text" disabled="disabled" value="${playDetail.play_nm}" }></td>
					</tr>
					<tr>
						<td>공연기간</td>
						<td><input type="text" disabled="disabled" value="${playDetail.play_start}"></td>
					</tr>
					<tr>
						<td>공연장소</td>
						<td><input type="text" disabled="disabled" value="${playDetail.theater}"></td>
					</tr>
					<tr>
						<td>출연진</td>
						<td><input type="text" disabled="disabled" value="${playDetail.play_cast}"
						style="width: 500px;"></td>
					</tr>

					<tr>
						<td>★★★★★</td>
						<td></td>
						<td>찜리스트에 저장 ♡</td>
					</tr>
				</c:forEach>			
				</table>
			</div>
			
			<!-- 탭 -->
			<div id="tab">
				<ul class="nav nav-tabs">
				  <li class="nav-item">
				    <a class="nav-link active" data-toggle="tab" href="#playReview">공연리뷰</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" data-toggle="tab" href="#seatReview">좌석리뷰</a>
				  </li>
				</ul>
				<div class="tab-content">
					  <div class="tab-pane fade show active" id="playReview">
					  	<table>
					  		<tr>
					  			<th>공연이미지</th>
					  			<th>평점</th>
					  			<th>공연명</th>
					  			<th>리뷰내용</th>
					  			<th>좋아요수</th>
					  			<th>댓글수</th>
					  			<th>닉네임</th>
					  		</tr>
					  		<c:forEach var="playRevPre" items="${playRevPreList }">
					    		<tr>
					  				<td><img src="${playRevPre.play_img}"></td>
					  				<td>${playRevPre.rating_cd}</td>
					  				<td>${playRevPre.play_nm}</td>
					  				<td>${playRevPre.contents}</td>
					  				<td>${playRevPre.lcount}</td>
					  				<td>${playRevPre.ccount}</td>
					  				<td>${playRevPre.user_nick}</td>					  				
					  			</tr>
					    	</c:forEach>
					  	</table>
					  </div>
					  <div class="tab-pane fade" id="seatReview">
					    <table>
					  		<tr>
					  			<th>층</th>
					  			<th>구역</th>
					  			<th>열</th>
					  			<th>번호</th>
					  			<th>공연명</th>
					  			<th>공연일</th>
					  			<th>내용</th>
					  			<th>시야평점</th>
					  			<th>좌석평점</th>
					  			<th>조명평점</th>
					  			<th>음향평점</th>
					  		</tr>
					  		<c:forEach var="seatRev" items="${seatRevList }">
					    		<tr>
					  				<td>${seatRev.seat_flow}</td>
					  				<td>${seatRev.seat_area}</td>
					  				<td>${seatRev.seat_line}</td>
					  				<td>${seatRev.seat_num}</td>
					  				<td>${seatRev.play_nm}</td>
					  				<td>${seatRev.play_dt}</td>
					  				<td>${seatRev.seat_rev}</td>					  				
					  				<td>${seatRev.view_rating}</td>					  				
					  				<td>${seatRev.seat_rating}</td>					  				
					  				<td>${seatRev.light_rating}</td>					  				
					  				<td>${seatRev.sound_rating}</td>					  				
					  			</tr>
					    	</c:forEach>
					  	</table>
					  </div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>