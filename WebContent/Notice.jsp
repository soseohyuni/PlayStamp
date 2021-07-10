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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
 integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<script type="text/javascript">
	//$('.collapse').collapse()
</script>
<style type="text/css">

.panel-heading { padding: 0;}
.panel-heading a { padding: 10px 15px; display:block; text-decoration: none;}
.btn { float: right;}

</style>
</head>
<body>
<div class="container">
	<h2>공지사항 관리</h2>
	<hr>
	<button type="button" class="btn btn-default">&nbsp;공지사항 작성하기</button>
	<br><br><br>
	<div class="panel-group" role="tablist" aria-multiselectable="true">
	<c:forEach var="list" items="${list }">
	  <div class="panel panel-default">
	    <div class="panel-heading" role="tab">
	      <h4 class="panel-title">
		<a data-toggle="collapse" data-parent="accordion" aria-expanded="false" aria-controls="collapseOne">
		  <i class="far fa-bell"></i>&nbsp; ${list.title}<button type="button" class="btn btn-default">수정</button><button type="button" class="btn btn-default">삭제</button>
		</a>
	      </h4>
	    </div>
	    <div class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
	      <div class="panel-body">
	      ${list.contents }
	      </div>
	    </div>
	  </div>
	  </c:forEach>
	</div>
</div>
</body>
</html>