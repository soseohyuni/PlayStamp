<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="bootstrap/assets/favicon.ico" />

<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
</head>
<body>

<div class="super_container">

<!-- header -->
<header class="header">

	<!-- Top Bar -->
	<div class="top_bar">
		<div class="container">
			<div class="row">
				<div class="col d-flex flex-row">
					<div class="top_bar_content ml-auto">
						<div class="top_bar_user">
							<div class="bar_line">
								<a href="signupform.action">회원가입</a>
							</div>
							<div class="bar_line">
								<a href="signinform.action">로그인</a>
							</div>
							<div>
								<a href="#">고객센터</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Header Main -->
	<div class="header_main">
		<div class="container">
			<div class="row">

				<!-- Logo -->
				<div class="col-lg-2 col-sm-3 col-3 order-1 logo_container">
					<div class="logo_container1">
						<a href=""><img alt="로고" src="<%=cp%>/images/logo_typo.svg"></a>
					</div>
				</div>

				<!-- Main Nav Menu -->
				<div class="col-lg-5 col-sm-3 col-3 order-2">
					<div class="main_nav_menu">
						<ul class="standard_dropdown main_nav_dropdown">
							<li><a href="#">마이스페이스<i class="fas fa-chevron-down"></i></a></li>
							<li><a href="#">공연정보<i class="fas fa-chevron-down"></i></a></li>
							<li><a href="blog.html">좌석정보<i
									class="fas fa-chevron-down"></i></a></li>
							<li><a href="contact.html">티켓 양도<i
									class="fas fa-chevron-down"></i></a></li>
						</ul>
					</div>
				</div>

				<!-- Search -->
				<div
					class="col-lg-4 col-9 order-lg-3 order-3 text-lg-left text-right">
					<div class="header_search">
						<div class="header_search_content">
							<div class="header_search_form_container">
								<form action="#" class="header_search_form clearfix">
									<input type="search" required="required"
										class="header_search_input"
										placeholder="공연을 검색해보세요!">
									<button type="submit" class="header_search_button trans_300"
										value="Submit">
										<img
											src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918770/search.png"
											alt="">
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	</header>
</div>

</body>
</html>

