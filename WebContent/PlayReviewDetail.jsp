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
<title>PlayReviewDetail.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">	
	#img { text-align:center;}
	
	#playTable td {	width:100px; height:20px;
					text-align: center;}
	
	#playTable { width:60%; margin: auto; }
	
	#tab { width: 60%; margin: auto; }
	
	.tab-content { border: 0.3px solid gray; }
	
	#pageTitle { float: left; }
	
	#backList { float: right;}
	
	#container { width: 1300px;}
	
	#reviewDetail { text-align: center; }
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
<!-- 상단바 -->
	<div>
		<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
	</div>
<!-- 내용 출력 시작 -->	
	<div id="wrapper" style="width: 100%;">
		<div class="container">
		
		<!-- 메뉴 -->
			<div id="pageTitle" class="container">공연 상세 정보
			<button type="button" id="backList">목록으로</button>
			</div>
			
			<br><hr>
			
			
		<!-- 공연 상세 출력 -->
			<div id="top">
				<table class="table table-borderless" id="playTable">
					<tr>
						<td colspan="3" rowspan="5">
						<div id="img"><img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF174380_210507_102341.gif" style="height: 240px;"></div>
						</td>
						<td>공연명</td>
						<td><input type="text" disabled="disabled"></td>
					</tr>
					<tr>
						<td>공연기간</td>
						<td><input type="text" disabled="disabled"></td>
					</tr>
					<tr>
						<td>공연장소</td>
						<td><input type="text" disabled="disabled"></td>
					</tr>
					<tr>
						<td>출연진</td>
						<td><input type="text" disabled="disabled"></td>
					</tr>
					<tr>
						<td colspan="2">찜리스트에 저장 ♡</td>
					</tr>
					<tr>
						<td colspan="3">★★★★★</td>
						<td colspan="2"></td>
					</tr>			
				</table>
			</div>
			
			<!-- 공연 리뷰 상세 -->
			공연 상세 리뷰
			<br><br>
			<div id="reviewDetail">
				<textarea rows="8%" cols="98%"></textarea>
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
					    <p>페이징 처리 된 공연 리뷰가 출력될 화면입니당동.</p><!-- 여기에 페이징 처리 된 리뷰 출력 -->
					  </div>
					  <div class="tab-pane fade" id="seatReview">
					    <p>페이징 처리 된 좌석 리뷰가 출력될 화면입니당동.</p><!-- 여기에 페이징 처리 된 리뷰 출력 -->
					  </div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>