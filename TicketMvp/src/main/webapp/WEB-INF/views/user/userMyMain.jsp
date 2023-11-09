<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- EL태그 사용 라이브러리 -->

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">

<title>마이페이지</title>

<meta charset="UTF-8">

<!-- js 코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- css 파일 연결 - main -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/main/templates.css">
<!-- css 파일 연결 - page -->
<!-- <link rel="stylesheet" href="/TicketMvp/resources/css/user/.css"> -->
<!-- js파일 연결 -->
<!-- <script src="/TicketMvp/resources/js/user/.js" type="text/javascript"></script> -->

</head>
<body>


	<div id="header">
		<jsp:include page="/WEB-INF/views/main/main_header.jsp" />
	</div>

	<div id="container">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/main/main_sidebar.jsp" />
		</div>
		<div id="content">


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
				<a href='/TicketMvp/user/userLoginStatus.do'>안보여야함</a>

			</c:if>

		</div>
		<!-- end of div#content -->
	</div>
	<!-- end of div#container-->


	<div id="footer">
		<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
	</div>




</body>
</html>