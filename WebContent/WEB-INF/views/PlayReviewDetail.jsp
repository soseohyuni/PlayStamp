<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PlayReviewDetail.jsp</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- 별점 기능을 위한 아이콘을 CDN 방식으로 추가 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- 별점 이미지 파일을 다운받은 뒤 css폴더에 추가해 경로 지정 -->
<link rel="stylesheet" href="<%=cp %>/css/fontawesome-stars.css">
<!-- 별점 콜백 함수 호출을 위해 js 폴더에 추가해 경로 지정 -->
<script src="<%=cp %>/js/jquery.barrating.min.js"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
 integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<style type="text/css">	
	#img { text-align:center;}
	
	#playTable td {	width:100px; height:20px;
					text-align: center; }
		
	#tab { width: 60%; margin: auto; }
	
	.tab-content { border: 0.3px solid gray; }
	
	.subContainer { text-align: center; }
	#pageTitle { float: left; font-size: 20px;}	
	#dtTitle { float: right;}	
	#reviewTitle { display:inline-block;zoom:1;.display:inline; font-size: 25px;}	
	
	.container { width: 1300px; }
	
	#header { margin: auto; }
	
	#table { margin: auto; width: 80%; }	
	
	#playReview { text-align: left; }
	div#playReview > table > tbody > tr > td:nth-child(1) { width: 10px; }
	div#playReview > table > tbody > tr > td:nth-child(2) { height: 10px; }
	
	#report { float: right;}
	
	#reviewEnter{ font-weight: bold;}
</style>
<script type="text/javascript">	
	
	var playRev = "";
	var articleNo = "PR00001";
	
	<c:forEach var="playReviewDetail" items="${playReviewDetail }">
		playRev = "${playReviewDetail.rating_cd}"
	</c:forEach> 
	
	$(function()
	{
		//@@ 공연상세 별점
		$("#playRev").barrating({
			theme: "fontawesome-stars"
	        , initialRating: playRev
	        , readonly: true
	    });
	});
	
	//@@ 댓글 기능 처리
	$(function()
	{
		//@@ 댓글 목록 출력
		getComments();
		
		//@@ 댓글 달기 버튼을 눌렀을 때
		$("#commentAddBtn").on("click", function()
		{
			var replyText = $("#newReplyText");
		    var replyWriter = $("#newReplyWriter");
		    var hiddenUser = $("#hiddenUser");
		    
		    var replyTextVal = replyText.val();
		    var replyWriterVal = replyWriter.val();
		    var hiddenUserVal = hiddenUser.val();
		    
		 	// AJAX 통신 : POST
		    $.ajax({
		        type : "post",
		        url : "commentadd.action",
		        contentType: "application/json",
		        dataType : "text",
		        data : JSON.stringify({
		            "playrev_cd" : articleNo,
		            "comments" : replyTextVal,
		            "user_nick" : replyWriterVal,
		            "user_cd" : hiddenUserVal
		        }),
		        success : function (result) {
		        	
		        	if (result=="success")
					{
		        		getComments(); // 댓글 목록 출력 함수 호출
			            replyText.val(""); // 댓글 내용 초기화
			            replyWriter.val(""); // 댓글 작성자 초기화
					}
		        }
		    });
		});
		
		//@@ 댓글 삭제 버튼을 눌렀을 때 
		$("#comments").on("click", ".replyLi button", function()
		{
			var reply = $(this).parent();
			
			var replyNo = reply.attr("data-replyNo");
		    
		 	// AJAX 통신 : POST
		    $.ajax({
		        type : "post",
		        url : "commentremove.action",
		        contentType: "application/json",
		        dataType : "text",
		        data : JSON.stringify({
		            "comment_cd" : replyNo
		        }),
		        success : function (result) {
		        	
		        	if (result=="success")
					{
		        		getComments(); // 댓글 목록 출력 함수 호출
					}
		        }
		    });
		});
	});
	
	//@@ 댓글 목록 출력 함수
	function getComments()
	{
		$.getJSON("comment.action?playrev_cd=" + articleNo, function (data) {
			   
			console.log(data); 
			
			var str = "";
			
			$.each(data, function(i, item){
				//console.log(item.comment_cd);
				
				str += "<li data-replyNo='" + item.comment_cd + "' class='replyLi'>"
				+   "<p class='commentWriter'>" + item.user_nick + "</p>"
				+   "<p class='comment'>" + item.comments + "</p>"
                + "<button type='button' class='btn btn-xs btn-success'>댓글 삭제</button>"
				+ "</li>"
                + "<hr/>";

		        });
			 
			 $("#comments").html(str);
		});
	}

</script>
</head>

<body>
<div class="container">
<!-- 상단바 -->
	<div id="header">
		<c:import url="/WEB-INF/views/header.jsp"></c:import>
	</div>
<!-- 내용 출력 시작 -->	
	<div id="wrapper">
		<div>
		
		<!-- 상단 -->
		<div class="subContainer">
			<span id="pageTitle">리뷰 정보</span>
			<c:forEach var="playReviewDetail" items="${playReviewDetail }">
			<span id="reviewTitle">${playReviewDetail.title }</span>
			<hr>
			<span id="dtTitle">작성일자: ${playReviewDetail.playrev_dt }</span>
			</c:forEach>
		</div>
		<br><br>
			
			
		<!-- 리뷰 상세 출력 -->
		<div id="table">
			<table class="table table-borderless" id="playTable">
			<c:forEach var="playReviewDetail" items="${playReviewDetail }">
				<tr>
					<td rowspan="5">
					<div id="img"><img src="${playReviewDetail.play_img }" style="height: 240px;"></div>
					</td>
					<td>공연명</td>
					<td><input type="text" disabled="disabled" value="${playReviewDetail.play_nm }" ></td>
				</tr>
				<tr>
					<td>공연날짜</td>
					<td>
					<input type="text" disabled="disabled" value="${playReviewDetail.play_dt }" style="width: 100px;">
					</td>
				</tr>
				<tr>
					<td>공연시간</td>
					<td><input type="text" disabled="disabled" value="${playReviewDetail.play_time }"></td>
				</tr>
				<tr>
					<td>공연장소</td>
					<td><input type="text" disabled="disabled" value="${playReviewDetail.theater }"></td>
				</tr>
				<tr>
					<td>출연진</td>
					<td><input type="text" disabled="disabled" value="${playReviewDetail.play_cast }"
					style="width: 450px;"></td>
				</tr>
				<tr>
					<td>
						<select id="playRev">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</td>
					<td>함께 본 사람</td>
					<td><input type="text" disabled="disabled" value="${playReviewDetail.companion }"></td>
				</tr>
				<tr>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td id="reviewEnter">공연 상세 리뷰</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="3"><textarea rows="5%" cols="100%" disabled="disabled">${playReviewDetail.contents }</textarea></td>
				</tr>
				</c:forEach>
			</table>
		</div>
			
		<!-- 댓글 전 -->
		<div class="subContainer2">
			<c:forEach var="playReviewDetail" items="${playReviewDetail }">
			<span id="count">
			<span style="color: #FE2E2E"><i class="fas fa-heart fa-lg"></i></span>&nbsp;${playReviewDetail.ccount }
			<span style="color: #0080FF"><i class="fa fa-comment fa-lg" aria-hidden="true"></i></span></i>&nbsp;${playReviewDetail.lcount }
			&nbsp;작성자: ${playReviewDetail.user_nick }			
			</span>
			<button type="button" id="report">리뷰 신고</button>		
			<hr>
			</c:forEach>
		</div>
		
		<!-- 댓글 ^^ -->
		<div class="col-lg-12">
				<!-- 로그인한 사용자의 USER_CD 가 들어갈 hidden 타입 인풋 박스 -->
				<input type="hidden" id="hiddenUser" value="U00004">
			<div>
                <label for="newReplyWriter"></label>
                <input type="text" id="newReplyWriter" name="replyWriter" placeholder="여기에 세션에서 따온 사용자 닉네임이 들어갈 예정">
            </div>
            <div>
                <label for="newReplyText"></label><br>
                <input type="text" id="newReplyText" name="replyText" placeholder="내용을 입력해주세요">
                <button type="button" id="commentAddBtn" class="btn">댓글 달기</button>
            </div>
        </div>
        <hr>
        <div class="box-footer">
            <ul id="comments">

            </ul>
        </div>
        <div class="box-footer">
            <div class="text-center">
                <ul class="pagination pagination-sm no-margin">

                </ul>
            </div>
        </div>
    </div>
  </div>

  <div class="modal fade" id="modifyModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">댓글 수정창</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="replyNo">댓글 번호</label>
                    <input class="form-control" id="replyNo" name="replyNo" readonly>
                </div>
                <div class="form-group">
                    <label for="replyText">댓글 내용</label>
                    <input class="form-control" id="replyText" name="replyText" placeholder="댓글 내용을 입력해주세요">
                </div>
                <div class="form-group">
                    <label for="replyWriter">댓글 작성자</label>
                    <input class="form-control" id="replyWriter" name="replyWriter" readonly>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-success modalModBtn">수정</button>
                <button type="button" class="btn btn-danger modalDelBtn">삭제</button>
            </div>
        </div>
    </div>
  </div>
		</div>
	</div>
</div>
</body>
</html>