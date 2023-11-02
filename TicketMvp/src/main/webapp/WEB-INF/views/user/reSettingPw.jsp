<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
</head>
<body>

<h2>비밀번호 재설정</h2>
	
	<form id='resettingpw' name='resettingpw' align="center">
		<h3>변경할 비밀번호를 입력해주세요</h3>
		<p>회원가입한 이메일 주소를 입력해 주세요</p> 
		<input type="password" name="userpw" id="userpw" placeholder="비밀번호" style="width:200px;height:30px;">
		<br/>
		<input type="password" name="userpw" id="userpw" placeholder="비밀번호 확인" style="width:200px;height:30px;">
		<button type='button' id='find_id' name='find_id' style="width:210px;height:30px;">확인</button>
		<br/>
		<br/>
		<span id='findIdResult' name='findIdResult' style="width:200px;height:30px;">확인된 아이디가 표시됩니다</span>
		<br/>
		<br/>
		<a href="/TicketMvp/user/findPwForm.do"><input type='button' id='move_findpw' name='move_findpw' value='비밀번호 찾기' style="width:102px;height:30px;"/></a>
		<a href="/TicketMvp/user/loginForm.do"><input type='button' id='move_login' name='move_login' value='로그인' style="width:102px;height:30px;"/></a>
	</form>


</body>
</html>