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
<title>나의 캐시</title>
<link href="<%=cp%>/css/myspace.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<style>
			p { margin:20px 0px; }
		</style>
</head>
<body>
<!-- 메뉴 영역 -->
	<div>
		<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
	</div>
	
	<div id="wrapper">
		<div class="container">
			<div id="pageTitle" class="container">나의 캐시 내역</div>
			<div id="topBox" class="inBox">
				<div class="mTitle">현재 내 캐시 : 0</div>
				<div class="btn-group btn-group-lg" role="group" aria-label="...">
				  <button type="button" class="btn btn-default">충전하기</button>
				  <button type="button" class="btn btn-default">출금하기</button>
				</div>
			</div>
			
			<table id="cashTable" class="table table-hover">
			<tr>
				<th>적립/차감</th>
				<th></th>
				<th>적립/차감 포인트</th>
				<th>총포인트</th>
			</tr>
			<tr>
				<td>리뷰 작성</td>
				<td>2021.06.11 19:33</td>
				<td>+5</td>
				<td>320p</td>
			</tr>
			<tr>
				<td>좋아요</td>
				<td>2021.06.11 09:30</td>
				<td>+1</td>
				<td>315p</td>
			</tr>
			<tr>
				<td>로그인</td>
				<td>2021.06.11 05:30</td>
				<td>+2</td>
				<td>313p</td>
			</tr>
			<tr>
				<td>미로그인</td>
				<td>2021.06.11 11:59</td>
				<td>-1</td>
				<td>311p</td>
			</tr>
			<tr>
				<td>리뷰 작성</td>
				<td>2021.06.11 19:33</td>
				<td>+5</td>
				<td>320p</td>
			</tr>
			</table>
			

			<ul class="pagination">
			    <li class="page-item"><a class="page-link" href="">이전</a></li>
			    <li class="page-item"><a class="page-link" href="">1</a></li>
			    <li class="page-item"><a class="page-link" href="">2</a></li>
			    <li class="page-item"><a class="page-link" href="">3</a></li>
			    <li><a class="page-link" href="">다음</a></li>
			</ul>


		</div>
	</div>
	
	
	
	
	
	
</body>
</html>