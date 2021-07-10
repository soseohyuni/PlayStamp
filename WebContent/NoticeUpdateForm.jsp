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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<h2>공지사항 관리</h2>
	<hr>
	<h3>공지사항 수정</h3>
	<hr>
	<form action="noticeupdate.action" method="post" id="noticeUpdateForm">
		<div class="col-xs-4">
		  <input type="email" class="form-control" id="exampleFormControlInput1" value="${notice.title}">
		</div>
		<br><br>
		<hr>
		<div class="col-xs-12">
		  <textarea class="form-control" id="exampleFormControlTextarea1" rows="10">${notice.contents }</textarea>
		</div>
		<div>
			<button type="button" class="btn btn-default">수정</button><button type="button" class="btn btn-default">취소</button>
		</div>
	</form>
</div>
</body>
</html>