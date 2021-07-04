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
<link href="<%=cp%>/css/myspace.css" rel="stylesheet">
</head>
<body>

	<!-- 메뉴 영역 -->
	<div>
		<c:import url="header.jsp"></c:import>
	</div>
	
	<div id="wrapper">
		<div class="container">
			<div class="dropText">
				<h4>
					<mark><b>회원가입이 완료됐습니다!</b><br>
					로그인 후 플레이 스탬프의 다양한 서비스를 경험해보세요!:></mark>
				</h4>
			<a href="signinform.action">
				<button>로그인하기</button>
			</a>
			</div>
		</div>
	</div>
	
</body>
</html>