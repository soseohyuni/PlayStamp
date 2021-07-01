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
<link rel="stylesheet" href="<%=cp %>/css/main.css">
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<style type="text/css">
#search {
	width: 500px;
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

#list #footer {
	background-color: #DDD;
	text-align: right;
	padding: 5px;
	font-size: small;
}

h1, div {
	text-align: center;
}

#textbox {
	line-height: 250px;
}
</style>

<script type="text/javascript">

	function search()
	{
		var search = document.getElementById("search").value;
		
		// 검색어가 존재할 경우에만 전송하여 ajax 처리할 수 있도록 구성
		// 검색어가 빈칸(" ")이거나 비어있는("") 경우 처리
		// (빈칸인 경우는 비어있는 경우로 replace)
		if(search.replace(" ","") == "")
		{
			document.getElementById("list").style.display="none";
			// 함수 기능 종료
			return;
		}
		
		// 검색어에 입력된 내용이 완성형 한글일 경우에만 키워드 전송하도록 구성
		// (쓰는 도중에 처리되지 않도록) → 정규표현식(/^[가-힣]{1,}$/) 사용
		var regEx = /^[가-힣]{1,}$/;
		
		if(!regEx.test(search))
			return;
		
		// URL 구성
		var url = "test05.do?search=" + search;
		
		// XMLHttpRequest 객체 생성
		ajax = createAjax();
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState==4)
			{
				if(ajax.status==200)
				{
					// 업무 내용 추출
					callBack();
				}
			}
		}
		
		ajax.send("");
	}
	
	// 추출된 업무 내용
	//-- XML 목록으로 받아온 검색어들을 적당한 리스트로 생성해서 화면에 출력
	function callBack()
	{
		// XML 문서 객체 수신
		var doc = ajax.responseXML;
		
		// XML 문서의 최상위 엘리먼트 수신 → 지금은 <list>인 상황
		var root = doc.documentElement;
		
		// 하위 엘리먼트 item을 모두 가져옴
		var itemList = root.getElementsByTagName("item");
		
		// items 박스 초기화
		//-- 사용자가 검색어를 지우거나, 키워드 바꿨을 때 이전 것 초기화~~!
		document.getElementById("items").innerHTML = "";
		
		// 추천 검색어 항목에 삽입		
		for(var i=0; i<itemList.length; i++)
		{
			var word = itemList[i].firstChild.nodeValue;
			
			// items 아래에 들어가도록 추가하기
			document.getElementById("items").innerHTML
			 += "<div class='item'>" + word +"</div>";
		}
		
		// 목록을 화면에 보이게 하기 위해 처리
		// (처음에 style에서 설정한 dispaly=none; 해제)
		document.getElementById("list").style.display = "block";
	}

</script>

</head>
<body>
	<div id="textbox">
		<h1>관람하신 공연명을 검색하여 선택해주세요</h1>
		<input type="text" id="search" class="control"
			placeholder="검색어를 입력하세요" onkeyup="search()">
		<!-- 키보드 누를때마다 입력된 단어 서버 전송하도록 onkeyup 이벤트 핸들러 설정 -->
		<br>
		<br> <input type="button" class="next" value="다음 단계로">
	</div>


	<div id="list">
		<div id="items">
			<div class="item"></div>
		</div>
		<div id="footer">추천 공연명</div>
	</div>


</body>
</html>