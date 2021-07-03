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
<title>MSeatMain.jsp</title>
<%-- <link rel="stylesheet" href="<%=cp %>/css/mseat.css"> --%>
<script type="text/javascript" src="<%=cp%>/js/jquery-3.6.0.min.js"></script>



<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 별점 기능을 위한 아이콘을 CDN 방식으로 추가 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- 별점 이미지 파일을 다운받은 뒤 css폴더에 추가해 경로 지정 -->
<link rel="stylesheet" href="<%=cp%>/css/fontawesome-stars.css">
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- 별점 콜백 함수 호출을 위해 js 폴더에 추가해 경로 지정 -->
<script type="text/javascript" src="<%=cp%>/js/jquery.barrating.min.js"></script>


<!--  Tooltips
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 -->

<style type="text/css">
body {
	font-size: 25pt;
	font-weight: bold;
}

#fullBackground {
	position: absolute;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 1400px !important;
	/* background-color: #E4E4E4; */
	background-color: #343434;
	filter: alpha(opacity = 55);
	opacity: 0.5;
	display: none;
	z-index: 100;
}

#sac, #bs {
	position: absolute;
	height: 1000px;
	left: 150px;
	top: 33px;
	bottom: 33px;
	border: 1px solid;
	background-color: #FFFFFF;
	z-index: 101;
	display: none;
	width: 1000px;
}

.titleBar, .content {
	font-family: 굴림;
	font-size: 9pt;
	/* padding: 2px 2px 2px 5px; */
	width: 1000px;
}

.titleBar {
	clear: both;
	height: 25px;
	background: #3980F4;
	width: 1000px;
	cursor: move;
}

.title {
	float: left;
	font-size: 9pt;
	height: 25px;
	line-height: 25px;
	background: #3980F4;
	color: #FFFFFF;
	width: 270px;
	cursor: move;
}

.titleClose {
	float: right;
	font-size: 9pt;
	height: 20px;
	margin-top: 5px;
	background: #3980F4;
	color: #FFFFFF;
	width: 17px;
	cursor: pointer;
}

.content {
	clear: both;
	width: 1000px;
	/* height: 1000px; */
	align: center;
	margin: 0 auto;
	text-align: center;
	top: 5%;
}

.backgroundImg {
	width: 500px;
	z-index: 2;
}

.intro, .theater {
	text-align: center !important;
	align-content: center;
	margin: 0 auto;
	justify-content: center;
	font-weight: bold;
	align: center;
}

.btn-theater {
	margin: 0;
	padding: 0.5rem 1rem;
	font-size: 1rem;
	font-weight: 400;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	width: 150px;
	border: none;
	border-radius: 4px;
	background: #608FBF;
	color: white;
}

.seatImg {
	position: absolute;
	z-index: 1;
}

.seatRating {
	width: 200px;
	z-index: 1 !important;
	border: 1px solid;
	top: 100px;
	position: absolute;
	left: 40px;
	border-radius: 2em;
	margin: 5px;
}

	#tableRating th
	{
		margin: 20px;
		font-size: 10pt;
	}
	
	#tableRating td
	{
		text-align: left;
		font-size: 10pt;	
	}
	
</style>

<script type="text/javascript">

	// 별점 구현 -----------------------------------------------------------
	// ----------------------------------------------------------- 별점 구현 

	// 모달창 구현 -----------------------------------------------------------
	var on_off = 0;
	var x_margin, y_margin;
	var popup, fullBackground;

	// 모달창 여는 기능
	function openFrame(x)
	{
		// 공연장 버튼을 클릭했을 때 받는 value값(sac, bc, ..)마다 다르게 div 내용 불러오기
		if (x == 1)
			popup = document.getElementById("sac");
		else if (x == 2)
			popup = document.getElementById("bs");
		else if (x == 3)
			popup = document.getElementById("sac");
		else if (x == 4)
			popup = document.getElementById("sac");
		else
			popup = document.getElementById("sac");

		fullBackground = document.getElementById("fullBackground");

		fullBackground.style.top = document.body.scrollTop; //-- y 축 방향으로 스크롤한 거리
		fullBackground.style.left = document.body.scrollLeft; //-- x 축 방향으로 스크롤한 거리

		popup.style.top = ((screen.height / 2) - 200 + document.body.scrollTop)
				+ "px";
		popup.style.left = ((screen.width / 2) - 500) + "px";

		fullBackground.style.display = "block";
		popup.style.display = "block";
		//document.body.style.overflow = "hidden";
	}

	// 모달창 닫는 기능
	function closeFrame()
	{
		fullBackground.style.display = "none";
		popup.style.display = "none";
		document.body.style.overflow = "auto";
	}

	function move_onoff(chk, e)
	{
		if (chk == 1)
		{
			x_margin = e.clientX - popup.offsetLeft;
			y_margin = e.clientY - popup.offsetTop;
		}
		on_off = chk;
	}

	function moven(e)
	{
		if (on_off == 1)
		{
			var x_result = e.clientX - x_margin;
			var y_result = e.clientY - y_margin;

			if (x_result > 0)
				popup.style.left = x_result + "px";
			if (y_result > 0)
				popup.style.top = y_result + "px";
		}
	}
	// ----------------------------------------------------------- 모달창 구현 

	// AJAX 구현 -------------------------------------------------------------
	var listSac = ""; // ajax 가 반환하는 listSac 객체 받을 변수
	var params = ""; // seatName를 키값과 밸류값으로 갖는 자바스크립트 객체

	$(function()
	{
		// 처음 로드 했을 때는 평점 div는 숨겨져있는 상태
		$(".seatRating").hide();

		// 마우스 엔터했을 때
		$(".seatImg").mouseenter(function()
		{
			// div 내용 초기화
			$("#ratingDiv").html("");

			// seatName에 구역번호값 담기
			var seatName = $(this).val();

			// 어느 구역인지 표시하기 위해 A+구역번호
			$('.seatName').html("A" + seatName);

			// 마우스 엔터시 params 변수 해당 버튼의 value 값으로 초기화
			var params =
			{
				"seatName" : seatName
			};

			$(".seatRating").show();
			
			if(seatName>=9 && seatName<=12)
				$(".seatRating").css("top", "420px").css("left", "750px");
			if(seatName>=13)
				$(".seatRating").css("top", "650px").css("left", "40px");
			
			$.ajaxSetup(
			{
				async : false
			});

			// 아작스 요청
			ajaxRequest(params);

			// 마우스 리브했을 때 평점 div 숨김
			$(".seatImg").mouseleave(function()
			{
				$("#ratingDiv").html("");
				$(".seatRating").hide();
			});
		});

		// 마우스 엔터시마다 호출됨
		function ajaxRequest(params)
		{
			// GET방식으로 요청해야 가능해짐
			$.ajax(
			{
				type : "GET",
				url : "seatratingprint.action",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				data : params,
				success : function(data)
				{
					listSac = data.listSac;

					// 4개의 변수이므로 i<4
					for (var i = 0; i < 4; i++)
					{
						/* 
						$('#view').barrating('set', listSac[i].viewrating);
						$('#sound').barrating('set', listSac[i].soundrating);
						$('#light').barrating('set', listSac[i].lightrating);
						$('#seat').barrating('set', listSac[i].seatrating);
						
						
						view = listSac[i].viewrating;
						seat = listSac[i].seatrating;
						light = listSac[i].lightrating;
						sound = listSac[i].soundrating;
						*/
						/*
						$("<input title='시야 : "+ listSac[i].viewrating 
								+ "<br>좌석 : " + listSac[i].seatrating 
								+ "<br>조명 : " + listSac[i].lightrating
								+ "<br>조명 : " + listSac[i].lightrating + "' type='image' class='seatImg' value='1' src='images/sac/sac-a1.png' style='top: 88px; left: 392px; width: 21%;'>").appendTo(".content");
						
						
						$("<a href='#' title='시야 : "+ listSac[i].viewrating 
							+ "<br>좌석 : " + listSac[i].seatrating 
							+ "<br>조명 : " + listSac[i].lightrating
							+ "<br>조명 : " + listSac[i].lightrating + "'>").appendTo(".content");
						*/	
						

						// listSac에 담아온 것을 테이블 형식에 맞게 뿌려줌
						$("<table id='tableRating'><tr><th>시야</th><td>&emsp;" + listSac[i].viewrating + "</td></tr>"
						+ "<tr><th>좌석</th><td>&emsp;" + listSac[i].seatrating + "</td></tr>"
						+ "<tr><th>조명</th><td>&emsp;" + listSac[i].lightrating + "</td></tr>"
						+ "<tr><th>음향</th><td>&emsp;" + listSac[i].soundrating + "</td></tr></table>").appendTo("#ratingDiv");
				
						
					}
				},
				error : function(e)
				{
					alert(e.responseText);
				}
			// 여기에 put X
			});
		}
	});
	// ------------------------------------------------------------- AJAX 구현 

	// 전역변수로 담겼는지 확인하기 위한 테스트
	//console.log(sound);
	
</script>
</head>
<c:import url="header.jsp"></c:import>
<body onmouseup="move_onoff(0, event);" onmousemove="moven(event);">

	<!-- 메인 화면 -->
	<br>
	<br>
	<!-- 공연장 버튼 -->
	<div class="theather" style="text-align: center;">
		<a href="javascript:openFrame(1);" class="btn-theater">예술의전당</a>&emsp;
		<a href="javascript:openFrame(2);" class="btn-theater">블루스퀘어</a>&emsp;
		<a href="javascript:openFrame(3);" class="btn-theater">충무아트센터</a>&emsp;
		<a href="javascript:openFrame(4);" class="btn-theater">디큐브아트센터</a>&emsp;
		<a href="javascript:openFrame(5);" class="btn-theater">샤롯데씨어터</a>
	</div>

	<br />
	<br />
	<div class="intro">
		궁금하신 공연장을 선택하시고<br>좌석 구역에 마우스를 올려보세요 !
		<div class="mseatexample">
			<img src="images/mseatexample.png">
		</div>
	</div>


	<!-- 모달창 팝업시 배경 -->
	<div id='fullBackground'></div>

	<!----------------------------------------------------- 예술의전당 모달창 ------------------------------------------------------->
	<div id="sac">
		<div id="modal" class="titleBar" onmousedown="move_onoff(1, event);">
			<div class="title">::: 예술의전당 :::</div>
			<div class="titleClose">
				<a href="javascript:closeFrame();" style="cursor: hand;"> <img
					src="images/btn_close.gif" border="0" /></a>
			</div>
		</div>

		<div class="content">
			<!-- 예술의전당 좌석배치도 -->
			<img class="backgroundImg" src="images/sac/seoulArtsCenter_clean.png">

			<!-- 좌석배치도 위에 이미지에 맞게 구역(A1~A14) 설정 -->
			<input type="image" class="seatImg" value="1" src="images/sac/sac-a1.png" style="top: 88px; left: 392px; width: 21%;"> 
			<input type="image" class="seatImg" value="2" src="images/sac/sac-a2.png" style="top: 140px; left: 387px; width: 22%;"> 
			<input type="image" class="seatImg" value="3" src="images/sac/sac-a3.png" style="top: 200px; left: 433px; width: 13%;"> 
			<input type="image" class="seatImg" value="4" src="images/sac/sac-a4.png" style="top: 263px; left: 424px; width: 15%;"> 
			<input
				type="image" class="seatImg" value="5" src="images/sac/sac-a5.png"
				style="top: 128px; left: 320px; width: 10%;"> 
			<input
				type="image" class="seatImg" value="6" src="images/sac/sac-a6.png"
				style="top: 234px; left: 320px; width: 9%;"> 
			<input
				type="image" class="seatImg" value="7" src="images/sac/sac-a7.png"
				style="top: 128px; left: 570px; width: 10%;"> 
			<input
				type="image" class="seatImg" value="8" src="images/sac/sac-a8.png"
				style="top: 238px; left: 580px; width: 9%;"> 
			<input
				type="image" class="seatImg" value="9" src="images/sac/sac-a9.png"
				style="top: 480px; left: 375px; width: 26%;"> 
			<input
				type="image" class="seatImg" value="10" src="images/sac/sac-a10.png"
				style="top: 534px; left: 424px; width: 16%;"> 
			<input
				type="image" class="seatImg" value="11" src="images/sac/sac-a11.png"
				style="top: 392px; left: 324px; width: 9%;"> 
			<input
				type="image" class="seatImg" value="12" src="images/sac/sac-a12.png"
				style="top: 392px; left: 593px; width: 9%;"> 
			<input
				type="image" class="seatImg" value="13" src="images/sac/sac-a13.png"
				style="top: 686px; left: 370px; width: 27%;"> 
				<input
				type="image" class="seatImg" value="14" src="images/sac/sac-a14.png"
				style="top: 613px; left: 320px; width: 37%;">


			<div class="seatRating">
				<div class="seatName" style="font-size: 20pt; color: #ff8000; font-weight: bold;"></div><br>
				<div>해당구역에서 관람한 회원님들이<br>남겨주신 평균 별점입니다 :)</div><br>
				<div id="ratingDiv" style="left:70px;"></div>
			</div>
			<!-- close .seatRating -->
		</div>
		<!-- close .content -->
	</div>
	<!-- close #sac -->


	<!----------------------------------------------------- 블루스퀘어 모달창 ------------------------------------------------------->
	<div id="bs">
		<div id="modal" class="titleBar" onmousedown="move_onoff(1, event);">
			<div class="title">::: 블루스퀘어 :::</div>
			<div class="titleClose">
				<a href="javascript:closeFrame();" style="cursor: hand;"> <img
					src="images/btn_close.gif" border="0" /></a>
			</div>
		</div>

		<div class="content">
			<!-- 블루스퀘어 좌석배치도 -->
			<img class="backgroundImg" src="images/bs/blue.png">

			<!-- 좌석배치도 위에 이미지에 맞게 구역(A1~A14) 설정 -->
			<input type="image" class="seatImg" src="images/sac/sac-a1.png"
				style="top: 88px; left: 392px; width: 21%;"> <input
				type="image" class="seatImg" src="images/sac/sac-a2.png"
				style="top: 140px; left: 387px; width: 22%;"> <input
				type="image" class="seatImg" src="images/sac/sac-a3.png"
				style="top: 200px; left: 433px; width: 13%;"> <input
				type="image" class="seatImg" src="images/sac/sac-a4.png"
				style="top: 263px; left: 424px; width: 15%;"> <input
				type="image" class="seatImg" src="images/sac/sac-a5.png"
				style="top: 128px; left: 320px; width: 10%;"> <input
				type="image" class="seatImg" src="images/sac/sac-a6.png"
				style="top: 234px; left: 320px; width: 9%;"> <input
				type="image" class="seatImg" src="images/sac/sac-a7.png"
				style="top: 128px; left: 570px; width: 10%;"> <input
				type="image" class="seatImg" src="images/sac/sac-a8.png"
				style="top: 238px; left: 580px; width: 9%;"> <input
				type="image" class="seatImg" src="images/sac/sac-a9.png"
				style="top: 480px; left: 375px; width: 26%;"> <input
				type="image" class="seatImg" src="images/sac/sac-a10.png"
				style="top: 534px; left: 424px; width: 16%;"> <input
				type="image" class="seatImg" src="images/sac/sac-a11.png"
				style="top: 392px; left: 324px; width: 9%;"> <input
				type="image" class="seatImg" src="images/sac/sac-a12.png"
				style="top: 392px; left: 593px; width: 9%;"> <input
				type="image" class="seatImg" src="images/sac/sac-a13.png"
				style="top: 686px; left: 370px; width: 27%;"> <input
				type="image" class="seatImg" src="images/sac/sac-a14.png"
				style="top: 613px; left: 320px; width: 37%;">

		</div>
		<!-- close #modal -->
	</div>
	<!-- close #bs -->
</body>
</html>