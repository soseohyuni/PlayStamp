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
<title>Insert title here</title>
<style type="text/css">
	.play
	{
		text-align: center;
	}
	
	.playState
	{
		text-align: left;
	}
	
	#sort
	{
	 	float:right;
	}
	
	#result
	{
		padding: 50px 175px;
		text-align: center;
	}
	.playImg
	{
		width: 180px;
		height: 280px;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">

	$(function()
	{

			request();	

		
		
	});
	
	function request()
	{   
	$.ajax({
			type:"post",
			url: "musicallist.action",
			dataType: "json",
			success: function(data)
			{
				var list = data.result;
				var temp = "";
				
				temp += "<table>";
				
				for(var i=0; i<list.length; i++)
				{
					// 한 줄에 다섯 개씩 출력
					if (i%5==0)
						temp += "<tr>";
					
					// get 방식으로 공연코드를 넘겨 줌으로써 클릭시 공연 상세정보로 이동할 수 있도록 함
					temp += "<td><a href='playdetail.action?playCd=" + list[i].playCd + "'>" + "<img src='" + list[i].playImg + "' class='playImg'></a><td>"; 
					
					if (i%5==4)
						temp += "</tr>";		
				}
				temp += "</table>";
				$("#result").html(temp);

			}, error : function(e)
			{
				alert(e.responseText);
			}
			
		}); 
			
	};    	
</script>
</head>
<body>
<div>
	<!-- 상단바 -->
	<%-- <div>
		<c:import url="header.jsp"></c:import>
	</div> --%>
	
	<!-- 뮤지컬/연극 버튼 -->
	<div class="play">
		<input type="button" id="musical" name="musical" class="play" value="뮤지컬" onclick="location.href='musicallist.action'">
		<input type="button" id="drama" name="drama" class="play" value="연극" onclick="location.href='dramalist.action'">
	</div>
	
	<!-- 공연중/공연예정/공연완료 버튼 -->
	<div class="playState">
		<input type="button" id="ingPlay" name="ingPlay" class="playState" value="공연중">
		<input type="button" id="willPlay" name="willPlay" class="playState" value="공연예정">
		<input type="button" id="edPlay" name="edPlay" class="playState" value="공연완료">
	</div>
	
	<!-- 구분선 -->
	<hr/>
	
	<!-- 왼 -->
	<div id="playStateCheck">
	</div>

	<!-- 오 -->
	<div>
	<select id="sort">
		<option value="val1">최신순</option>
		<option value="val2">리뷰많은순</option>
	</select>
	</div>
	
<div id="result">

</div>

</body>
</html>