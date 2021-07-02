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
<link href="<%=cp%>/css/myspace.css" rel="stylesheet">
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
					<a href="myprofile.action"><div class="listArea">더보기</div></a>
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