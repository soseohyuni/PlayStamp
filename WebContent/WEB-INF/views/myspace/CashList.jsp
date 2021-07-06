<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				<div class="mTitle">현재 내 캐시 : <b>${userCash }</b>원</div>
				<div class="btn-group btn-group-lg" role="group" aria-label="..." style="float: right;">
				  <button type="button" class="btn btn-default">충전하기</button>
				  <button type="button" class="btn btn-default">출금하기</button>
				</div>
			</div>
			
			<table id="cashTable" class="table table-hover">
			<tr>
				<th>적립/차감</th>
				<th></th>
				<th>적립/차감 캐시</th>
				<th>총 캐시</th>
			</tr>
			<c:forEach var="cash" items="${cashList}">
				<tr>
					<td>${cash.cash_y }</td>
					<td style="color: #bfbfbf;">${cash.cash_dt }</td>
					<c:choose>

						<c:when test = "${fn:contains(cash.cash, '-')}">
					        <td style="color: red;">${cash.cash }</td>
					    </c:when>
					    <c:otherwise>
					     	<td style="color: blue;">${cash.cash }</td>
					    </c:otherwise>
				    
				    </c:choose>
					<td style="font-weight: 500;">${cash.user_cash }</td>
				</tr>
			</c:forEach>
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