<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">

<title>비밀번호 찾기</title>

<meta charset="UTF-8">

<!-- js 코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- css 파일 연결 - main -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/main/templates.css">
<!-- css 파일 연결 - page -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/user/userFindPwForm.css">
<!-- js파일 연결 -->
<script src='/TicketMvp/resources/js/user/userFindPwForm.js'
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


			<h2>비밀번호 찾기</h2>

			<div id='all'>
			<form id='findpwfrom' name='findpwfrom' align="center">
				<h3>본인확인 이메일 인증</h3>
				<p>
					회원가입한 아이디과 이메일 주소가 일치해야 <br /> 인증번호를 받을 수 있습니다
				</p>
				<br /> <input type='text' id='userid' name='userid' placeholder='이름'
					style="width: 200px; height: 30px;"> <br /> <input
					type='email' id='email' name='email' placeholder='이메일'
					style="width: 200px; height: 30px;"> <br /> <input
					type='button' id='find_pw' name='find_pw' value='이메일로 인증키 전송'
					style="width: 210px; height: 30px;" /> <br /> <br />
			</form>
			<form id='tempwcheckForm' name='tempwcheckForm' align="center">
				<input type='text' id='temppw' name='temppw' disabled
					placeholder='이메일 인증번호' style="width: 200px; height: 30px;">
				<br /> <input type='button' id='checkTempPw' name='checkTempPw'
					value='확인' style="width: 210px; height: 30px;" /> <br /> <br /> <a
					href='userLoginForm.do'>돌아가기</a>
			</form>
			</div>
		</div>
		<!-- end of div#content -->
	</div>
	<!-- end of div#container-->


	<div id="footer">
		<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
	</div>




</body>
</html>