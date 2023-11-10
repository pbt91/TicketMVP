<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">

<title>내 쿠폰</title>

<meta charset="UTF-8">

<!-- js 코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- css 파일 연결 - main -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/main/templates.css">
<!-- css 파일 연결 - page -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/user/userMyCoupon.css">
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
		<div>
			<h2>내 쿠폰</h2>
		</div>
		<strong style="font-size:17px;">쿠폰등록</strong>
		<form action="/TicketMvp/user/userMyCouponInsert.do">
			<div style="padding-bottom:10px;">
			<input id='in1' name="in1" maxlength='4' pattern="[0-9]+">-<input id='in2' name="in2" maxlength='4' pattern="[0-9]+">-
			<input id='in3' name="in3" maxlength='4' pattern="[0-9]+">-<input id='in4' name="in4" maxlength='4' pattern="[0-9]+">
			<input type="submit" value="등록" >
			</div>
		</form>
		<strong style="font-size:17px;">보유쿠폰</strong>
			<table>
				<thead>
					<tr>
						<th>쿠폰명칭</th>
						<th>할인율</th>
						<th>발행일</th>
						<th>유통기한</th>
						<th>사용여부</th>

					</tr>
				</thead>
				<tbody>
				<c:forEach var="coupon" items="${couponList}">
					<tr>
						<td>${coupon.couponname}</td>
						<td>${coupon.discount}</td>
						<td>${coupon.issuedate}</td>
						<td>${coupon.expiredate}</td>
						<c:if test="${coupon.usestatus==false}">
						<td>미사용</td>
						</c:if>
						<c:if test="${coupon.usestatus==true}">
						<td>사용완료</td>
						</c:if>
					</tr>
				</c:forEach>	
				</tbody>
			</table>


		</div>
		<!-- end of div#content -->
	</div>
	<!-- end of div#container-->


	<div id="footer">
		<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
	</div>




</body>
</html>