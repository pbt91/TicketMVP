<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- EL태그 사용 라이브러리 -->
<!DOCTYPE html>
<html lang="en">
<head>
  <title>메인 페이지</title>
  <meta charset="utf-8">
</head>
<body>
<a href="/TicketMvp/reserve/ReserveChoose.do?matchid=1">reserve choose seat</a> <br/>
<a href="/TicketMvp/billing/billingFail.do">토스 실패시</a> <br/>
<c:if test="${sessionScope.userid != null}">
	${sessionScope.name}님 환영합니다 <br/>
	<c:forEach var="entry" items="${sessionScope}">
	      <li>${entry.key}: ${entry.value}</li>
	</c:forEach>
	<a href='user/logout.do'><input type="button" id='move_logout' name='move_logout' value='로그아웃'/></a>
</c:if>

<c:if test="${sessionScope.userid == null}">


로그인을 해주세요 <a href='user/userLoginForm.do'><input type="button" id='move_login' name='move_login' value='로그인'/></a>

</c:if>

<strong>반갑습니다</strong>
</body>
</html>