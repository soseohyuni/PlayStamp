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
<title>Insert title here</title>
</head>
<body>
<h1>아이디 : ${user.userId }</h1>
<h1>닉네임 : ${user.userNick }</h1>
<h1>비밀번호 : ${user.userPw }</h1>
<h1>이름 : ${user.userNm }</h1>
<h1>전화번호 : ${user.userTel }</h1>
<h1>이메일 : ${user.userMail }</h1>

</body>
</html>