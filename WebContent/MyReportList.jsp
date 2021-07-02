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
<title>MyReportList.jsp</title>
<link href="<%=cp%>/css/header.css" rel="stylesheet">
<!-- 탭 설정을 위한 jQuery UI 추가 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
	#content
	{
		margin: 0 auto;
		text-align: center;
		width: 1300px;
	}
	#textbox
	{
		font-size: 25px;
	}
</style>
<script type="text/javascript">

	// 신고당한 내역, 내가 신고한 글을
	// 사용자가 원하는 순서대로 끌어 정렬할 수 있는 기능
	$( function()
	{
	    var tabs = $( "#tabs" ).tabs();
	    tabs.find( ".ui-tabs-nav" ).sortable(
	    {
	       axis: "x",
	       stop: function()
	      {
	        tabs.tabs( "refresh" );
	      }
	    });
	});
	
</script>
</head>
<body>
<!-- 헤더 추가 -->
	<div>
		<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
	</div>
	
<div id="textbox">
	<h5>
		<img src="<%=cp%>/images/addReviewIcon.PNG" width="20px" height="20px">
		나의 활동/신고 관리 - 신고내역/현황
	</h5>
	<hr>
</div>
<br><br><br>
<div id="content">
	<div id="tabs">
			<ul>
				<li><a href="#tabs-1">내가 신고한 글</a></li>
				<li><a href="#tabs-2">신고 당한 내역</a></li>
			</ul>
			<div id="tabs-1">
				<p>
					<div class="container">
						<div class="row">
							<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
								<thead>
									<tr>
										<th style="background-color: #eeeeee; text-align: center;">번호</th>
										<th style="background-color: #eeeeee; text-align: center;">신고분류</th>
										<th style="background-color: #eeeeee; text-align: center;">제목</th>
										<th style="background-color: #eeeeee; text-align: center;">작성자</th>
										<th style="background-color: #eeeeee; text-align: center;">신고일자</th>
										<th style="background-color: #eeeeee; text-align: center;">처리현황</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<!-- c:foreach문으로 리스트 반복 뿌려주기 -->
										<td>10001</td>
										<td>욕설/비방</td>
										<!-- 게시글 제목을 눌렀을 때 해당 게시물로 이동할 수 있도록 링크 설정 -->
										<td><a href="">이런수박씨같은xx</a></td>
										<td>동대문 불주먹</td>
										<td>2021.06.09</td>
										<td>승인</td>
									</tr>
								</tbody>
							</table>
							<!--  페이징 추가 -->
						</div>
					</div>
				</p>
			</div>
			<div id="tabs-2">
				<p>
					<div class="container">
						<div class="row">
							<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
								<thead>
									<tr>
										<th style="background-color: #eeeeee; text-align: center;">번호</th>
										<th style="background-color: #eeeeee; text-align: center;">신고분류</th>
										<th style="background-color: #eeeeee; text-align: center;">신고대상</th>
										<th style="background-color: #eeeeee; text-align: center;">신고일자</th>
										<th style="background-color: #eeeeee; text-align: center;">소명신청 종료일</th>
										<th style="background-color: #eeeeee; text-align: center;">처리현황</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<!-- c:foreach문으로 리스트 반복 뿌려주기 -->
										<td>23433</td>
										<td>홍보</td>
										<!-- 해당 글 팝업창으로 조회할 수 있도록 처리 -->
										<td><a href="">완벽 그 자체</a></td>
										<td>2021.06.08</td>
										<td>2021.06.11</td>
										<td>승인</td>
									</tr>
								</tbody>
							</table>
							<!--  페이징 추가 -->
						</div>
					</div>
				</p>
			</div>
		</div>
</div>
 
</body>
</html>