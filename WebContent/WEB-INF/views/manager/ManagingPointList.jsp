<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ManagerPointList.jsp</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="<%=cp%>/css/myspace.css" rel="stylesheet">
<script type="text/javascript">

	$(function()
	{
		if($("#cashTable").find("td:eq(1)").text()=="")
		{
			$("#nopoint").text("포인트 내역이 존재하지 않습니다.");
		}
	});

</script>
<style type="text/css">
	
	#nopoint
	{
		text-align: center;
		font-size: 15pt;
	}
	
</style>

</head>
<body>

<!-- 헤더 추가 -->
<c:import url="/WEB-INF/views/manager/ManagerHeader.jsp"></c:import>

<div id="wrapper">
	<div class="container"  style="width: 72% !important; height: 700px; top:50px;">
	<h2> 회원 관리 </h2>
	<hr>
		<div id="topBox" class="inBox">
			<div class="mTitle" style="text-align:right; ">
				현재 ${user_id }님의 포인트 : ${userPoint }P&emsp;(<b> ${grade }</b> 등급)
			</div>
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
		<br><br><div id="nopoint"></div>
	</div>
</div>

</body>
</html>