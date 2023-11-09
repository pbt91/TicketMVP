<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">

<title>비밀번호 재설정</title>

<meta charset="UTF-8">

<!-- js 코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- css 파일 연결 - main -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/main/templates.css">
<!-- css 파일 연결 - page -->
<!-- <link rel="stylesheet" href="/TicketMvp/resources/css/user/.css"> -->
<!-- js파일 연결 -->
<script src="/TicketMvp/resources/js/user/userResetPw.js"
	type="text/javascript"></script>

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


			<h2>비밀번호 재설정</h2>

			<form action='resetPw.do' id='resetPwForm' name='resetPwForm'
				align="center">
				<h3>변경할 비밀번호를 입력해주세요</h3>
				<strong><span id="userid" name="userid" id="userid"
					style="width: 200px; height: 30px; font-size: 30px">${param.userid}</span></strong>
				<br /> <br /> <input type="password" name="userpw" id="userpw"
					placeholder="비밀번호" style="width: 200px; height: 30px;"> <br />
				<input type="password" name="userpwcheck" id="userpwcheck"
					placeholder="비밀번호 확인" style="width: 200px; height: 30px;">
				<br />
				<button type='submit' id='setpw' name='setpw'
					style="width: 210px; height: 30px;">확인</button>
				<br /> <br /> <span id='resetPwResult' name='resetPwResult'
					style="width: 200px; height: 30px; color: red;"></span> <br /> <a
					href="/TicketMvp/user/userLoginForm.do"><input type='button'
					id='move_login' name='move_login' value='로그인'
					style="width: 200px; height: 30px;" /></a>
			</form>


		</div>
		<!-- end of div#content -->
	</div>
	<!-- end of div#container-->


	<div id="footer">
		<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
	</div>




</body>
</html>