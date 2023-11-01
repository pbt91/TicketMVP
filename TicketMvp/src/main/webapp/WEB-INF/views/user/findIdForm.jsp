<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script src='/TicketMvp/resources/js/user/loginFind.js' type="text/javascript"></script>

</head>
<body>

	<h2>아이디 찾기</h2>
	
	<form action="findId.do" id='findidfrom' name='findidfrom' align="center">
		<h3>이메일로 찾기</h3>
		<p>회원가입한 이메일 주소를 입력해 주세요</p> 
		<input type='email' id='email' name='email' placeholder='이메일' style="width:200px;height:30px;">
		<br/>
		<input type='submit' id='find_id' name='find_id' value='확인' style="width:210px;height:30px;"/>
		<br/>
		<br/>
	</form>
	<form action="temppwCheck.do" id='tempwcheckForm' name='tempwcheckForm' align="center">
		<!-- 아이디 표시해줄거 인풋 말고 뭐쓸까 -->
		<span id='findIdResult' name='findIdResult' style="width:200px;height:30px;">확인된 아이디가 표시됩니다</span>
		<br/>
		<br/>
		<input type='button' id='move_findpw' name='move_findpw' value='비밀번호 찾기' style="width:102px;height:30px;"/>
		<input type='button' id='move_login' name='move_login' value='로그인' style="width:102px;height:30px;"/>
	</form>
	
	
	

	
	




</body>
</html>