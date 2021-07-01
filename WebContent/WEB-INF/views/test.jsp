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
<title>test.jsp</title>
</head>
<body>
<div>
	<table class="table">
		<c:forEach var="play" items="${list }">
			<tr>
				<td>${play.play_cd }</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>