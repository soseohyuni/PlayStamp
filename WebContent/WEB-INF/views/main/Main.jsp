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
<title>HOME</title>
<link href="<%=cp%>/css/myspace.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>

<!-- 메뉴 영역 -->
	<div>
		<c:import url="header.jsp"></c:import>
	</div>
	
	
	<div id="wrapper">
	
		<div class="container">
		
		<div class="jumbotron" style="margin: 0 0 40px 0 !important;">
		  <h1>Hello, world!</h1>
		  <p>...</p>
		  <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
		</div>
		
			<div id="pageTitle" class="container">리뷰 리뷰</div>
			<div class="row">
				<div class="col-lg-3 col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
					<img src="<%=cp%>/images/wicked.jpg" alt="...">
				    </a>
				</div>
				<div class="col-lg-3 col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
					<img src="<%=cp%>/images/dog.jpg" alt="...">
				    </a>
				</div>
				<div class="col-lg-3 col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
					<img src="<%=cp%>/images/redbook.jpg" alt="...">
				    </a>
				</div>
				<div class="col-lg-3 col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
					<img src="<%=cp%>/images/wicked.jpg" alt="...">
				    </a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>