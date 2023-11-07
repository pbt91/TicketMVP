<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>메인 페이지</title>
    <meta charset="utf-8">
    <!-- js코드 호출 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<a href="/TicketMvp/reserve/ReserveChoose.do?matchid=1">Reserve Choose Seat</a><br/>
<a href="/TicketMvp/error/billingFail.do" class="ajaxlink">토스 실패시</a> <br/>
<a href="/TicketMvp/error/NoLogin.do" class="ajaxlink">로그인 실패시</a> <br/>
<c:if test="${sessionScope.userid != null}">

${sessionScope.name}님 환영합니다 

<a href='logout.do'><input type="button" id='move_logout' name='move_logout' value='로그아웃'/></a>

</c:if>

<c:if test="${sessionScope.userid == null}">


로그인을 해주세요 <a href='user/userLoginForm.do'><input type="button" id='move_login' name='move_login' value='로그인'/></a>

</c:if>

<strong>반갑습니다</strong>
</body>
</html>