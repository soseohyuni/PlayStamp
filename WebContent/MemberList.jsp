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
<title>MemberList.jsp</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">

<style type="text/css">

	.table-striped
	{
		margin-left: 15px;
	}
	
	#reportListIntro
	{
		margin-bottom: 5px;
		font-size: 12pt;
		font-weight: bold;
	}

</style>

</head>
<body>

<!-- 헤더 추가 -->
<c:import url="AdminHeader.jsp"></c:import>

<div class="container" style="width: 74%; height: 700px; top:50px;">
	<h2> 회원 관리 </h2>
	<hr>
		<div class="container">
			<div id="reportListIntro"><img style="width: 20px; margin-right: 5px;" src="images/boardicon.png">회원 목록 조회</div>
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeeee; text-align: center;">닉네임(아이디)</th>
							<th style="background-color: #eeeeee; text-align: center;">이메일</th>
							<th style="background-color: #eeeeee; text-align: center;">가입일</th>
							<th style="background-color: #eeeeee; text-align: center;">등급</th>
							<th style="background-color: #eeeeee; text-align: center;">잔여 포인트</th>
						</tr>
					</thead>
					<tbody>
						<!-- c:foreach문으로 리스트 반복 뿌려주기 -->
						<tr>
							<td>10001</td>
							<td><a href="">뮤뮤덕(mumuduck)</a></td>
							<td>mumuduck@test.com</td>
							<td>2021.05.01</td>
							<td>우수회원</td>
							<td>200점&emsp;<input type="submit" value="수정"></td>
						</tr>
						<tr>
							<td>10001</td>
							<td><a href="">뮤뮤덕(mumuduck)</a></td>
							<td>mumuduck@test.com</td>
							<td>2021.05.01</td>
							<td>우수회원</td>
							<td>200점&emsp;<input type="submit" value="수정"></td>
						</tr>
						<tr>
							<td>10001</td>
							<td><a href="">뮤뮤덕(mumuduck)</a></td>
							<td>mumuduck@test.com</td>
							<td>2021.05.01</td>
							<td>우수회원</td>
							<td>200점&emsp;<input type="submit" value="수정"></td>
						</tr>
						<tr>
							<td>10001</td>
							<td><a href="">뮤뮤덕(mumuduck)</a></td>
							<td>mumuduck@test.com</td>
							<td>2021.05.01</td>
							<td>우수회원</td>
							<td>200점&emsp;<input type="submit" value="수정"></td>
						</tr>
						<tr>
							<td>10001</td>
							<td><a href="">뮤뮤덕(mumuduck)</a></td>
							<td>mumuduck@test.com</td>
							<td>2021.05.01</td>
							<td>우수회원</td>
							<td>200점&emsp;<input type="submit" value="수정"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>