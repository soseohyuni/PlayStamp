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
<!-- 부트스트랩, 제이쿼리 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- 별점 기능을 위한 아이콘을 CDN 방식으로 추가 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- 별점 이미지 파일을 다운받은 뒤 css폴더에 추가해 경로 지정 -->
<link rel="stylesheet" href="<%=cp %>/css/fontawesome-stars.css">
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- 별점 콜백 함수 호출을 위해 js 폴더에 추가해 경로 지정 -->
<script src="<%=cp %>/js/jquery.barrating.min.js"></script>
<style type="text/css">
	.center
	{
		margin:0 auto;
		text-align: center;
	}
	#content 
	{
	    width: 1300px;
	}
	.box1 
	{
		margin-left: 380px;
		width: 300px;
		float: left;
		margin-right: 20px;
	}
	.box2 
	{
		width: 600px;
		float: left;
	}
	textarea
	{
		width: 600px;
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
		width: 200px;
		height: 270px;
	  	background-position: center center;
	  	background-size: cover;
	  	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
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
		width: 80px;
	}
	#date
	{
		font-size: 20px;
		text-align: right;
	}
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
	    
	    $('#view').barrating({
		      theme: 'fontawesome-stars'
		      , initialRating: star
		      , readonly: true
		});
	    
	    $('#seat').barrating({
		      theme: 'fontawesome-stars'
		      , initialRating: star
		      , readonly: true
		});
	    
	    $('#sound').barrating({
		      theme: 'fontawesome-stars'
		      , initialRating: star
		      , readonly: true
		});
	    
	    $('#light').barrating({
		      theme: 'fontawesome-stars'
		      , initialRating: star
		      , readonly: true
		});
	 });
   
</script>
</head>
<body>
<div id="textbox">
	<h5>
		<img src="<%=cp%>/images/addReviewIcon.PNG" width="20px" height="20px">리뷰 정보
	</h5>
	<hr>
</div>
<br><br>
<div id="content">
	<span id="date">작성일자: 2021.06.10</span>
	<div class="box1">
		<br>
		<img src="" class="imagePreview">
		<br><br>
		<select id="rating">
					<option value="1">1</option>
				  	<option value="2">2</option>
				  	<option value="3">3</option>
				  	<option value="4">4</option>
				  	<option value="5">5</option>
		</select>
	</div><!-- box1 -->
	<div class="box2">
		<table class="table">
			<tr>
				<td colspan="2" id="reviewtitle">리뷰 제목은 이렇게 나옵니다.</td>
			</tr>
			<tr>
				<th class="subtitle">공연명</th>
				<td>공연명은 이렇게 나옵니다.</td>
			</tr>
			<tr>
				<th class="subtitle">공연 날짜</th>
				<td>2021년 6월 10일</td>
			</tr>
			<tr>
				<th class="subtitle">공연 시간</th>
				<td>18:00</td>
			</tr>
			<tr>
				<th class="subtitle">공연 장소</th>
				<td>샤롯데씨어터</td>
			</tr>
			<tr>
				<th class="subtitle">출연진</th>
				<td>옥주현, 윤공주, 윤형렬, 민영기</td>
			</tr>
			<tr>
				<th class="subtitle">티켓 금액</th>
				<td>130,000</td>
			</tr>
			<tr>
				<th class="subtitle">함께 본 사람</th>
				<td>친구</td>
			</tr>
		</table>
	</div><!-- box2 -->	
	<br><br><br>
	<div>
		<b>공연 상세 리뷰</b>
	</div>
	<div>
		<textarea id="review" rows="10" value="" readonly="readonly"></textarea>
	</div>
</div>
<br><br><br><br><br><br><br><br>

</body>
</html>