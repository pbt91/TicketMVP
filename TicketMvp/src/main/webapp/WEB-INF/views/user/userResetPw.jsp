<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script src="/TicketMvp/resources/js/user/userResetPw.js" type="text/javascript"></script>
</head>
<body>
<h2>비밀번호 재설정</h2>
	
	<form action='resetPw.do' id='resetPwForm' name='resetPwForm' align="center">
		<h3>변경할 비밀번호를 입력해주세요</h3>
		<strong><span id="userid" name="userid" id="userid" style="width:200px;height:30px;font-size:30px">${param.userid}</span></strong>
		<br/>
		<br/>
		<input type="password" name="userpw" id="userpw" placeholder="비밀번호" style="width:200px;height:30px;">
		<br/>
		<input type="password" name="userpwcheck" id="userpwcheck" placeholder="비밀번호 확인" style="width:200px;height:30px;">
		<br/>
		<button type='submit' id='setpw' name='setpw' style="width:210px;height:30px;">확인</button>
		<br/>
		<br/>
		<span id='resetPwResult' name='resetPwResult' style="width:200px;height:30px;color:red;"></span>
		<br/>
		<a href="/TicketMvp/user/userLoginForm.do"><input type='button' id='move_login' name='move_login' value='로그인' style="width:200px;height:30px;"/></a>
	</form>


</body>
</html>