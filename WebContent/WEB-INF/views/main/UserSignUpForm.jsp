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
<title>회원가입</title>

<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=cp%>/css/usersignup.css" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	var idFlag = false;
	var pwFlag = false;
	var mailFlag = false;
	
	
	function checkForm()
	{
		if(idFlag==false) {
			alert("아이디 중복체크를 해주세요.");
	        return false;
	    }
		 
		else if(!$("#chk").prop("checked"))
		{
			alert("약관 동의 후 가입 가능합니다.");
			return false;
		}
		
		return true;
	}
	
	$(function()
	{	
		//-- 아이디 체크 시작
		$("#userId").on("input", function()
		{	
			var idRegex = /^[A-Za-z0-9]{4,12}$/;
			var userId = $("#userId").val();
			
			// 입력 값이 변경되면 다시 중복확인 버튼 보이기위해서
			$("#idChkBtn").show();
			
			// 잘못된 형식일 때
			if(!idRegex.test(userId)){
				 $("#checkId").text("4~20 글자 사이 영문, 숫자만 입력 가능합니다.").css("color", "red");
				 idFlag = false;
			}
			
			// 올바른 형식일 때
			else 
			{
				$("#checkId").text("유효한 아이디 형식입니다. 중복 체크를 해주세요.").css("color", "green");
				
				$("#idChkBtn").click(function() // 올바른 형식일 때 클릭해야 작동
				{
	   				$.ajax(
	   				{
	   					url: "checkSignup.action"
	   				  , type: "POST"
	   				  , data: {"userId": $('#userId').val()}
	   				  , success : function(data)
	   				    {
	   					  if (data=="YES") // 중복이 아닌 경우 = submit 가능
	   					  {
	   						  $("#idChkBtn").hide();
	   						  $("#userId").css("border-color", "green");
	   						$("#checkId").text("사용 가능한 아이디입니다.").css("color", "green");
	   						  idFlag = true;
	   					  }
	   					  else if(data=="NO")
	   					  {
	   						  $("#checkId").text("이미 사용중인 아이디입니다.").css("color", "red");
	   						  $("#userId").focus();
	   						  idFlag = false;
	   					  }
	   					},
	   					error : function(request,status,error)
	   					{
	   				        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
	   				    }
	   				});//-- ajax 끝(클릭은 안하면 idFlag는 false인 상태)
	
				});//-- 아이디 중복 체크 끝
				
			}//-- else 끝
			
	
		});//-- id 체크 끝
		
		
		//-- 이메일 체크 시작
		$("#userMail").on("input", function()
		{
			var mailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if(mailRegex.test($("#userMail").val())){
				 $("#checkMail").text("ㅈㅇㅇ");
			}
			else{
				 $("#checkMail").text("틀렸음").css("color", "red");
				 mailFlag = false;
			}
	
		});
		
		//-- 비밀번호 일치 확인
		$("#userPw2").blur(function()
		{
			
			if($('#userPw').val() != $('#userPw2').val())
			{
				$("#checkPw").text("비밀번호가 일치하지 않습니다.").css("color", "red");
			    
				$('#userPw2').val('');
				$('#userPw2').css("border-color", "red");
				
				pwFlag = false;
			}
			else if($('#userPw').val() == $('#userPw2').val())
			{
				$("#checkPw").text("비밀번호가 일치합니다.").css("color", "green");
				$('#userPw2').css("border-color", "green");
				pwFlag = true;
			}
			
		 }); //-- 비밀번호 체크 끝
		
	});
</script>
</head>
<body>

	<div class="card">

		<!-- 상단 로고 이미지 -->
		<div class="formContent">
			<img onclick="location.href='main.action'" src="images/logo_typo.svg" style="cursor:pointer;">
		</div>

		
		<!-- 입력 폼 -->
		<form id="form" action="completesignup.action" class="container userSignUpForm" method="post" onsubmit="return checkForm()">
			<div id="content">
			
				<!-- 아이디/닉네임/이름/비밀번호 입력 및 확인 -->
				 <div class="form-group">
				    <h3 class="joinTitle">아이디</h3>
				    <input type="text" class="form-control" id="userId" name="user_Id" placeholder="아이디를 입력하세요" required="required">
				    <button class="btn chkBtn" id="idChkBtn" name="unCheck">중복확인</button>
				    <span id="checkId"></span>
				 </div>
				 
				 <div class="joinInputBox">
					<h3 class="joinTitle">이름</h3>
					<input type="text" id="userNm" name="user_Nm" maxlength="20" required="required">
				</div>

				<!-- 전화번호 입력 -->
				<div class="joinInputBox">
					<h3 class="joinTitle">
						<label for="id">전화번호('-' 없이 번호만 입력해주세요.)</label>
					</h3>
					<input type="text" id="userTel" name="user_Tel" maxlength="11" required="required"> 
				</div>
  
				<div class="joinInputBox">
					<h3 class="joinTitle">비밀번호</h3>
					<input type="password" id="userPw" name="user_Pw" maxlength="20" required="required">
				</div>

				<div class="joinInputBox">
					<h3 class="joinTitle">비밀번호 확인</h3>
					<input type="password" id="userPw2" name="user_Pw2" maxlength="20" required="required">
					<span id="checkPw"></span>
				</div>
				
				<div class="joinInputBox">
					<h3 class="joinTitle">닉네임</h3>
					<input type="text" id="userNick" name="user_Nick" maxlength="20" required="required">
				</div>

				<!-- 이메일 입력 및 인증 -->
				<div class="emailInput">
					<h3 class="joinTitle">이메일</h3>
					<input type="text" id="userMail" class="emailInputBox" name="user_Mail">
					<span id="checkMail"></span>
					<button class="btn">인증번호 받기</button>
				</div>

				<div class="emailCheck">
					<input type="text" id="emailCheck" class="emailInputBox"
						maxlength="20" placeholder="인증번호 4자리 입력">
					<button class="btn" id="emailCheck2">확인</button>
				</div>
				
				<div class="checkbox">
				  <label>
				    <input type="checkbox" name="chk" id="chk">
				    이용약관, 개인정보 수집 및 이용에 모두 동의합니다.
				  </label>
				</div>
				
				<div>
					<input id="signUpBtn" type="submit" class="btn" value="가입하기">
					<input id="cancelBtn" type="button" class="btn" value="취소하기">
				</div>
				<br>
				<hr>
				<br>
			</div>
			
		</form>
	
	</div>

</body>
</html>