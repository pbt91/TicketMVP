<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script src='/TicketMvp/resources/js/user/findPw.js' type="text/javascript"></script>
</head>
<body>


	<h2>비밀번호 찾기</h2>
	
	<form id='findpwfrom' name='findpwfrom' align="center">
		<h3>본인확인 이메일 인증</h3>
		<p>회원가입한 아이디과 이메일 주소가 일치해야 <br/> 인증번호를 받을 수 있습니다</p> 
		<br/>
		<input type='text' id='userid' name='userid' placeholder='이름' style="width:200px;height:30px;">
		<br/>
		<input type='email' id='email' name='email' placeholder='이메일' style="width:200px;height:30px;">
		<br/>
		<input type='button' id='find_pw' name='find_pw' value='이메일로 인증키 전송' style="width:210px;height:30px;"/>
		<br/>
		<br/>
	</form>
	<form id='tempwcheckForm' name='tempwcheckForm' align="center">
		<input type='text' id='temppw' name='temppw' disabled placeholder='이메일 인증번호' style="width:200px;height:30px;">
		<br/>
		<input type='button' id='checkTempPw' name='checkTempPw' value='확인' style="width:210px;height:30px;"/>
		<br/>
		<br/>
		<a href='loginForm.do'>돌아가기</a>
	</form>



</body>
</html>