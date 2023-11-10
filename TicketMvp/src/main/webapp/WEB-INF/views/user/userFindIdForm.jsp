<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">

<title>아이디 찾기</title>

<meta charset="UTF-8">

<!-- js 코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- css 파일 연결 - main -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/main/templates.css">
<!-- js파일 연결 -->
<script src='/TicketMvp/resources/js/user/userFindIdForm.js'
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


			<h2>아이디 찾기</h2>

			<form id='findidfrom' name='findidfrom' align="center">
				<h3>이메일로 찾기</h3>
				<p>회원가입한 이메일 주소를 입력해 주세요</p>
				<input type='email' id='email' name='email' placeholder='이메일'
					style="width: 200px; height: 30px;"> <br />
				<button type='button' id='find_id' name='find_id'
					style="width: 210px; height: 30px;">확인</button>
				<br /> <br /> <span id='findIdResult' name='findIdResult'
					style="width: 200px; height: 30px;">확인된 아이디가 표시됩니다</span> <br /> <br />
				<a href="/TicketMvp/user/userFindPwForm.do"><input type='button'
					id='move_findpw' name='move_findpw' value='비밀번호 찾기'
					style="width: 102px; height: 30px;" /></a> <a
					href="/TicketMvp/user/userLoginForm.do"><input type='button'
					id='move_login' name='move_login' value='로그인'
					style="width: 102px; height: 30px;" /></a>
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