<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 헤더</title>
<link rel="stylesheet" type="text/css" href="/TicketMvp/resources/css/main/main.css">
</head>
<body>

	<header class="login-header">
		<div class="top-header">
		
		<c:if test="${sessionScope.name != null }">
			<div class="header-links">
				${sessionScope.name}님 환영합니다 <a href="logout.do" class="logout-link">로그아웃</a> 
			</div>
		</c:if>
		<c:if test="${sessionScope.name == null }">
			<div class="header-links">
				<a href="/TicketMvp/resources/views/user/userLoginForm.do" class="login-link">로그인</a>
				 <a href="/TicketMvp/resources/views/user/userInsertUserForm.do" class="signup-link">회원가입</a>
			</div>
		</c:if>
		</div>
	</header>
	<header class="logo-banner-header">
		<div class="logo">
			<img alt="" src="/TicketMvp/resources/images/main/rogo_new.png" >	
		</div>
<!-- 			<img src="/TicketMvp/resources/images/main/rogo.png" alt="쇼핑몰 로고"
				width="300" style="margin-left: 200px;">
		</div>
		<div class="banner">
			<img src="/TicketMvp/resources/images/main/baner.png" alt="배너 이미지"
				width="800"> -->
		
	</header>


</body>
</html>