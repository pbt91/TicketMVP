<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- EL태그 사용 라이브러리 -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<c:if test="${sessionScope.userid != null}">
<p>마이페이지</p>

<a href='/TicketMvp/user/userMyModify.do'>회원정보 수정</a>
<a href='/TicketMvp/user/userMyOrderList.do'>주문내역</a>
<a href='/TicketMvp/user/userMyLike.do'>찜목록</a>
<a href='/TicketMvp/user/userMyCoupon.do'>내쿠폰</a>
<a href='/TicketMvp/user/userMyInquiry.do'>Q&A</a>

</c:if>
<c:if test="${sessionScope.userid == null}">
<p>로그아웃되어있는 상태</p>
<a href='/TicketMvp/user/userLoginStatus'>안보여야함</a>

</c:if>


</body>
</html>