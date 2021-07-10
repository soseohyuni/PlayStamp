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
<title>ManagerReportCheck.jsp</title>
<link href="<%=cp%>/css/header.css" rel="stylesheet">
<!-- 모달 추가 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	<h3>확인 필요 신고 리스트</h3>
</div>
<br><br><br>

<div class="container">
	<div class="row">
		<table class="table table-hover" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th>번호</th>
					<th>신고내용</th>
					<th>테스트..신고번호</th>
					<th>작성자</th>
					<th>신고자</th>
					<th>신고 카테고리</th>
					<th>신고 일시</th>
					<th>게시판 분류</th>
				</tr>
			</thead>
			<tbody>
			<!-- c:foreach문으로 리스트 반복 뿌려주기 -->
			<c:forEach var="checkList" items="${checkList }">
			<tr>
				<td>${checkList.bno }</td>
				<td>
				<c:if test="${checkList.boardCategory eq '댓글' }">
					<a href="commentreport.action?rep_cd=${checkList.rep_cd }" data-toggle="modal" data-target="#modal" data-backdrop="static">${checkList.rep_contents }</a>
				</c:if>
				<c:if test="${checkList.boardCategory eq '공연 리뷰' }">
					<a href="reviewreport.action?rep_cd=${checkList.rep_cd }" data-toggle="modal" data-target="#modal" data-backdrop="static">${checkList.rep_contents }</a>
				</c:if>
				<c:if test="${checkList.boardCategory eq '좌석 리뷰' }">
					<a href="seatreport.action?rep_cd=${checkList.rep_cd }" data-toggle="modal" data-target="#modal" data-backdrop="static">${checkList.rep_contents }</a>
				</c:if>
				<c:if test="${checkList.boardCategory eq  '5대 좌석 리뷰' }">
					<a href="mseatreport.action?rep_cd=${checkList.rep_cd }" data-toggle="modal" data-target="#modal" data-backdrop="static">${checkList.rep_contents }</a>
				</c:if>
				</td>
				
				<!--  
				<a href="<c:if test="${checkList.boardCategory == '댓글' }">commentreport.action?rep_cd=${checkList.rep_cd }</c:if>
				<c:if test="${checkList.boardCategory == '공연 리뷰' }">reviewreport.action?reported_cd=${checkList.reported_cd }</c:if>"
				dat a-toggle="modal" data-target="#modal" data-backdrop="static">${checkList.rep_contents }</a>
				-->
				<td>${checkList.rep_cd }</td>
				<td>${checkList.writer }</td>
				<td>${checkList.reporter }</td>
				<td>${checkList.rep_y }</td>
				<td>${checkList.rep_dt }</td>
				<td>${checkList.boardCategory }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>

		<!--  페이징 추가 -->
		<div class="pull-right">
			<ul class="pagination">
			<c:if test="${checkPageMaker.prev }">
				<li class="paginate_button previous"><a href="${checkPageMaker.startPage-1 }">Previous</a></li>
			</c:if>
			
			<c:forEach var="num" begin="${checkPageMaker.startPage }" end="${checkPageMaker.endPage }">
				<li class="paginate_button"><a href="${num }">${num }</a></li>
			</c:forEach>
			
			<c:if test="${checkPageMaker.next }">
				<li class="paginate_button next"><a href="${checkPageMaker.endPage+1 }">Next</a></li>
			</c:if>
			</ul>
		</div><!-- close .pull-right -->
		<div>
			<button type="button" class="btn btn-info" onclick="location='donemanagerreport.action'">처리 완료 신고 리스트</button>
		</div>
		<!-- 페이지 번호 클릭시 이동을 위한 hidden form 구성 -->
		<form id="reportForm" action="managerreport.action" method="get">
			<input type="hidden" name="pageNum" value="${checkPageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${checkPageMaker.cri.amount }">
		</form>
    </div><!-- row -->
</div><!-- container -->


<!-- 모달 content까지만 선언 -->

<div id="modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        </div>
    </div>
</div>


<br><br><br><br>
</body>
</html>