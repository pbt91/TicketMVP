<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- EL태그 사용 라이브러리 -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>

<c:if test="${sessionScope.userid != null}">
<p>마이페이지</p>

<a href='/TicketMvp/user/userMyModify.do'>회원정보 수정</a>
<a href='/TicketMvp/user/'>주문내역</a>
<a href='/TicketMvp/user/'>찜목록</a>
<a href='/TicketMvp/user/'>내쿠폰</a>
<a href='/TicketMvp/user/'>Q&A</a>

</c:if>
<c:if test="${sessionScope.userid == null}">

<a href='/TicketMvp/user/userLoginStatus'>Q&A</a>

</c:if>


</body>
</html>