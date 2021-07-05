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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- 별점 기능을 위한 아이콘을 CDN 방식으로 추가 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- 별점 이미지 파일을 다운받은 뒤 css폴더에 추가해 경로 지정 -->
<link rel="stylesheet" href="<%=cp %>/css/fontawesome-stars.css">
<!-- 별점 콜백 함수 호출을 위해 js 폴더에 추가해 경로 지정 -->
<script src="<%=cp %>/js/jquery.barrating.min.js"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
 integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<style type="text/css">	
	#img { text-align:center;}
	
	#playTable td {	width:100px; height:20px;
					text-align: center; }
		
	#tab { width: 60%; margin: auto; }
	
	.tab-content { border: 0.3px solid gray; }
	
	.subContainer { text-align: center; }
	#pageTitle { float: left; font-size: 20px;}	
	#dtTitle { float: right;}	
	#reviewTitle { display:inline-block;zoom:1;.display:inline; font-size: 25px;}	
	
	.container { width: 1300px; }
	
	#header { margin: auto; }
	
	#table { margin: auto; width: 80%; }	
	
	#playReview { text-align: left; }
	div#playReview > table > tbody > tr > td:nth-child(1) { width: 10px; }
	div#playReview > table > tbody > tr > td:nth-child(2) { height: 10px; }
	
	#report { float: right;}
	
	#reviewEnter{ font-weight: bold;}
</style>
<script type="text/javascript">	
	
	var playRev = "";
	
	<c:forEach var="playReviewDetail" items="${playReviewDetail }">
		playRev = "${playReviewDetail.rating_cd}"
	</c:forEach> 
	
	$(function()
	{
		//@@ 공연상세 별점
		$("#playRev").barrating({
			theme: "fontawesome-stars"
	        , initialRating: playRev
	        , readonly: true
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
		
		<!-- 상단 -->
		<div class="subContainer">
			<span id="pageTitle">리뷰 정보</span>
			<c:forEach var="playReviewDetail" items="${playReviewDetail }">
			<span id="reviewTitle">${playReviewDetail.title }</span>
			<hr>
			<span id="dtTitle">작성일자: ${playReviewDetail.playrev_dt }</span>
			</c:forEach>
		</div>
		<br><br>
			
			
		<!-- 리뷰 상세 출력 -->
		<div id="table">
			<table class="table table-borderless" id="playTable">
			<c:forEach var="playReviewDetail" items="${playReviewDetail }">
				<tr>
					<td rowspan="5">
					<div id="img"><img src="${playReviewDetail.play_img }" style="height: 240px;"></div>
					</td>
					<td>공연명</td>
					<td><input type="text" disabled="disabled" value="${playReviewDetail.play_nm }" ></td>
				</tr>
				<tr>
					<td>공연날짜</td>
					<td>
					<input type="text" disabled="disabled" value="${playReviewDetail.play_dt }" style="width: 100px;">
					</td>
				</tr>
				<tr>
					<td>공연시간</td>
					<td><input type="text" disabled="disabled" value="${playReviewDetail.play_time }"></td>
				</tr>
				<tr>
					<td>공연장소</td>
					<td><input type="text" disabled="disabled" value="${playReviewDetail.theater }"></td>
				</tr>
				<tr>
					<td>출연진</td>
					<td><input type="text" disabled="disabled" value="${playReviewDetail.play_cast }"
					style="width: 450px;"></td>
				</tr>
				<tr>
					<td>
						<select id="playRev">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</td>
					<td>함께 본 사람</td>
					<td><input type="text" disabled="disabled" value="${playReviewDetail.companion }"></td>
				</tr>
				<tr>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td id="reviewEnter">공연 상세 리뷰</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="3"><textarea rows="5%" cols="100%" disabled="disabled">${playReviewDetail.contents }</textarea></td>
				</tr>
				</c:forEach>
			</table>
		</div>
			
		<!-- 댓글 전 -->
		<div class="subContainer2">
			<c:forEach var="playReviewDetail" items="${playReviewDetail }">
			<span id="count">
			<span style="color: #FE2E2E"><i class="fas fa-heart fa-lg"></i></span>&nbsp;${playReviewDetail.ccount }
			<span style="color: #0080FF"><i class="fa fa-comment fa-lg" aria-hidden="true"></i></span></i>&nbsp;${playReviewDetail.lcount }
			&nbsp;작성자: ${playReviewDetail.user_nick }			
			</span>
			<button type="button" id="report">리뷰 신고</button>		
			<hr>
			</c:forEach>
		</div>
		
			<!-- 댓글 ^^ -->
			<div></div>
		</div>
	</div>
</div>
</body>
</html>