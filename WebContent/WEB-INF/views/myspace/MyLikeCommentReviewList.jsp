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
		var likeForm = $("#likeForm");
		
		$(".paginate_button a").on("click", function(e)
		{
			// <a> 태그 선택해도 페이지 이동 없도록 처리
			e.preventDefault();
			
			// <form> 태그 내 pageNum 속성 값은 href 속성값(클릭한 페이지 번호)으로 변경
			likeForm.find("input[name='pageNum']").val($(this).attr("href"));
			likeForm.submit();
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
				<div class="container">
					<div class="row">
						<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th>번호</th>
									<th>공연명</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
							<!-- c:foreach문으로 리스트 반복 뿌려주기 -->
							<c:forEach var="review" items="${likeList }">
							<tr>	
								<td>${review.bno }</td>
								<td>${review.play_nm }</td>
								<!-- 게시글 제목을 눌렀을 때 해당 게시물로 이동할 수 있도록 링크 설정(<a>태그 이용)
								     페이지: view.jsp / 매개변수: bbsID (게시물 번호) -->
								<td><a href="">${review.title }</a></td>
								<td>${review.user_nick }</td>
								<td>${review.playrev_dt }</td>
								<td>${review.view_cnt }</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						<!--  페이징 추가 -->
						<div class="pull-right">
							<ul class="pagination">
							<c:if test="${likePageMaker.prev }">
								<li class="paginate_button previous"><a href="${likePageMaker.startPage-1 }">Previous</a>
								</li>
							</c:if>
							
							<c:forEach var="num" begin="${likePageMaker.startPage }" end="${likePageMaker.endPage }">
								<li class="paginate_button"><a href="${num }">${num }</a></li>
							</c:forEach>
							
							<c:if test="${likePageMaker.next }">
								<li class="paginate_button next"><a href="${likePageMaker.endPage+1 }">Next</a></li>
							</c:if>
							</ul>
						</div><!-- close .pull-right -->
						<!-- 페이지 번호 클릭시 이동을 위한 hidden form 구성 -->
						<form id="likeForm" action="mylikecommentreviewlist.action" method="get">
							<input type="hidden" name="pageNum" value="${likePageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value="${likePageMaker.cri.amount }">
						</form>
					</div>
				</div><!-- container -->
			</div><!-- tabs-1 -->
			<div id="tabs-2">
				<div class="container">
					<div class="row">
						<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th>번호</th>
									<th>공연명</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="reviewComm" items="${commentList }">
							<tr>	
								<td>${reviewComm.bno }</td>
								<td>${reviewComm.play_nm }</td>
								<td><a href="">${reviewComm.title }</a></td>
								<td>${reviewComm.user_nick }</td>
								<td>${reviewComm.playrev_dt }</td>
								<td>${reviewComm.view_cnt }</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						<!--  페이징 추가 -->
						<div class="pull-right">
							<ul class="pagination">
							<c:if test="${commentPageMaker.prev }">
								<li class="paginate_button previous"><a href="${commentPageMaker.startPage-1 }">Previous</a>
								</li>
							</c:if>
							
							<c:forEach var="num" begin="${commentPageMaker.startPage }" end="${commentPageMaker.endPage }">
								<li class="paginate_button"><a href="${num }">${num }</a></li>
							</c:forEach>
							
							<c:if test="${commentPageMaker.next }">
								<li class="paginate_button next"><a href="${commentPageMaker.endPage+1 }">Next</a></li>
							</c:if>
							</ul>
						</div><!-- close .pull-right -->
						<!-- 페이지 번호 클릭시 이동을 위한 hidden form 구성 -->
						<form id="likeForm" action="mylikecommentreviewlist.action" method="get">
							<input type="hidden" name="pageNum" value="${commentPageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value="${commentPageMaker.cri.amount }">
						</form>
					</div>
				</div>
			</div>
		</div>
</div>
 
</body>
</html>