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
<title>UserNoticeList.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
 integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<script type="text/javascript">
	$(function()
	{
		$(".delBtn").click(function()
		{
			if (confirm("정말 삭제하시겠습니까?"))
			{
				$(location).attr("href", "noticedelete.action?notice_cd=" + $(this).val());
			}
		});
		
		$(".upBtn").click(function()
		{
			$(location).attr("href", "noticeupdateform.action?notice_cd=" + $(this).val());
		});	
	});
	
</script>
<style type="text/css">

.panel-heading { padding: 0;}
.panel-heading a { padding: 10px 15px; display:block; text-decoration: none;}
.btn { float: right;}
</style>
</head>
<body>
<div class="container">
	<h2>고객센터</h2>
	<hr>
</div>
</body>
</html>