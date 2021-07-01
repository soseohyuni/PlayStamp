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
<title>AddReviewSearchForm.jsp</title>
<!-- 부트스트랩, 제이쿼리 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- jQuery UI CDN 추가 3줄 (autocomplete, 자동 완성 기능 구현용) -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
h3, div {
	text-align: center;
}

h5 {
	text-align: left;
}

#search {
	width: 700px;
	margin: 0 auto;
}

#btn {
	width: 500px;
	margin: auto;
	display: block;
}

#list {
	border: 1px solid gray;
	width: 500px;
	position: absolute;
	left: 70px;
	top: 134px;
	display: none;
}

#list .tem {
	padding: 3px;
}
</style>
<script type="text/javascript">

	// jQuery UI: autocomplete 사용
	//-- 키보드를 누를 때마다 데이터를 가져오는 ajax 와 달리
	//   한 번에 데이터를 가져와서 키보드 입력 값에 따라 보여주는 정보를 달리 한다.
	$(function()
	{
		var arr = new Array();
		// 사용자에게는 play 객체의 play_nm(=value1, 공연명+기간) 만 보여준다.
		// 해당 공연명을 클릭하면 하단에서는 같은 객체의 공연 코드 값도 저장한다.
		$("input[name=play_nm]").each(function(index, item)
		{
			arr.push($(item).attr("value1"));
		});
		
		$("#search").autocomplete
		({
			source: arr
		});
	});

	/*
	// 다음 단계로 이동 버튼 클릭 시
	// 리뷰식별 테이블에 INSERT, 사용자코드도 submit 시 전달 필요
	// ※ 리뷰식별코드 생성하면서 INSERT하고 그 식별코드를 다음 페이지로 바로 전달 할 수 있다. (selectKey)
	$(function()
	{
		$("#nextBtn").click(function()
		{
			$(location).attr("href", "addreviewseatform.action?play_cd=" + $(this).val());
		});
	});
	*/

</script>
</head>
<body>

<div id="textbox">
	<h5>
		<img src="<%=cp%>/images/addReviewIcon.PNG" width="20px" height="20px">리뷰 추가하기
	</h5>
	<hr>
</div>

<div>
	<!-- 다음 단계로 이동 버튼 클릭 시 사용자가 선택한 공연코드를 가지고 좌석 리뷰 작성 페이지로 이동 -->
	<form action="addreviewseatform.action" role="form" method="post">
		<h3>관람하신 공연명을 검색하여 선택해주세요</h3>
	    <br>
		<br>
		<input type="text" id="search" class="control" placeholder="공연을 검색해보세요!">
		
		<!-- 스크립트 단에 전달할 공연정보 hidden 속성으로 구성 -->
		<!-- 스크립트에는 공연명만 전달하고, 공연코드는 사용자가 선택했을 때
		     value2로 가지고 있던 공연코드를 다음 페이지에 submit 한다. -->
		<c:forEach var="play" items="${list }">
			<input type="hidden" id="play_nm" name="play_nm" value1="${play.play_nm }" value2="${play.play_cd }"/>
			<input type="hidden" id="theater_cd" name="theater_cd" value="${play.theater_cd }"/>
		</c:forEach>
		<br><br>
		<div>
			<button type="submit" id="nextBtn" class="btn btn-primary btn-lg"
			value="${play.play_cd }">다음 단계로</button>
		</div>
	</form>
</div>

</body>
</html>