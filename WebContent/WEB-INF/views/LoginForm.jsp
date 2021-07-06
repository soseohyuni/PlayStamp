<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
  <%
    String clientId = "QnKLsapQ206kVwnbnwOp";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8090/playstamp/main.jsp", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm.jsp</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<style type="text/css">
  html, div, body,h3{
    margin: 0;
    padding: 0;
  }
  h3{
    display: inline-block;
    padding: 0.6em;
  }
</style>
<link href="<%=cp %>/css/login.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="card">
    <div class="text-center intro"> 
    	<br><img src="images/logo_typo.svg" width="300"><br> 
    </div>
    
    <form action="" method="post">
	    <div class="mt-4 text-center">
	        <h6 style="font-weight: bold;">로그인 하기</h6>
	        <div class="mt-3 inputbox"> 
	        	<input type="text" class="form-control" name="" placeholder="아이디"> <i class="fa fa-user"></i> 
	        </div>
	        <div class="inputbox"> 
	        	<input type="text" class="form-control" name="" placeholder="패스워드"> <i class="fa fa-lock"></i> 
	        </div>
	    </div>
	    <div class="d-flex justify-content-between">
	        <div class="form-check"> <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"> <label class="form-check-label" for="flexCheckDefault"> 관리자 </label> </div>
	    </div>
	    <div class="mt-2"> 
	    	<button class="btn btn-primary btn-block" id="login">로그인</button>
	    </div>
	    
		<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
		<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
		<div id="naver_id_login" style="text-align:center"><a href="${url}">
		<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
	    <%-- 
	    <div class="mt-2"> 
	  		<a href="<%=apiURL%>"><button class="btn btn-primary btn-block" id="naverLogin">
	    		<img src="images/naverIcon.png" alt="Icon naver" id="naverImg">네이버로 로그인
	    	</button> </a>
	    </div>
	     --%>
	    <!-- 
	    	<button class="btn btn-primary btn-block" id="naverLogin">
	    		<img src="images/naverIcon.png" alt="Icon naver" id="naverImg">네이버로 로그인
	    	</button> 
	     -->	
	    <div class="mt-2"> 
	    	<button class="btn btn-primary btn-block" id="kakaoLogin">
	    		<img src="images/kakaoIcon.png" alt="Icon kakao" id="kakaoImg">카카오로 로그인
	    	</button> 
	    </div><br>
	</form>
	<div class="findInfo">
		<a target="_blank" id="idinquiry" href="" style="color: black; text-align: center;">아이디 찾기</a> │
		<a target="_blank" id="pwinquiry" href=""style="color: black; text-align: center;">비밀번호 찾기</a> │
		<a target="_blank" id="join" href=""style="color: black; text-align: center;">회원가입</a>
	</div>
</div>

<div>
	<input type="hidden" id="id_error_msg" name="id_error_msg" value="아이디를 입력해주세요.">
	<input type="hidden" id="pw_error_msg" name="pw_error_msg" value="비밀번호를 입력해주세요.">	
</div>

</body>
</html>