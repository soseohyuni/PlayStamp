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
<title>CommentReport.jsp</title>
</head>
<body>
<div class="modal-header">
 	<h3 class="smaller lighter blue no-margin modal-title">신고 내역 확인</h3>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
</div>
 
<div class="modal-body">
	<table class="table table_hover">
		<tr>
			<th>신고 내용</th>
			<td>${commentReport.rep_contents }</td>
		</tr>
		<tr>
			<th>신고 사유</th>
			<td>${commentReport.rep_y }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${commentReport.writer }</td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td>${commentReport.wr_dt }</td>
		</tr>
	</table>
	
	<table>
		
	</table>          
</div>
<div>
	<table class="table">
		<tr>
			<th>최종 카테고리</th>
			<th>승인/반려</th>
		</tr>
		<tr>
			<td>
				<select class="form-control" name="">
					<option value="1">사기 및 가격 정책 위반</option>
					<option value="2">욕설, 비방, 차별, 혐오</option>
					<option value="3">홍보, 영리 목적</option>
					<option value="4">개인정보 노출, 유포, 거래</option>
					<option value="5">음란, 청소년 유해</option>
					<option value="6">도배, 스팸</option>
				</select>
			</td>
			<td>
				<input type="button" class="btn btn-info" value="승인">
				<input type="button" class="btn btn-info" value="반려">
			</td>
		</tr>
	</table>
</div>
<div class="modal-footer">
    <span class="btn btn-sm btn-success" id="testSave">
        저장<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btnClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>

</body>
</html>