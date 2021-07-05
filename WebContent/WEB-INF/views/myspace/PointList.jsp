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
<title>나의 포인트</title>
<link href="<%=cp%>/css/myspace.css" rel="stylesheet">
</head>
<body>
<!-- 메뉴 영역 -->
	<div>
		<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
	</div>
	
	<div id="wrapper">
		<div class="container">
			<div id="pageTitle" class="container">나의 포인트 내역</div>
			<div id="topBox" class="inBox">
				<div class="mTitle">현재 내 포인트 : ${userPoint }P</div>
				<div class="grade">${sessionScope.nick }님은 <b>${sessionScope.grade }</b> 등급입니다.</div>
			</div>
			<table id="cashTable" class="table table-hover">
			<tr>
				<th>적립/차감</th>
				<th></th>
				<th>적립/차감 포인트</th>
				<th>총 포인트</th>
			</tr>
			
			<c:forEach var="point" items="${pointList}">
				<tr>
					<td>${point.point_y }</td>
					<td style="color: #bfbfbf;">${point.point_dt }</td>
					<c:choose>

						<c:when test = "${fn:contains(point.point, '-')}">
					        <td style="color: red;">${point.point }</td>
					    </c:when>
					    <c:otherwise>
					     	<td style="color: blue;">${point.point }</td>
					    </c:otherwise>
				    
				    </c:choose>
					<td style="font-weight: 500;">${point.user_point }</td>
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