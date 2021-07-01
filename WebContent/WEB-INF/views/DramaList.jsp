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
<title>DramList.jsp</title>
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
	
	var list = "";
	var rep = 0;
	var params = "";
	
	$(function()
	{	
		params = { "playState" : "공연중" };
		
		// 최초 요청시
		ajaxRequest(params);
		
		// 버튼 클릭시 상태 변경하며 이동
		$(".playState").click(function()		
		{   
			$("#result").html("");
			var playState = $(this);
		
			// 버튼 클릭시 params 변수 해당 버튼의 value 값으로 초기화
			var params = { "playState" : playState.val() };

			ajaxRequest(params);			
		});
			
		// 버튼 클릭시마다 호출됨
		function ajaxRequest(params)
		{	
			$.ajax({
				type:"POST",
				url: "dramaprint.action",
				dataType: "json",
				data: params,
				success: function(data)
				{
					list = data.result;
					var temp = "";
					var num=0;	//-- 버튼 클릭할 때 여기루 감
					rep=1;
					
					
					var dheight = $(document).height();
					
					$("<table>").appendTo("#result");
					
					// 초기 게시물 20 개 구성
					for(var i=num; i<50; i++, num++)
					{
						// 한 줄에 다섯 개씩 출력
						if (i%5==0)
							$("<tr>").appendTo("#result");
						
						// get 방식으로 공연코드를 넘겨 줌으로써 클릭시 공연 상세정보로 이동할 수 있도록 함
						$("<td><a href='playdetail.action?play_cd="
								+ list[i].play_cd + "'>" + "<img src='"
								+ list[i].play_img + "' class='playImg'></a><td>").appendTo("#result");
								
						// 테스트 
						$("<td>" + num + "<td>").appendTo("#result"); 
						
						if (i%5==4)
							$("</tr>").appendTo("#result");	
					} //→ ajax 는 초기 게시물 구성하고, 버튼을 새로 클릭하지 않는 이상 더이상 호출되지 않음
					
					// 마우스 스크롤할 때 발동함
					
					var data = JSON.stringify(list);
					infinite(data);
					
					
					$("</table>").appendTo("#result");

				}, error : function(e)
				{
					alert(e.responseText);
				}
				
			});
		}
		
	});
	
	function infinite(data)
	{
		$(window).scroll(function()
		{					
			var dheight = $(document).height();
			var sheight = $(window).scrollTop() + $(window).height();
			var length = list.length;
			
			$(".playState").click(function()
			{
				rep = 1;
			});
			
			// 스크롤이 바닥에 닿으면
			if(dheight == sheight)
			{		
				for(var i=50*rep ; i<50 + (50*rep); i++)
				{
					// 데이터를 다 출력하면 무한 스크롤 이벤트 해제
					if (i == list.length)
						$(window).unbind("scroll");
					
					// 한 줄에 다섯 개씩 출력
					if (i%5==0)
						$("<tr>").appendTo("#result");
					
					// get 방식으로 공연코드를 넘겨 줌으로써 클릭시 공연 상세정보로 이동할 수 있도록 함
					$("<td><a href='playdetail.action?play_cd="
							+ list[i].play_cd + "'>" + "<img src='"
							+ list[i].play_img + "' class='playImg'></a><td>").appendTo("#result");
					
					// 테스트
					$("<td>" + i + "<td>").appendTo("#result"); 
					
					if (i%5==4)
						$("</tr>").appendTo("#result");	
				}
				
				rep = rep + 1;
			}
			
		});
	}
 
			
</script>
</head>
<body>
<div>
	<!-- 상단바 -->
	<div>
		<c:import url="header.jsp"></c:import>
	</div>
	
	<!-- 뮤지컬/연극 버튼 -->
	<div class="play">
		<input type="button" id="musical" name="musical" class="play" value="뮤지컬" onclick="location.href='musicallist.action'">
		<input type="button" id="drama" name="drama" class="play" value="연극" onclick="location.href='dramalist.action'">
	</div>
	
	<!-- 공연중/공연예정/공연완료 버튼 -->
	<div>
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
	
	<!-- 리스트 출력 예정 -->
	<div id="result">
	
	</div>
</div>

</body>
</html>