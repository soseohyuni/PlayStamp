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
<title>AddReviewSeatForm.jsp</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 별점 기능을 위한 아이콘을 CDN 방식으로 추가 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- 별점 이미지 파일을 다운받은 뒤 css폴더에 추가해 경로 지정 -->
<link rel="stylesheet" href="<%=cp %>/css/fontawesome-stars.css">
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- 별점 콜백 함수 호출을 위해 js 폴더에 추가해 경로 지정 -->
<script src="<%=cp %>/js/jquery.barrating.min.js"></script>
<style type="text/css">
.center {
	margin: 0 auto;
	text-align: center;
}

#center {
	margin: 0 auto;
	text-align: center;
}

.reviewleft {
	margin-left: 300px;
}

#container {
	margin: 0 auto;
	max-width: 1300px;
}

.box1 {
	margin-left: 300px;
	width: 200px;
	height: 150px;
	float: left;
	margin-right: 10px;
}

.box2 {
	width: 200px;
	height: 150px;
	float: left;
}

.selectpicker {
	width: 50px;
	height: 23px;
}

#num {
	width: 50px;
	height: 23px;
}

th, td {
	padding: 3px;
}

select {
	width: 100%;
	height: 29px;
	font-size: 15px;
	background: #fff
		url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100%
		50% no-repeat;
	background-size: 20px 8px;
	-webkit-appearance: none;
	display: inline-block;
	text-align: start;
	border: none;
	cursor: default;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}
</style>
<script type="text/javascript">

   // 추가한 제이쿼리 플러그인의 콜백함수 호출
   $(function() {
      $('#view').barrating({
        theme: 'fontawesome-stars'
      });
   });
   
   $(function() {
      $('#seat').barrating({
        theme: 'fontawesome-stars'
      });
   });
   
   $(function() {
      $('#sound').barrating({
        theme: 'fontawesome-stars'
      });
   });
   
   $(function() {
      $('#light').barrating({
        theme: 'fontawesome-stars'
      });
   });
   
</script>
</head>
<body>
	<div id="textbox">
		<h5>
			<img src="<%=cp%>/images/addReviewIcon.PNG" width="20px"
				height="20px">리뷰 추가하기
		</h5>
		<hr>
	</div>
	<div class="center">
		<h5>(이전페이지에서 넘어온 공연명)를 관람하셨군요!</h5>
		<h5>플레이 스탬프에서 더 많은 정보들이 공유될 수 있도록, 관람하신 좌석에 대한 정보를 기입해주세요!</h5>
		<h5>해당 좌석 리뷰 정보는 일반회원 이상 등급에 한해 공개됩니다.</h5>
	</div>
	<br>
	<br>
	<div id="container">
		<form>
			<!-- 5대 공연장인 경우 -> c: if로 체크하고 맞으면 사진, 구역 입력받기 추가 필요-->
			<div class="box1">
				<div>
					<b>좌석 위치</b>
				</div>
				<br>
				<div>
					<select class="selectpicker" id="floor" name="floor">
						<option>-</option>
						<c:forEach var="a" begin="1" end="5" step="1">
							<option value="${a }">${a }</option>
						</c:forEach>
					</select> 층 <select class="selectpicker" id="area" name="area">
						<option>-</option>
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="C">C</option>
						<option value="D">D</option>
						<option value="E">E</option>
						<option value="F">F</option>
						<option value="G">G</option>
						<option value="H">H</option>
						<option value="OP">OP</option>
						<option value="가">가</option>
						<option value="나">나</option>
						<option value="다">다</option>
						<option value="라">라</option>
						<option value="마">마</option>
						<option value="바">바</option>
						<option value="사">사</option>
						<option value="아">아</option>
					</select> 구역 <br> <select class="selectpicker" id="line" name="line">
						<option>-</option>
						<c:forEach var="a" begin="1" end="30" step="1">
							<option value="${a }">${a }</option>
						</c:forEach>
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="C">C</option>
						<option value="D">D</option>
						<option value="E">E</option>
						<option value="F">F</option>
						<option value="G">G</option>
						<option value="H">H</option>
						<option value="I">I</option>
						<option value="J">J</option>
						<option value="K">K</option>
						<option value="L">L</option>
						<option value="M">M</option>
						<option value="N">N</option>
						<option value="O">O</option>
						<option value="P">P</option>
						<option value="Q">Q</option>
						<option value="R">R</option>
						<option value="S">S</option>
						<option value="T">T</option>
						<option value="U">U</option>
						<option value="V">V</option>
						<option value="W">W</option>
						<option value="X">X</option>
						<option value="Y">Y</option>
						<option value="Z">Z</option>
						<option value="OP">OP</option>
					</select> 열 <input type="text" id="num" class="num"> 번호 <br>
				</div>
			</div>
			<div class="box2">
				<div>
					<b>좌석 별점</b>
				</div>
				<table>
					<tr>
						<th>시야</th>
						<td><select id="view">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
						</select></td>
					</tr>
					<tr>
						<th>좌석</th>
						<td><select id="seat">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
						</select></td>
					</tr>
					<tr>
						<th>음향</th>
						<td><select id="sound">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
						</select></td>
					</tr>
					<tr>
						<th>조명</th>
						<td><select id="light">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
						</select></td>
					</tr>
				</table>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="reviewleft">
				<b>좌석 리뷰</b>
			</div>
			<div class="center">
				<textarea id="review" cols="55" rows="5" style="resize: none;"></textarea>
			</div>
			<br>
			<br>
			<br>
			<div class="center">
				<button type="submit" id="center" class="btn btn-primary">상세
					리뷰 작성하러 가기</button>
			</div>
		</form>
	</div>


</body>
</html>