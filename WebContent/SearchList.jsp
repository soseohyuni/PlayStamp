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
<title>SearchList.jsp</title>
<!-- 부트스트랩, 제이쿼리 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- jQuery UI CDN 추가 3줄 (autocomplete, 자동 완성 기능 구현용) -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="css/header.css">
	
<style type="text/css">
#wrapper { 
	width: 100%; 
	height: 100%; 
	align-content: center; 
}
#wrapper .container{
	width:1300px;
}
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
#nextBtn{
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
		var arr = new Array();		//-- 사용자가 선택한 공연 객체가 담길 배열
		
		// 사용자에게는 play 객체의 play_nm(=value1, 공연명+기간) 만 보여준다.
		// 해당 공연명을 클릭하면 하단에서는 같은 객체의 공연 코드 값도 저장한다.

		$("input[name=playlist]").each(function(index, item)
		{
			arr.push($(item).attr("value"));		//-- 공연명 배열에 넣기
		});
		
		$("#search").autocomplete
		({
			source: arr,
			minLength: 2,
			select : function(event, ui)
			{
				// 하단의 숨겨진 공연명 속성에 사용자가 선택한 공연명 전달
				$("#play_nm").val(ui.item.value);
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
	<br>
	<h5>
		<span>통합 검색</span>
	</h5>
	<hr>
</div>
<br><br><br><br><br>
<div id="wrapper">
	<div class="container">
	
		<!-- 검색 시 공연 목록 조회 -->
		<div class="row">
			<c:forEach var="myreviewposter" items="${myreviewposter }">
  			<div class="col-lg-3 col-xs-6 col-md-3">
    			<div class="thumbnail">
      				<a href="myreviewdetail.action?play_cd=${myreviewposter.play_cd }&rev_distin_cd=${myreviewposter.rev_distin_cd}" 
             		class="thumbnail">
               			<img src="${myreviewposter.play_img }">
             		</a>
      				<div class="caption">
        				<h3>Thumbnail label</h3>
        				<p>...</p>
        				<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
      				</div><!-- .caption -->
    			</div><!-- .thumbnail -->
 			</div><!-- .col-lg-3 .col-xs-6 .col-md-3 -->
 			</c:forEach>
		</div><!-- .row -->
		
		
		<!-- 검색 시 리뷰 목록 조회 -->
		<div class="row">
			<c:forEach var="myreviewposter" items="${myreviewposter }">
  			<div class="col-lg-3 col-xs-6 col-md-3">
    			<div class="thumbnail">
      				<a href="myreviewdetail.action?play_cd=${myreviewposter.play_cd }&rev_distin_cd=${myreviewposter.rev_distin_cd}" 
             		class="thumbnail">
               			<img src="${myreviewposter.play_img }">
             		</a>
      				<div class="caption">
        				<h3>Thumbnail label</h3>
        				<p>...</p>
        				<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
      				</div><!-- .caption -->
    			</div><!-- .thumbnail -->
 			</div><!-- .col-lg-3 .col-xs-6 .col-md-3 -->
 			</c:forEach>
		</div><!-- .row -->
		
		
	</div><!-- .container -->
</div><!-- #wrapper -->



</body>
</html>