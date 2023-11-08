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
			<table>
				<thead>
					<tr>
						<th>쿠폰 명칭</th>
						<th>할인율</th>
						<th>발행일</th>
						<th>유통기한</th>
						<th>사용하기</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td>James</td>
						<td>Matman</td>
						<td>(713) 123-8965</td>
						<td><a href="mailto:jmatman@stewart.com">jmatman@stewart.com</a></td>
						<td>01/13/1979</td>
					</tr>
					
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