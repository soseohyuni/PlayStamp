<%@ page contentType="text/html; charset=UTF-8" %>
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
	
	.ratingContainer
	{
		position: relative;
        right: 87px;
        size: 120px;
	}
	
	.reviewComment, .reviewLike
	{
		width: 25px;
		border: none;
		align: left;
		color: black;
		background-color: #fafafa;
	}
	
	.reviewComment
	{
		margin-left: 5px;
	}
	
	.user
	{
		font-weight: bold;
		font-size: 16px;
		border: none;
		background-color: #fafafa;
		color: black;
		padding: 5px;
		right: 20px;
		position: relative;
		margin-top: 5px;
	}
	
	.userName
	{
		background-color: #fafafa;
		border: none;
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
		font-size: 12pt;
		font-weight: bold;
		color: black;
		padding: 5px;
		margin-top: 10px;
		width: 280px;
		
		white-space: nowrap;
		overflow: hidden;
  		text-overflow: ellipsis;
  		border-color: #c2c2c2;
	}
	
	#pageTitle1, #pageTitle2, #pageTitle3
	{
		font-size: 15px;
		font-weight: bold;
		left: 70px;
		margin-bottom: 0px;
		height: 34px;
	}
	
	.reviewContent
	{
		height: 70.5px;
		width: 300px;
		display: block;
		background-color: #fafafa;
		
		left: 14px;
		font-size: 10pt;
		color: black;
		padding: 10px;
		
		white-space: pre-line; 
		overflow: hidden;
  		text-overflow: ellipsis;
  		
  		
  		text-align: justify;
  		border: 1px solid;
  		position: relative;
  		border-color: #c2c2c2;
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
		overflow: hidden;
  		text-overflow: ellipsis;
  		width: 245px;
  		white-space: nowrap;
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
		
		white-space: nowrap;
		overflow: hidden;
  		text-overflow: ellipsis;
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
		background-color: #fafafa;
		position: relative;
		left: 105px;
		bottom: 5px;
	}
	
</style>
<script type="text/javascript">

	    // 공연 평점을 담을 배열
	    var array = new Array();
	    
	    // 평점 값 list 에 담기
	    <c:forEach var="list" items="${highLikeSorting}">   
	    	array.push("${list.rating_cd}");
	    </c:forEach>
	    
	    // 별점 제이쿼리
	    $(function()
	    {
	       for (var i=0; i<array.length; i++)
	       {
	          // 공연 평점을 별점으로 변환
	          $("#rating"+i).barrating(
	          {
	             theme: "fontawesome-stars"
	               , initialRating: array[i]
	               , readonly: true
	           });
	       }
	    }); 
	    
	    /* 
	    function nextImg()
	    {
	    	<c:forEach var="list" items="${highReviewSorting}" begin="4" end="7">   
		    	array.push("${list.pc}");
		    </c:forEach>
	    }
		 */
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
	</div><br><br>

	<!-- 리뷰 많은 공연순 리스트 출력 -->
    <div id="highReviewSorting" class="container">
       <div id="pageTitle1" class="container"><img src="images/smileicon.png" style="width:2%;"> 리뷰 많은 공연순<br><br></div>
       <div id="imgContainer" class="row">
       		<div id="reviewFirstSorting">
       		<c:forEach var="listReview" items="${highReviewSorting }" end="3">
	          <div class="col-lg-3 col-xs-6 col-md-3">
	             <a href="playdetail.action?play_cd=${listReview.play_cd }" class="thumbnail">
	               <img src="${listReview.play_img }">
	             </a>
	             <div class="playTitle">${listReview.play_nm }</div>
	          </div>
	         </c:forEach>
	         </div>
       </div>
    </div>
    <a href="javascript:prevImg();" id="prevImg" class="btn btn-default" style="background-color: red;"></a>
    <a href="javascript:nextImg();" id="nextImg" class="btn btn-default" style="background-color: blue;"></a>
    <!-- <button type="button" id="nextImg" class="btn btn-default" style="background-color: blue;"></button> -->
    <br><br><br><br><br><br>
    
    <!-- 좋아요 많은 리뷰순 리스트 출력 -->
    <div id="highLikeSorting" class="container">
       <div id="pageTitle2" class="container"><img src="images/hearticon.png" style="width:2%;"> 좋아요 많은 리뷰순<br><br></div>
       <div id="reviewContainer" class="row" style="height: 350px;">
       	 <c:set var="i" value="0"></c:set>
       	 <c:forEach var="listLike" items="${highLikeSorting }" end="2">
	       	 <div class="col-lg-4 col-xs-6 col-md-3">
	             <a href="playreviewdetail.action?playrev_cd=${listLike.playrev_cd }" class="thumbnail">
	             	 <span class="user">
			             <img id="userImage" src="${listLike.user_img }">
						 <input type="text" class="userName" value="${listLike.user_nick }" readonly="readonly"><br>
					 </span>
					 <input type="text" class="playName" value="${listLike.play_nm }" readonly="readonly"><br>
					 <input type="text" class="reviewTitle" value="${listLike.title }" readonly="readonly"><br>
					 <span class="ratingContainer" style="display: block">
					 <select id="rating${i}">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					 </select>
					 </span>
					 <span class="reviewContent">${listLike.contents }</span><br>
					 <span class="likecomment">
						 <img src="images/heartblack.png" style="width: 25px;"><input type="text" class="reviewLike" value="${listLike.like_count }" readonly="readonly">
						 <img src="images/commenticon.png" style="width: 20px;"><input type="text" class="reviewComment" value="${listLike.comment_count }" readonly="readonly"><br>
					 </span>
	             </a>
	         </div>
	     <c:set var="i" value="${i+1}"></c:set>
         </c:forEach>
       </div>
    </div><!-- clsoe #highLikeSorting -->
    
    <br><br><br><br><br><br>
    
    <!-- 평점 높은 공연순 리스트 출력 -->
    <div id="highRateSorting" class="container">
       <div id="pageTitle3" class="container"><img src="images/goodicon.png" style="width:2%;"> 평점 높은 공연순<br><br></div>
       <div id="imgContainer" class="row">
          <c:forEach var="listRate" items="${highRateSorting }" end="3">
	          <div class="col-lg-3 col-xs-6 col-md-3">
	             <a href="playdetail.action?play_cd=${listRate.play_cd }" class="thumbnail">
	               <img src="${listRate.play_img }">
	             </a>
	             <div class="playTitle">${listRate.play_nm }</div>
	          </div>
	      </c:forEach>
       </div>
    </div><!-- close #highRateSorting -->
    
    <br><br><br>
    
</div><!-- close #wrapper -->

</body>
</html>
