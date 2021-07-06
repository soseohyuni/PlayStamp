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
ul#best1 li {display:inline;}
</style>
<script type="text/javascript">

	/* 초기화 initView(ul엘리먼트의 id, 최초 보여지는 li 엘리먼트 갯수, display 값) */
	function initView(el_id, view_item_count, style)
	{
	    var menu = document.getElementById(el_id);
	    var menu_list = menu.getElementsByTagName('li');
	    var menu_count = menu_list.length;
	    style = (typeof(style) != 'undefined') ? style : 'block';
	
	    for(var i=0;i<menu_count;i++){
	        if(i<view_item_count) menu_list[i].style.display = style;
	        else menu_list[i].style.display = 'none';
	    }
	}
	
	/* 목록 이동 moveList(이동시킬방향 prev 또는 next, 이동시킬 ul 엘리먼트의 id, 보여질 목록 갯수, 이동시킬 갯수, display 값) */
	function moveList(direction, el_id, view_item_count, scroll_count, style)
	{
	    var menu = document.getElementById(el_id);
	    var menu_list = menu.getElementsByTagName('li');
	    var menu_count = menu_list.length;
	    var start_no = 0;
	
	    style = (typeof(style) != 'undefined') ? style : 'block';
	
	    // 현재 보여지고 있는 엘리먼트의 시작을 확인
	    for(var i=0;i<menu_count;i++){
	        if(menu_list[i].style.display == style){
	            start_no = i;
	            break;
	        }
	    }
	   
	    // 방향에 따른 이동
	    if(direction == 'next'){
	        if(menu_list[menu_count-1].style.display == style) return false;
	        else{
	            for(var i=0;i<menu_count;i++){
	                if(i>=start_no + scroll_count && i<start_no + scroll_count + view_item_count){
	                    menu_list[i].style.display = style;
	                }else{
	                    menu_list[i].style.display = 'none';
	                }
	            }
	        }
	    }else if(direction == 'prev'){
	        if(menu_list[0].style.display == style) return false;
	        else{
	            for(var i=0;i<menu_count;i++){
	                if(i>=start_no - scroll_count && i<start_no - scroll_count + view_item_count){
	                    menu_list[i].style.display = style;
	                }else{
	                    menu_list[i].style.display = 'none';
	                }
	            }
	        }
	    }
	}
	
	initView('best1', 5, 'inline');

</script>
</head>
<body>

<ul id="best1">
    <li>아이템1</li>
    <li>아이템2</li>
    <li>아이템3</li>
    <li>아이템4</li>
    <li>아이템5</li>
    <li>아이템6</li>
    <li>아이템7</li>
    <li>아이템8</li>
    <li>아이템9</li>
    <li>아이템10</li>
    <li>아이템11</li>
    <li>아이템12</li>
    <li>아이템13</li>
    <li>아이템14</li>
    <li>아이템15</li>
    <li>아이템16</li>
    <li>아이템17</li>
    <li>아이템18</li>
    <li>아이템19</li>
    <li>아이템20</li>
    <li>아이템21</li>
</ul>


<!-- 리스트를 컨트롤 할 엘리먼트 -->
<a href="#" onclick="moveList('prev', 'best1', 5, 5, 'inline');return false;">이전</a>
<a href="#" onclick="moveList('next', 'best1', 5, 5, 'inline');return false;">다음</a>


</body>
</html>