<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
</head>
<body>

	<header class="top-header">
		<c:if test="${sessionScope.name != null }">
			<div class="smallrogo"><a href="/TicketMvp/athlete/main_page.do"><img alt="smallrogo" src="/TicketMvp/resources/images/main/smallrogo.png"></a> </div>
			<div class="header-links">
				${sessionScope.name}님 환영합니다 <a href="/TicketMvp/user/logout.do" class="logout-link">로그아웃</a> 
			</div>
		</c:if>
		<c:if test="${sessionScope.name == null }">
			<div class="smallrogo"><a href="/TicketMvp/athlete/main_page.do"><img alt="smallrogo" src="/TicketMvp/resources/images/main/smallrogo.png"></a> </div>
			<div class="header-links">
				<a href="/TicketMvp/user/userLoginForm.do" class="login-link">로그인</a>
				 <a href="/TicketMvp/user/userInsertUserForm.do" class="signup-link">회원가입</a>
			</div>
		</c:if>
	</header>
	<header class="logo-banner-header">
		<div class="logo">
			<img alt="" src="/TicketMvp/resources/images/main/rogo_new.png" >
			<div id="slogan1">축구를 사랑하는 당신에게</div>
			<div id="slogan2">세상에 없던 티켓예매</div>
			<!-- <img id="fball" alt="football" src="/TicketMvp/resources/images/main/fball.png"> -->
		</div>		
	</header>


</body>
</html>