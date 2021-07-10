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
<title>ReportedComment.jsp</title>
<!-- 부트스트랩 적용을 위한 3줄: 제이쿼리 스크립트 포함 -->
<link rel="stylesheet" href="<%=cp %>/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>
</head>
<body>

<table class="table">
	<tr>
		<th>최종 카테고리</th>
		<th>승인/반려</th>
	</tr>
	<tr>
		<td>
			<select class="form-control">
				<option value="1">사기 및 가격 정책 위반</option>
				<option value="2">욕설, 비방, 차별, 혐오</option>
				<option value="3">홍보, 영리 목적</option>
				<option value="4">개인정보 노출, 유포, 거래</option>
				<option value="5">음란, 청소년 유해</option>
				<option value="6">도배, 스팸</option>
			</select>
		</td>
		<td>
			<button type="submit" class="btn btn-info">승인</button>
			<button type="submit" class="btn btn-default">반려</button>
		</td>
	</tr>
</table>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>