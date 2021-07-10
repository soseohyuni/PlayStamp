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
<title>ManagerReportDone.jsp</title>
<link href="<%=cp%>/css/header.css" rel="stylesheet">
<!-- 모달 추가 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- 부트스트랩 탭 설정 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

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
		font-size: 50px;
		text-align: center;
	}
	th
	{
		background-color: #eeeeee;
		text-align: center;
	}
	.pull-right
	{
		margin: 0 auto;
		text-align: center;
	}
</style>
<script type="text/javascript">

	// 페이지 번호만 속성값으로 가지도록 <a> 태그가 작동하지 못하도록 처리
	//-- 실제 페이지를 클릭하면 동작하는 부분은 <form> 태그를 이용해 처리함
	$(document).ready(function()
	{
		var reportForm = $("#reportForm");
		
		$(".paginate_button a").on("click", function(e)
		{
			// <a> 태그 선택해도 페이지 이동 없도록 처리
			e.preventDefault();
			
			// <form> 태그 내 pageNum 속성 값은 href 속성값(클릭한 페이지 번호)으로 변경
			reportForm.find("input[name='pageNum']").val($(this).attr("href"));
			reportForm.submit();
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
	<hr>
	<h3>처리 완료 신고 리스트</h3>
</div>
<br><br><br>
<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th>번호</th>
					<th>신고내용</th>
					<th>작성자</th>
					<th>신고자</th>
					<th>신고 카테고리</th>
					<th>신고 일시</th>
					<th>게시판 분류</th>
					<th>처리 현황</th>
					<th>처리 일시</th>
				</tr>
			</thead>
			<tbody>
			<!--  BNO, REP_CONTENTS, REPORTER, REP_Y, REP_DT, 
			BOARDCATEGORY, REP_CD, REPORTED_CD, REP_ST, REP_CH_DT -->
			<c:forEach var="doneList" items="${doneList }">
			<tr>	
				<td>${doneList.bno }</td>
				<td>${doneList.rep_contents }</a></td>
				<td>${doneList.writer }</td>
				<td>${doneList.reporter }</td>
				<td>${doneList.rep_y }</td>
				<td>${doneList.rep_dt }</td>
				<td>${doneList.boardCategory }</td>
				<td>${doneList.rep_st }</td>
				<td>${doneList.rep_ch_dt }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		<!--  페이징 추가 -->
		<div class="pull-right">
			<ul class="pagination">
			<c:if test="${donePageMaker.prev }">
				<li class="paginate_button previous">
					<a href="${donePageMaker.startPage-1 }">Previous</a>
				</li>
			</c:if>
			
			<c:forEach var="num" begin="${donePageMaker.startPage }" end="${donePageMaker.endPage }">
				<li class="paginate_button">
					<a href="${num }">${num }</a>
				</li>
			</c:forEach>
			
			<c:if test="${donePageMaker.next }">
				<li class="paginate_button next">
					<a href="${donePageMaker.endPage+1 }">Next</a>
				</li>
			</c:if>
			</ul>
		</div><!-- close .pull-right -->
		<div>
			<button type="button" class="btn btn-info" onclick="location='managerreport.action'">확인 필요 신고 리스트</button>
		</div>
		<!-- 페이지 번호 클릭시 이동을 위한 hidden form 구성 -->
		<form id="reportForm" action="donemanagerreport.action" method="get">
			<input type="hidden" name="pageNum" value="${donePageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${donePageMaker.cri.amount }">
		</form>
	</div>
</div>

</body>
</html>