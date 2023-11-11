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
			<div class="header-links">
				${sessionScope.name}님 환영합니다 <a href="logout.do" class="logout-link">로그아웃</a> 
			</div>
		</c:if>
		<c:if test="${sessionScope.name == null }">
			<div class="header-links">
				<a href="/TicketMvp/user/userLoginForm.do" class="login-link">로그인</a>
				 <a href="/TicketMvp/user/userInsertUserForm.do" class="signup-link">회원가입</a>
			</div>
		</c:if>
	</header>
	<header class="logo-banner-header">
		<div class="logo">
			<img alt="" src="/TicketMvp/resources/images/main/rogo_new.png" >	
		</div>		
	</header>


</body>
</html>