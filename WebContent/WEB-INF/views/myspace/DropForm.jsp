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
<title>탈퇴 안내</title>
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
			<div id="pageTitle" class="container">탈퇴 안내</div>
			
			<div>
				탈퇴 후에도 리뷰, 양도 게시판, 문의글 및 댓글은 자동 삭제되지 않고 그대로 남아 있습니다.
				삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.
				탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
				
				탈퇴 후에는 muuuuu12 아이디로 재가입이 불가능하며 아이디와 데이터는 복구할 수 없습니다.
				게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
			</div>
			<br>
			
			<div><input type="checkbox"> 안내 사항을 모두 확인하였으며, 이에 동의합니다.</div>
		
			<div class="form-group">
				<label for="txtId">탈퇴 사유</label>
				<input type="text" id="txtId" class="form-control" placeholder="탈퇴 사유를 입력하세요" required="required">
			</div>
			<div class="form-group">
				<label for="txtId">비밀번호 확인</label>
				<input type="text" id="txtId" class="form-control" placeholder="비밀 번호를 입력하세요" required="required">
			</div>	
			
			<button>탈퇴하기</button>
		</div>
	
	</div>
	
	
	
	
	
	
</body>
</html>