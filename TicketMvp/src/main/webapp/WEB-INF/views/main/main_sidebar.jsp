<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>사이드바</title>
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
	<!-- js코드 호출 -->
	<script src="/TicketMvp/resources/js/main_sidebar.js"></script>
</head>
<body>
	<div>
	<section class="main-content">
		<aside class="sidebar">
			<ul class="menu">
				<li><a href="/TicketMvp/athlete/athlete_matches.do">모든경기</a></li>
				<li><a href="/TicketMvp/athlete/main_page.do">선수소개</a></li>
				<li><a href="/TicketMvp/user/userMyInquiry.do">문의하기</a></li>
				<li><a href="/TicketMvp/user/userMyMain.do">마이페이지</a></li>
				<!-- 추가 메뉴 아이템 -->
			</ul>
		</aside>
	</section>
	</div>
</body>
</html>