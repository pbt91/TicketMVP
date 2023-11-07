<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="/TicketMvp/resources/css/main/main.css"> -->
<style type="text/css">
body {
	width:100%;
	higth:100%;
}	

aside {
	width:200px;
	higth:800px;

}
</style>
	<!-- jquery코드 호출 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- js코드 호출 -->
	<script src="/TicketMvp/resources/js/main_sidebar.js"></script>
</head>
<body>
	<div>
	<section class="main-content">
		<aside class="sidebar">
			<ul class="menu">
				<li><a href="/TicketMvp/reserve/ReserveChoose.do?matchid=1">티켓예약</a></li>
				<li><a href="#">선수소개</a></li>
				<li><a href="#">문의하기</a></li>
				<li><a href="#">마이페이지</a></li>
				<!-- 추가 메뉴 아이템 -->
			</ul>
		</aside>
	</section>
	</div>
</body>
</html>