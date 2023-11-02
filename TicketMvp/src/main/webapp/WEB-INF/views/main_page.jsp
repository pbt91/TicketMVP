<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인화면</title>
<link rel="stylesheet" type="text/css" href="../resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='../resources/js/main.js' type="text/javascript"></script>

</head>
<body id="page-top">

	<header class='header_menu'>
		<div class="header_util">
			<div class="header_util_inner">
				<div class="header_util_right">
					<ul class="header_util_list">
						<li class="header_util_item"><a href="j#" id="loginBtn"
							class="header_util_link" style="display: block;">로그인</a></li>
						<li class="header_util_item"><a href="#" id="joinBtn"
							class="header_ut il_link" style="display: block;">회원가입</a> <a
							href="#" id="LogoutBtn" class="header_util_link"
							style="display: none;">로그아웃</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>

	<header class="header_inner">
		<div class="logo">
			<img src="../resources/images/member_images/rogo.png" alt=""
				width="350" height="200">
		</div>
		<div class="baner"></div>
	</header>


	<main>


		<div id="main">

			<ul
				class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
				id="accordionSidebar">

				<li id="ticket_reserved"><a href="#"> 티켓예약 </a></li>

				<!-- Divider -->
				<hr class="sidebar-divider">

				<!-- Heading -->
				<div class="sidebar-heading">Interface</div>

				<li id="member_introduction"><a href="#"> 선수소개 </a></li>

				<!-- Nav Item - Utilities Collapse Menu -->

				<li id=""><a href="#"> 문의하기 </a></li>

				<!-- Divider -->
				<hr class="sidebar-divider">

				<!-- Heading -->
				<div class="sidebar-heading">Addons</div>


				<li id="my_page"><a href="#"> 마이페이지 </a></li>
				
				

			</ul>

			<!-- <div class="menu-container">
				<ul class="menu">
					<li id="ticket_reserved"><a href="#"> 티켓예약 </a></li>
					<li id="member_introduction"><a href="#"> 선수소개 </a></li>
					<li id=""><a href="#"> 문의하기 </a></li>
					<li id="my_page"><a href="#"> 마이페이지 </a></li>
				</ul>
			</div> -->

			<div id="image-grid" class="image-grid">

				<c:forEach var="imagePath" items="${imagePaths}" varStatus="loop">
					<div class="image-item ${loop.index % 4 < 2 ? 'even' : 'odd'}">
						<img src="${pageContext.request.contextPath}/${imagePath}"
							alt="선수 이미지" />
					</div>
				</c:forEach>

			</div>

		</div>

	</main>
	<footer class="footer">
		<div class="footer_inner">
			<div class="footer_links">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><a href="#">개인정보 처리방침</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>
			<div class="footer_logo">
				<a href="#" class="logo_black">Ticket MVP</a>
			</div>
		</div>
	</footer>

</body>
</html>