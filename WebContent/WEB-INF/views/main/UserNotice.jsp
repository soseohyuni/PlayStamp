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
<title>고객센터</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
 integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<style type="text/css">

.panel-heading { padding: 0;}
.panel-heading a { padding: 10px 15px; display:block; text-decoration: none;}
</style>
</head>
<body>
	<div>
		<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
	</div>
	
<br><br>	
	
<div class="container">
	<h2>공지사항</h2>
	<hr>
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
	<c:set var="i" value="0"></c:set>
	<c:forEach var="list" items="${list }">
	
	  <div class="panel panel-default">
	    <div class="panel-heading" role="tab" id="heading${i }">
	      <h4 class="panel-title">
		<a data-toggle="collapse" href="#collapse${i }" aria-expanded="true" aria-controls="collapse${i }">
		  <span style="color: #0080FF"><i class="far fa-bell"></i></span>&nbsp; ${list.title}
		</a>
	      </h4>
	    </div>
	    <div id="collapse${i }" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading${i }">
	      <div class="panel-body">
	      ${list.contents }
	      </div>
	    </div>
	  </div>
	t <c:set var="i" value="${i+1}"></c:set>
	</c:forEach>	  
	</div>
	<br><br><br>
	<h2>FAQ</h2>
	<hr>
	<br><br><br>
	<div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
	<c:set var="j" value="10"></c:set>
	<c:forEach var="flist" items="${flist }">
	
	  <div class="panel panel-default">
	    <div class="panel-heading" role="tab" id="heading${j }">
	      <h4 class="panel-title">
		<a data-toggle="collapse" href="#collapse${j }" aria-expanded="true" aria-controls="collapse${j }">
		  <span style="color: #FE2E2E;"><j class="fab fa-quora"></j></span>&nbsp; ${flist.title}
		</a>
	      </h4>
	    </div>
	    <div id="collapse${j }" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading${j }">
	      <div class="panel-body">
	      ${flist.contents }
	      <br>
	      </div>
	    </div>
	  </div>
	  <c:set var="j" value="${j+1}"></c:set>
	  </c:forEach>	  
	</div>
</div><!-- container -->

</body>
</html>