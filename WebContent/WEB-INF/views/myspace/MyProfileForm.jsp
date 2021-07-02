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
<title>나의 프로필</title>
<link href="<%=cp%>/css/myspace.css" rel="stylesheet">
</head>
<body>
<!-- 메뉴 영역 -->
	<div>
		<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
	</div>
	
	<div id="wrapper">
		<div class="container">
			<div id="pageTitle" class="container">나의 프로필</div>
			<div id="pForm" >
				<div id="profileImg">
					<div id="userImg"><img class="profile" alt="" src="images/profile.png"></div>
					<div>우수회원</div>
					<div>현재 포인트</div>
					<div>320p</div>
				</div>
				
				<div id="profileInput">
					<table>
					<tr>
						<th>닉네임 *</th>
						<td><input value="뮤뮤덕"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input></td>
					</tr>
					<tr>
						<td><button>수정하기</button><td>
					</tr>
					</table>
					</div>
				</div>
			
			<hr>
			<a href="dropform.action">탈퇴하기</a>
			
			</div>
	</div>
	
</body>
</html>