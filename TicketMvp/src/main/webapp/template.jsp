<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인화면</title>
	<!-- 필수, 헤더에 넣기 -->
	<link rel="stylesheet" type="text/css" href="/TicketMvp/resources/css/main/templates.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div id="body-wrapper">
	<div id="body-content">
		<div id="header">
			<jsp:include page="/WEB-INF/views/main/main_header.jsp" />
		</div>

		<div id="container">
			<div id="sidebar">
				<!-- 여기 사이드바 -->
			</div>

			<div id="content">
				<!-- 여기내용 -->
			</div>
		</div>

		<div id="footer">
			<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
		</div>
	</div>
</div>
</body>
</html>
