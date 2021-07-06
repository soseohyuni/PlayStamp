<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=cp %>/css/myspace.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 별점 기능을 위한 아이콘을 CDN 방식으로 추가 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- 별점 이미지 파일을 다운받은 뒤 css폴더에 추가해 경로 지정 -->
<link rel="stylesheet" href="<%=cp %>/css/fontawesome-stars.css">
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- 별점 콜백 함수 호출을 위해 js 폴더에 추가해 경로 지정 -->
<script type="text/javascript" src="<%=cp %>/js/jquery.barrating.min.js"></script>


<style type="text/css">
	
	.reviewComment, .reviewLike
	{
		width: 25px;
		border: none;
		align: left;
		color: black;
	}
	
	.userName
	{
		font-weight: bold;
		font-size: 20px;
		border: none;
		background-color: #fafafa;
		color: black;
		padding: 5px;
	}
	
	#userImage
	{
		border-radius: 70%;
    	overflow: hidden;
    	width: 26px; 
    	height: 26px;
    	vertical-align: middle;
	}
	
	.playName
	{
		border: 1px solid;
		text-align: center;
		padding: 1px;
		border-radius: 1em;
		font-size: 15pt;
		font-weight: bold;
		color: black;
		padding: 5px;
	}
	
	#pageTitle1, #pageTitle2, #pageTitle3
	{
		font-size: 18px;
		font-weight: bold;
		left: 70px;
		margin-bottom: 0px;
		height: 34px;
	}
	
	.reviewContent
	{
		height: 90px;
		width: 280px;
		background-color: #fafafa;
		
		font-size: 10pt;
		color: black;
		padding: 10px;
	}
	
	#imgContainer, #reviewContainer
	{
		width: 1100px;
		text-align: center;
		margin: 0 auto;
		background-color: #fafafa;
		height: 370px;
	}
	
	.reviewContainer
	{
		margin-bottom: 0px;
	}
	
	.thumbnail
	{
		margin-top: 10px;
		margin-bottom: 2px;
		background-color: #fafafa;
	}
	
</style>
</head>
<body>

<!-- 헤더 임포트 -->
<c:import url="header.jsp"></c:import><br><br><br>

<div id="wrapper">

	<div class="container">
      
      <div class="jumbotron" style="margin: 0 0 40px 0 !important;">
        <h1>Welcome to PlayStamp!</h1>
        <p>공연 관람을 기록하고 공유해보세요</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">리뷰 추가하기</a></p>
   	  </div>
	</div>
    
    <!-- 평점 높은 공연순 리스트 출력 -->
    <div class="container">
       <div id="imgContainer" class="row">
	          <div class="col-lg-3 col-xs-6 col-md-3">
	             <a href="#" class="thumbnail">
	               <img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF146722_190222_100150.gif">
	             </a>
	             <div class="playTitle">공연명</div>
	              <a href="#" class="thumbnail">
	               <img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF146722_190222_100150.gif">
	             </a>
	             <div class="playTitle">공연명</div>
	              <a href="#" class="thumbnail">
	               <img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF146722_190222_100150.gif">
	             </a>
	             <div class="playTitle">공연명</div>
	              <a href="#" class="thumbnail">
	               <img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF146722_190222_100150.gif">
	             </a>
	             <div class="playTitle">공연명</div>
	              <a href="#" class="thumbnail">
	               <img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF146722_190222_100150.gif">
	             </a>
	             <div class="playTitle">공연명</div>
	              <a href="#" class="thumbnail">
	               <img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF146722_190222_100150.gif">
	             </a>
	             <div class="playTitle">공연명</div>
	          </div>

    </div><!-- close #highRateSorting -->
    <div class="row">
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="..." alt="...">
      <div class="caption">
        <h3>Thumbnail label</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
      </div>
    </div>
  </div>
</div>
    
    
    
</div><!-- close #wrapper -->

</body>
</html>