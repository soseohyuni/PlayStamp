<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PlayReviewDetail.jsp</title>
<link href="<%=cp%>/css/header.css" rel="stylesheet">
<!-- 부트스트랩 적용을 위한 3줄: 제이쿼리 스크립트 포함 -->
<link rel="stylesheet" href="<%=cp %>/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>
<!-- 별점 기능을 위한 아이콘을 CDN 방식으로 추가 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- 별점 이미지 파일을 다운받은 뒤 css폴더에 추가해 경로 지정 -->
<link rel="stylesheet" href="<%=cp %>/css/fontawesome-stars.css">
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- 별점 콜백 함수 호출을 위해 js 폴더에 추가해 경로 지정 -->
<script src="<%=cp %>/js/jquery.barrating.min.js"></script>
<style type="text/css">
	.content 
	{
	    width: 1300px;
	    margin:0 auto;
	}
	.center 
	{
		margin: 0 auto;
	}
	.error_next_box 
	{
	    margin-top: 9px;
	    font-size: 12px;
	    color: red;    
	    display: none;
	}
	#alertTxt 
	{
	    position: absolute;
	    top: 19px;
	    right: 38px;
	    font-size: 12px;
	    color: red;
	    display: none;
	}
	#reviewdetail
	{
		display: block;
	    width: 100%;
	    height: 200px;
	    border: solid 1px #dadada;
	    padding: 10px 14px 10px 14px;
	    box-sizing: border-box;
	    background: #fff;
	    position: relative;
	}
	.imagePreview 
	{
		width: 250px;
		height: 300px;
	  	background-position: center center;
	  	background-size: cover;
	  	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	  	text-align:center;
	}
	#rating
	{
		text-align: left;
	}
	.subtitle
	{
		width: 120px;
	}
	#reviewtitle
	{
		text-align: center;
		font-size: 30px;
	}
	table
	{
		border-spacing: 2px;
	}
	.seat
	{
		width: 50px;
		height: 23px;
		border: gray;
	}
	th
	{
		width: 115px;
	}
	.form-control
	{
		height: 30px;
	}
	#reviewTitle
	{
		font-size: 30px;
		text-align: center;
	}
	#info
	{
		font-size: 15px;
		text-align: right;
	}
    #img { text-align:center;} 
    #reviewdetailtable td { height:20px; }
    #reviewdetailtable { width:60%; margin: auto; }
    #uploadFile { text-align:center;}
</style>
<script type="text/javascript">

   $(function(){
	   // 사용자가 작성한 리뷰의 공연별점 받아오기(임의로 3 설정)
	   var star = 3;
	   
	    $('#rating').barrating({
	      theme: 'fontawesome-stars'
	      , initialRating: star
	      , readonly: true
	    });
	 });
   
</script>
</head>
<body>
<!-- 헤더 추가 -->
<div>
	<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
</div>

<div id="textbox">
	<h5>
		<img src="<%=cp%>/images/addReviewIcon.PNG" width="20px" height="20px">리뷰 정보
	</h5>
	<hr>
</div>
<br><br>

<div class="content">
	<form class="content">
		<table class="table table-borderless" id="reviewdetailtable">
			<tr>
				<td colspan="4" id="info">작성일자: 2021년 6월 20일  조회수: 22</td>
			</tr>
			<tr>
				<td colspan="2" rowspan="7" style="width:50px; margin:0 auto;">
					<br>
					<!-- 첨부 사진 보기 -->
					<div class="imagePreview"></div>
				</td>
				<th colspan="2" id="reviewTitle">리뷰 제목은 이렇게 나옵니다.</th>
			</tr>
			<tr>
				<th>작성자</th>
				<td>이웃집 고양이</td>
			</tr>
			<tr>
				<th>공연명</th>
				<td>공연명은 이렇게 나옵니다.</td>
			</tr>
			<tr>
				<th>공연 날짜</th>
				<td>2021년 6월 10일</td>
			</tr>
			<tr>
				<th>공연 시간</th>
				<td>18:00</td>
			</tr>
			<tr>
				<th>공연 장소</th>
				<td>샤롯데씨어터</td>
			</tr>
			<tr>
				<th>출연진</th>
				<td>옥주현, 윤공주, 윤형렬, 민영기</td>
			</tr>
			<tr>
				<th style="text-align:center;">공연 평점</th>
				<td>
					<select id="rating"">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select>
				</td>
				<th>함께 본 사람</th>
				<td>친구</td>
			</tr>
			<tr>
				<th colspan="4">공연 상세 리뷰</th>
			</tr>
			<tr>
				<td colspan="4"><textarea id="reviewdetail" cols="55" rows="10"
				readonly class="form-control"></textarea></td>
			</tr>
		</table>
		<br><br>
	</form>
</div><!-- close #content -->


<br><br><br><br><br><br><br><br>
</body>
</html>