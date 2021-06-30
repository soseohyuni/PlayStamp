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
<link href="<%=cp%>/css/usersignup.css" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		// 입력 실시간 폼 체크
		
		
		
		$('#userId').keyup(function(){
			
		});
		
		
		//-- 아이디 중복체크(아직 영문, 특수문자 검사 x)
		$("#idChkBtn").click(function()
		{
				var userId = $("#userId").val();
		
				$.ajax(
				{
					url: "checkSignup.action"
				  , type: "POST"
				  , data: {"userId": $('#userId').val()}
				  , success : function(data)
				    {
					  if (data=="YES")
					  {
						  $("#idChkBtn").hide();
						  $("#okId").css("display", "inline-block");
					  }
					  else if(data=="NO")
					  {
						  alert("이미 사용중인 아이디입니다.");
						  $("#userId").focus();
						  $("#userId").css("border-color", "red");
					  }
					},
					error : function(request,status,error)
					{
				        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				    }
				});
				
		
				//-- 비밀번호 일치 확인
				$("#userPw2").blur(function()
				{
					if($('#userPw').val() != $('#userPw2').val())
					{
						if($('#userPw2').val()!='')
						{
						    alert("비밀번호가 일치하지 않습니다.");
						    
							$('#userPw2').val('');
							$('#userPw2').focus();
							$('#userPw2').css("border-color", "red");
					    }
					}
				 }); //-- 비밀번호 확인 끝	   

		});//-- 아이디 중복 체크 끝
		
	});
	
	
	/*
	function formCheck()
	{
		
		//alert(queryString);
		
		$.ajax(
		{
		    url: "checkSignup.action"
		  , data : $("#form").serialize()
		  , type: "POST"
		  , async:false
	      , data: dataEncode
	      , dataType : 'json'
	      , success: function(obj){
				alesr("bb");
		   },
		   error: function()
		   {
				alert('### 통신 에러 ###');
		   });
		}); 

		// 회원가입 처리
		var form = $("#form")[0];        
        var formData = new FormData($("#form"));
        
        //alert(formData);  -- Object
        alert(formData.has('#userId'));
        
		$.ajax(
		{
			cache : false
		  , url: "checkSignup.action"
		  , data : formData
		  , type: "POST"
		  , processData: false
	      , contentType: false
	      , success: function(obj){
				if(obj == 'OK')
				{
					alert('회원가입 성공!');
				} else {
					alert('*** 회원가입 실패 ***');
				}
		   },
		   error: function()
		   {
				alert('### 통신 에러 ###');
		   }
		)}; 
	}*/
	
	
	
</script>
</head>
<body>

	<div class="card">

		<!-- 상단 로고 이미지 -->
		<div class="formContent">
			<img onclick="location.href='main.action'" src="images/logo_typo.svg" style="cursor:pointer;">
		</div>

		
		<!-- 입력 폼 -->
		<form id="form" action="completeSignup.action" class="container userSignUpForm" method="post">
			<div id="content">
				<!-- 아이디/닉네임/이름/비밀번호 입력 및 확인 -->
				<div class="joinInputBox">
					<h3 class="joinTitle">아이디</h3>
					<input type="text" id="userId" name="userId" class="chkInput" maxlength="20" required="required">
					<button class="btn chkBtn" id="idChkBtn" name="unCheck">중복확인</button>
					<img id="okId" alt="ok" src="images/yes.png" style="height: 40px; display:none;">
				</div>

				<div class="joinInputBox">
					<h3 class="joinTitle">닉네임</h3>
					<input type="text" id="userNick" name="userNick" maxlength="20" required="required">
				</div>

				<div class="joinInputBox">
					<h3 class="joinTitle">비밀번호</h3>
					<input type="text" id="userPw" name="userPw" maxlength="20" required="required">
				</div>

				<div class="joinInputBox">
					<h3 class="joinTitle">비밀번호 확인</h3>
					<input type="text" id="userPw2" name="userPw2" maxlength="20" required="required">
				</div>

				<div class="joinInputBox">
					<h3 class="joinTitle">이름</h3>
					<input type="text" id="userNm" name="userNm" maxlength="20" required="required">
				</div>

				<!-- 전화번호 입력 -->
				<div class="joinInputBox">
					<h3 class="joinTitle">
						<label for="id">전화번호</label>
					</h3>
					<input type="text" id="userTel" name="userTel" maxlength="3" required="required"> 
				</div>

				<!-- 이메일 입력 및 인증 -->
				<div class="emailInput">
					<h3 class="joinTitle">이메일</h3>
					<input type="text" id="userMail" class="emailInputBox" name="userMail" maxlength="20">
					<button class="btn">인증번호 받기</button>
				</div>

				<div class="emailCheck">
					<input type="text" id="emailCheck" class="emailInputBox"
						maxlength="20" placeholder="인증번호 4자리 입력">
					<button class="btn" id="emailCheck2">확인</button>
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
		
		<!-- 
		<div id="termsAgree">
			<form action="" id="joinForm">
				<ul class="termsBox">
					<li class="checkBox check01">
						<ul class="clearfix">
							<li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두 동의합니다.</li>
							<li class="checkAllBtn"><input type="checkbox" name="chkAll" id="chkAll" class="termsAgreeInput" ></li>
						</ul>
					</li>
					<li class="checkBox check02">
						<ul class="clearfix">
							<li>이용약관 동의(필수)</li>
							<li class="checkBtn"><input type="checkbox" name="chk" class="termsAgreeInput"></li>
						</ul> 
						<textarea name="" id="">여러분을 환영합니다. 네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 
						본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 
						이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 
						이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</textarea>
					</li>
					<li class="checkBox check03">
						<ul class="clearfix">
							<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
							<li class="checkBtn"><input type="checkbox" name="chk" class="termsAgreeInput"></li>
						</ul> 
						<textarea name="" id="">여러분을 환영합니다. 
						네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 
						네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 
						비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
     							</textarea>
					</li>
				</ul>
				<div>
					<button id="signUpBtn" type="submit" class="btn">가입하기</button>
					<button id="cancelBtn" type="button" class="btn">취소하기</button>
				</div>
			</form>
		</div> -->
	</div>

</body>
</html>