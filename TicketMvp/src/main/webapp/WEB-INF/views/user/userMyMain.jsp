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

<!-- jquery 코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- css 파일 연결 - main -->
<link rel="stylesheet"  href="/TicketMvp/resources/css/user/userMyMain.css">
<link rel="stylesheet"	href="/TicketMvp/resources/css/main/templates.css">


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


				<div align="center">
					<div>
						<p style="font-size: 50px; color:#DBE0CD;">My Page</p>
					</div>
					<div>
						<div>
						<a href='/TicketMvp/user/userMyModify.do'><img alt="회원정보수정"
							src="/TicketMvp/resources/images/user/editprofile.png"> </a> <a
							href='/TicketMvp/user/userMyOrderList.do'><img alt="주문내역"
							src="/TicketMvp/resources/images/user/orderhistory.png"> </a> <a
							href='/TicketMvp/user/userMyLike.do'><img alt="찜목록"
							src="/TicketMvp/resources/images/user/likelist.png"> </a> 
						</div>
						<div>
						<a href='/TicketMvp/user/userMyCoupon.do'><img alt="내쿠폰"
							src="/TicketMvp/resources/images/user/coupon.png"> </a> <a
							href='/TicketMvp/user/userMyInquiry.do'><img alt="Q&A"
							src="/TicketMvp/resources/images/user/qna.png"> </a>
						</div>
					</div>
				</div>



			</c:if>
			<c:if test="${sessionScope.userid == null}">
				<br/><br/><br/><br/>
				<div id="login-box">
					<p>로그인이 필요합니다</p>
					<a href='/TicketMvp/user/userLoginForm.do'> <input
						type="button" id='move_login' name='move_login' value='로그인' />
					</a>
				</div>
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