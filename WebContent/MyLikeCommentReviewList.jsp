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
<title>MyLikeCommentReviewList.jsp</title>
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

	// 좋아요 누른 리뷰, 댓글 단 리뷰 탭을
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
		나의 활동/신고 관리 - 좋아요/댓글 단 리뷰
	</h5>
	<hr>
</div>
<br><br><br>
<div id="content">
	<div id="tabs">
			<ul>
				<li><a href="#tabs-1">좋아요</a></li>
				<li><a href="#tabs-2">댓글</a></li>
			</ul>
			<div id="tabs-1">
				<p>
					<div class="container">
						<div class="row">
							<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
								<thead>
									<tr>
										<th style="background-color: #eeeeee; text-align: center;">번호</th>
										<th style="background-color: #eeeeee; text-align: center;">공연명</th>
										<th style="background-color: #eeeeee; text-align: center;">제목</th>
										<th style="background-color: #eeeeee; text-align: center;">작성자</th>
										<th style="background-color: #eeeeee; text-align: center;">작성일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<!-- c:foreach문으로 리스트 반복 뿌려주기 -->
										<td>10001(시퀀스 뒷부분만?)</td>
										<td>시카고</td>
										<!-- 게시글 제목을 눌렀을 때 해당 게시물로 이동할 수 있도록 링크 설정(<a>태그 이용)
										     페이지: view.jsp / 매개변수: bbsID (게시물 번호) -->
										<td><a href="">코로나도 잊게 한 공연!!</a></td>
										<td>이웃집 고양이</td>
										<td>2021.06.09</td>
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
										<th style="background-color: #eeeeee; text-align: center;">공연명</th>
										<th style="background-color: #eeeeee; text-align: center;">제목</th>
										<th style="background-color: #eeeeee; text-align: center;">작성자</th>
										<th style="background-color: #eeeeee; text-align: center;">작성일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<!-- c:foreach문으로 리스트 반복 뿌려주기 -->
										<td>23433</td>
										<td>피노키오</td>
										<!-- 게시글 제목을 눌렀을 때 해당 게시물로 이동할 수 있도록 링크 설정
										     요청 액션 / 매개변수: 게시물 번호 -->
										<td><a href="">진짜 너무너무 재밌었던..!</a></td>
										<td>아뇨뚱인데요</td>
										<td>2021.06.30</td>
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