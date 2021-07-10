<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ManagerReportList.jsp</title>
<link href="<%=cp%>/css/header.css" rel="stylesheet">
<!-- 모달 추가 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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
	
	// 페이지 번호만 속성값으로 가지도록 <a> 태그가 작동하지 못하도록 처리
	//-- 실제 페이지를 클릭하면 동작하는 부분은 <form> 태그를 이용해 처리함
	$(document).ready(function()
	{
		var reportForm1 = $("#reportForm1");
		
		$(".paginate_button a").on("click", function(e)
		{
			// <a> 태그 선택해도 페이지 이동 없도록 처리
			e.preventDefault();
			
			// <form> 태그 내 pageNum 속성 값은 href 속성값(클릭한 페이지 번호)으로 변경
			reportForm1.find("input[name='pageNum']").val($(this).attr("href"));
			reportForm1.submit();
		});
	});
	
	
	$(function()
	{
		// 탭 눌렀을 때 다른 주소 요청
		$("#tabs-2").on("click", function()
		{
			window.location.href="/donemanagerreport.action?pageNum=1&amount=10";
		})
	});
	
	$(document).ready(function()
	{
		var reportForm2 = $("#reportForm2");
		
		$(".paginate_button a").on("click", function(e)
		{
			// <a> 태그 선택해도 페이지 이동 없도록 처리
			e.preventDefault();
			
			// <form> 태그 내 pageNum 속성 값은 href 속성값(클릭한 페이지 번호)으로 변경
			reportForm1.find("input[name='pageNum']").val($(this).attr("href"));
			reportForm1.submit();
		});
	});
	
	// 모달 팝업 불러오기
	/*
	$(".click_pop").click(function(e)
	{ 
		e.preventDefault();
		var target = $(this).attr("href"); 
		$("#clientEditorModal .modal-content").load(target, function()
		{ 
			$("#clientEditorModal").modal("show"); 
		});
	});
	*/
	
	// 모달 팝업 불러오기 테스트
	$(function(){
    $("#click_pop").click(function(){
        $('div.modal').modal({remote : 'modal.html'});
    })
})

</script>
</head>
<body>
<!-- 헤더 추가 -->
<div>
	<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
</div>

<div id="textbox">
	<hr>
	<h3>신고 관리</h3>
</div>
<br><br><br>
<div id="content">
	<div id="tabs">
			<ul>
				<li><a href="#tabs-1">확인 필요</a></li>
				<li><a href="#tabs-2">처리 완료</a></li>
			</ul>
			<div id="tabs-1">
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
								</tr>
							</thead>
							<tbody>
							<!-- c:foreach문으로 리스트 반복 뿌려주기 -->
							<c:forEach var="checkList" items="${checkList }">
							<tr>
								<td>${checkList.bno }</td>
					<%-- 		<a href="<c:if test="${checkList.boardCategory == '댓글' }">댓글 select 요청</c:if>
								<c:if test="${checkList.boardCategory == '공연 리뷰' }">공연select요청</c:if>
								<c:if test="${checkList.boardCategory == '좌석 리뷰' }">좌석select요청</c:if>
								<c:if test="${checkList.boardCategory == '5대 좌석 리뷰' }">5대 좌석select요청</c:if>"
								data-toggle="modal">${checkList.rep_cd }, ${checkList.rep_contents }</a></td>
								<a data-toggle="modal" href="#myModal">${checkList.rep_contents }</a> --%>
								<td>
								<a href="modal.html?rep_cd=${checkList.rep_cd }" id="click_pop">${checkList.rep_contents }</a>
								</td>
								<td>글작성자</td>
								<td>${checkList.reporter }</td>
								<td>${checkList.rep_y }</td>
								<td>${checkList.rep_dt }</td>
								<td>${checkList.boardCategory }</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						
						<div class="modal fade">
						  <div class="modal-dialog">
						    <div class="modal-content">
						        <!-- remote ajax call이 되는영역 -->
						    </div>
						  </div>
						</div>
						
						
						<!-- 모달 -->
						<div class="modal fade" id="clientEditorModal" tabindex="-1" role="dialog" 
						aria-labelledby="clientEditorModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
								</div>
							</div>
						</div>

						<!--  페이징 추가 -->
						<div class="pull-right">
							<ul class="pagination">
							<c:if test="${checkPageMaker.prev }">
								<li class="paginate_button previous"><a href="${checkPageMaker.startPage-1 }">Previous</a>
								</li>
							</c:if>
							
							<c:forEach var="num" begin="${checkPageMaker.startPage }" end="${checkPageMaker.endPage }">
								<li class="paginate_button"><a href="${num }">${num }</a></li>
							</c:forEach>
							
							<c:if test="${checkPageMaker.next }">
								<li class="paginate_button next"><a href="${checkPageMaker.endPage+1 }">Next</a></li>
							</c:if>
							</ul>
						</div><!-- close .pull-right -->
						<!-- 페이지 번호 클릭시 이동을 위한 hidden form 구성 -->
						<form id="reportForm1" action="managerreport.action" method="get">
							<input type="hidden" name="pageNum" value="${checkPageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value="${checkPageMaker.cri.amount }">
						</form>
						
				    </div><!-- row -->
				</div><!-- container -->
			</div><!-- tabs-1 -->
			<div id="tabs-2">
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
								<td><a href="" data-toggle="modal">${doneList.rep_contents }</a></td>
								<td>글 작성자</td>
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
								<li class="paginate_button previous"><a href="${donePageMaker.startPage-1 }">Previous</a>
								</li>
							</c:if>
							
							<c:forEach var="num" begin="${donePageMaker.startPage }" end="${donePageMaker.endPage }">
								<li class="paginate_button2"><a href="${num }">${num }</a></li>
							</c:forEach>
							
							<c:if test="${donePageMaker.next }">
								<li class="paginate_button next"><a href="${donePageMaker.endPage+1 }">Next</a></li>
							</c:if>
							</ul>
						</div><!-- close .pull-right -->
						<!-- 페이지 번호 클릭시 이동을 위한 hidden form 구성 -->
						<form id="reportForm2" action="donemanagerreport.action" method="get">
							<input type="hidden" name="pageNum" value="${donePageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value="${donePageMaker.cri.amount }">
						</form>
					</div>
				</div>
			</div>
		</div>
</div>
 
</body>
</html>