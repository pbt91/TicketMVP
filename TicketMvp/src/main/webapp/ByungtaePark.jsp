<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% session.setAttribute("matchId", 1); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>메인 페이지</title>
    <meta charset="utf-8">
    <!-- jquery코드 호출 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<a href="/TicketMvp/reserve/ReserveChoose.do?matchid=${sessionScope.matchId}">Reserve Choose Seat</a><br/>
<a href="/TicketMvp/adminMain.jsp">관리자</a> <br/>
<a href="/TicketMvp/seoungik.jsp">마이페이지</a><br/>
<a href="/TicketMvp/yubin.jsp">메인페이지</a><br/>
<a href="/TicketMvp/athlete/athlete_matches.do">모든경기</a><br/>
<c:if test="${sessionScope.userid != null}">

${sessionScope.name}님 환영합니다 

<a href='user/logout.do'><input type="button" id='move_logout' name='move_logout' value='로그아웃'/></a>

</c:if>

<c:if test="${sessionScope.userid == null}">


로그인을 해주세요 <a href='user/userLoginForm.do'><input type="button" id='move_login' name='move_login' value='로그인'/></a>

</c:if>

<strong>반갑습니다</strong>
</body>
</html>