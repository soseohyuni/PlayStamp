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
<title>마이스페이스</title>
<style type="text/css">
	#wrapper { width: 100%; height: 100%; align-content: center; }
	#wrapper .container
	{
		width:1300px;
	}
	
	#profile { width: 33%;}
	#listArea {  width: 33%; text-align: center;}
	#addReview { width: 33%; text-align: center;}
	
	#firstArea, #secondArea, #thirdArea {display: flex; align-items: center; padding-bottom: 50px; }
	
	#container .myspace { flex: 1; }
	
	.myspace { padding: 20px;}
	
	.myspace, .listArea {width: 100%; display: inline-block; align-items: center;}
	
	.line {border-left: 1px solid #999; width: 0.1px; height: 50px;}
	
	#secondArea .outBox{width: 100%; padding-bottom: 50px;}
	#secondArea > div:first-child {margin-right: 30px;}
	.inBox { background-color: #999;  height: 100px; border-radius: 20px; background-color: #fafafa; padding: 20px;}
	
	.inBox1 { margin-bottom: 30px; }
	.counting {font-size: 28px; font-weight: bold; text-align: right;}
	.bTitle { font-size: 28px; font-weight: bold; text-align: right; }
	.sTitle{ font-weight: bold; }
	.profileBox {
    width: 80px;
    height: 80px; 
    border-radius: 70%;
    overflow: hidden;
    border: 2px solid blue;
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}

</style>
</head>
<body>
<!-- 메뉴 영역 -->
	<div>
		<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
	</div>
	
	<div id="wrapper">
		<!-- 1층 -->
		<div id="firstArea" class="container">
			<div id="profile" class="myspace">
				<div class="profileBox"><img class="profile" alt="" src="images/profile.png"></div>
				<div>
					<div class="userNick">뮤뮤덕</div>
					<div class="userMail">mumuu@naver.com</div>
					<a href="#"><div class="listArea">더보기</div></a>
				</div>
			</div>
			<div class="line"></div>
			<div id="listArea" class="myspace">
				<div>
					<div class="listArea">현재 내 포인트 ></div>
					<div class="listArea"><a href="pointlist.action">320 P</a></div>
				</div>
				<div>
					<div class="listArea">현재 내 캐시 ></div>
					<div class="listArea"><a href="cashlist.action"">320 P</a></div>
				</div>
			</div>
			<div class="line"></div>
			<div id="addReview" class="myspace">
				리뷰 추가하기
			</div>
		</div>
		
		<!-- 2층 -->
		<div id="secondArea" class="container">
			<div class="outBox">
				<div id="box1" class="inBox inBox1">
					<div class="sTitle"><a>나의 관람 리뷰></a></div>
					<div class="counting"><a href="#">72개</a></div>
				</div>
				<div id="box2" class="inBox inBox2">
					<div class="sTitle"><a>나의 찜리스트></a></div>
					<div class="counting"><a href="#">24개</a></div>
				</div>
			</div>
			<div class="outBox">
				<div id="box1" class="inBox inBox1">
					<div class="bTitle"><a>나의 활동 / 신고 관리</a></div>
				</div>
				
				<div id="box2" class="inBox inBox2">
					<div class="bTitle"><a>나의 관람 통계</a></div>
				</div>
			</div>
		</div>
		
		<!-- 3층 -->
		<div id="thirdArea" class="container">나의 관람 캘린더</div>
		
	</div>
	
</body>
</html>