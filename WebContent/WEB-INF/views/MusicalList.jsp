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
				
				for(var i=0; i< list.length; i++) {
					//alert(list[i].price + " " + list[i].name + " " + list[i].introduce);
					temp += list[i].playCd + " " + list[i].playImg;
				}
				$('#result2').html(temp);

			}, error : function(e)
			{
				alert(e.responseText);
			}
			
		}); 
			
	}    	
</script>
</head>
<body>
<div id="result2">
<input type="button" id="btn">

</div>

</body>
</html>