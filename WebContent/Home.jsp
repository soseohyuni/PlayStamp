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
<title>Home.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=cp %>/css/myspace.css">
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

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
	
	.playTitle
	{
		font-size: 15px;
		font-weight: bold;
	}
		
	.reviewTitle
	{
		font-size: 25px;
		font-weight: bold;
		border: none;
		background-color: #fafafa;
		width: 280px;
		color: black;
		padding-top: 10px;
		text-align: left;
	}
	
	.playRating
	{
		border: none;
		background-color: #fafafa;
		font-size: 40px;
		font-weight: bold;
		color: black;
		margin: 0 auto;
		width: 280px;
		padding: 0 0 0 0;
		line-height: 32px;
		
	}
	
	input:focus
	{
		outline: none;
	}
	
	.likecomment
	{
		text-align: left;
		align: left;
		background-color: #fafafa;
	}
	
</style>
<script type="text/javascript">


$(function() {
   $('#lighttest').barrating({
     theme: 'fontawesome-stars'
     , initialRating: 5
   });
});

</script>
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
	
	<div>
	<select id="lighttest">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
	</select>
	</div>
	
	<!-- 리뷰 많은 공연순 정렬 -->
    <div id="highreviewSorting" class="container">
       <div id="pageTitle1" class="container"><img src="images/smileicon.png" style="width:2%;"> 리뷰 많은 공연순<br><br></div>
       <div id="imgContainer" class="row">
          <div class="col-lg-3 col-xs-6 col-md-3">
             <a href="#" class="thumbnail">
               <img src="<%=cp%>/images/phantom.jpg" alt="...">
             </a>
             <div class="playTitle">팬텀</div>
          </div>
          <div class="col-lg-3 col-xs-6 col-md-3">
             <a href="#" class="thumbnail">
               <img src="<%=cp%>/images/lionking.jpg" alt="...">
             </a>
             <div class="playTitle">라이언킹</div>
          </div>
            <div class="col-lg-3 col-xs-6 col-md-3">
               <a href="#" class="thumbnail">
               	<img src="<%=cp%>/images/redbook.png" alt="...">
               </a>
               <div class="playTitle">레드북</div>
            </div>
            <div class="col-lg-3 col-xs-6 col-md-3">
               <a href="#" class="thumbnail">
               	<img src="<%=cp%>/images/phantom.jpg" alt="...">
               </a>
               <div class="playTitle">시카고</div>
            </div>
       </div>
    </div>
    
    <br><br>
    
    <!-- 좋아요 많은 리뷰순 정렬 -->
    <div id="highLikeSorting" class="container">
       <div id="pageTitle2" class="container"><img src="images/hearticon.png" style="width:2%;"> 좋아요 많은 리뷰순<br><br></div>
       <div id="reviewContainer" class="row" style="height: 350px;">
       	 <div class="col-lg-4 col-xs-6 col-md-3" >
             <a href="#" class="thumbnail">
             	 <span class="user">
		             <img src="images/usericon.png" style="width: 24px; vertical-align: middle;">
					 <input type="text" class="userName" value="이웃집 고양이" readonly="readonly"><br>
				 </span>
				 <input type="text" class="playName" value="마리 앙투아네트" readonly="readonly"><br>
				 <input type="text" class="reviewTitle" value="코로나도 잊게한 공연!!!" readonly="readonly"><br>
				 <input type="text" class="playRating" value="★★★★★" readonly="readonly"><br>
				 <textarea class="reviewContent" readonly="readonly">요로분,, 제가 진짜 사랑에 빠졌던 뮤지컬 시카고 서울막공이 지난주 일요일에..</textarea><br>
				 <span class="likecomment">
					 <img src="images/blackhearticon.png" style="width: 24px;"><input type="text" class="reviewLike" value="40" readonly="readonly">
					 <img src="images/commenticon.png" style="width: 24px;"><input type="text" class="reviewComment" value="22" readonly="readonly"><br>
				 </span>
             </a>
         </div>
         
         <div class="col-lg-4 col-xs-6 col-md-3" >
             <a href="#" class="thumbnail">
             	 <span class="user">
		             <img src="images/usericon.png" style="width: 24px; vertical-align: middle;">
					 <input type="text" class="userName" value="이웃집 고양이" readonly="readonly"><br>
				 </span>
				 <input type="text" class="playName" value="마리 앙투아네트" readonly="readonly"><br>
				 <input type="text" class="reviewTitle" value="코로나도 잊게한 공연!!!" readonly="readonly"><br>
				 <input type="text" class="playRating" value="★★★★★" readonly="readonly"><br>
				 <textarea class="reviewContent" readonly="readonly">요로분,, 제가 진짜 사랑에 빠졌던 뮤지컬 시카고 서울막공이 지난주 일요일에..</textarea><br>
				 <span class ="likecomment">
					 <img src="images/blackhearticon.png" style="width: 24px;"><input type="text" class="reviewLike" value="40" readonly="readonly">
					 <img src="images/commenticon.png" style="width: 24px;"><input type="text" class="reviewComment" value="22" readonly="readonly"><br>
				 </span>
             </a>
         </div>
         
         <div class="col-lg-4 col-xs-6 col-md-3" >
             <a href="#" class="thumbnail">
             	 <span class="user">
		             <img src="images/usericon.png" style="width: 24px; vertical-align: middle;">
					 <input type="text" class="userName" value="이웃집 고양이" readonly="readonly"><br>
				 </span>
				 <input type="text" class="playName" value="마리 앙투아네트" readonly="readonly"><br>
				 <input type="text" class="reviewTitle" value="코로나도 잊게한 공연!!!" readonly="readonly"><br>
				 <input type="text" class="playRating" value="★★★★★" readonly="readonly"><br>
				 <textarea class="reviewContent" readonly="readonly">요로분,, 제가 진짜 사랑에 빠졌던 뮤지컬 시카고 서울막공이 지난주 일요일에..</textarea><br>
				 <span class="likecomment">
					 <img src="images/blackhearticon.png" style="width: 24px;"><input type="text" class="reviewLike" value="40" readonly="readonly">
					 <img src="images/commenticon.png" style="width: 24px;"><input type="text" class="reviewComment" value="22" readonly="readonly"><br>
				 </span>
             </a>
         </div>
       </div>
    </div><!-- clsoe #highLikeSorting -->
    
    <br><br>
    
    <!-- 평점 높은 공연순 정렬 -->
    <div id="highRateSorting" class="container">
       <div id="pageTitle3" class="container"><img src="images/goodicon.png" style="width:2%;"> 평점 높은 공연순<br><br></div>
       <div id="imgContainer" class="row">
          <div class="col-lg-3 col-xs-6 col-md-3">
             <a href="#" class="thumbnail">
               <img src="<%=cp%>/images/phantom.jpg" alt="...">
             </a>
             <div class="playTitle">팬텀</div>
          </div>
          <div class="col-lg-3 col-xs-6 col-md-3">
             <a href="#" class="thumbnail">
               <img src="<%=cp%>/images/lionking.jpg" alt="...">
             </a>
             <div class="playTitle">라이언킹</div>
          </div>
            <div class="col-lg-3 col-xs-6 col-md-3">
               <a href="#" class="thumbnail">
               	<img src="<%=cp%>/images/redbook.png" alt="...">
               </a>
               <div class="playTitle">레드북</div>
            </div>
            <div class="col-lg-3 col-xs-6 col-md-3">
               <a href="#" class="thumbnail">
               	<img src="<%=cp%>/images/phantom.jpg" alt="...">
               </a>
               <div class="playTitle">시카고</div>
            </div>
       </div>
    </div><!-- close #highRateSorting -->
    
</div><!-- close #wrapper -->

</body>
</html>
