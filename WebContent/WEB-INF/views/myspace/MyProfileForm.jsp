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
			
				<!-- left -->
				<div id="profileImg profileImg-b">
					<div class="userInfo" id="userImg"><img class="profileImg"  alt="" src="images/profile.png"></div>
					<div class="userInfo">우수회원</div>
					<div class="userInfo sTitle">현재 포인트</div>
					<div class="userInfo aTitle">320p</div>
				</div>
				
				<!-- right -->
				<div id="profileInput">
				
					<form class="form-horizontal">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-4 control-label">닉네임</label>
						    <div class="col-sm-10">
						      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-4 control-label">아이디</label>
						    <div class="col-sm-10">
						      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-4 control-label">이름</label>
						    <div class="col-sm-10">
						      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-4 control-label">이메일</label>
						    <div class="col-sm-10">
						      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-4 control-label">전화번호</label>
						    <div class="col-sm-10">
						      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-4 control-label">비밀번호</label>
						    <div class="col-sm-10">
						      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
						    </div>
						    <div class="form-group">
							    <label for="inputPassword3" class="col-sm-4 control-label">비밀번호 확인</label>
							    <div class="col-sm-10">
							      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
							    </div>
						  	</div>
						  </div>
						  
						  
						  <div class="form-group">
						    <div class="col-sm-offset-2 col-sm-10">
						      <button type="button" class="btn btn-primary btn-lg btn-block"
							style="margin-top: 50px;">정보 수정하기</button>
						    </div>
						  </div>
						</form>
				
				</div>
				
			</div>
			<hr>
				<a href="dropform.action">탈퇴하기</a>
		</div>
	</div>
	
</body>
</html>