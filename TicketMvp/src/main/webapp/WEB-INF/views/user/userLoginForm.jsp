<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/TicketMvp/resources/css/user/userLoginPage.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<!-- <script src="/TicketMvp/resources/js/user/userLoginForm.js"></script> -->


</head>
<body>
	<main id="main-holder">

		<div align="center">
			<a href="/TicketMvp/user/userLoginStatus.do">
				<img alt="메인 로고"  style="max-width:100%; height:auto; padding-left:30px;"
				src="/TicketMvp/resources/images/main/main_rogo.png">
			</a>
			<h1 id="login-header">Login</h1>
		</div>

		<div id="login-error-msg-holder">
			<p id="login-error-msg">아이디 또는 비밀번호를 확인해주세요</p>
		</div>

		<!-- 1. 로그인 정보가 맞는지 확인 하기위해 controller로 보내서 확인함. -->
		<form id="login-form" name='login_info' method="post" action="/TicketMvp/user/loginCheck.do">
			<table>
				<tr>
					<td><input type="text" name="userid" id="userid"
						class="login-form-field" placeholder="아이디"></td>
					<td rowspan="2"><input type="submit" value="Login"
						id="login-form-submit"
						style="width: 100px; height: 40px; font-size: 15px;"></td>
				</tr>
				<tr>
					<td><input type="password" name="userpw" id="userpw"
						class="login-form-field" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><a href="/TicketMvp/user/userFindIdForm.do"
						name="find_id" id='find_id' class="find">아이디찾기</a> |<!-- 그냥 구분선 -->
						<a href="/TicketMvp/user/userFindPwForm.do" name="find_pw" id='find_pw'
						class="find">비밀번호찾기</a> |<!-- 그냥 구분선 --> <a
						href="/TicketMvp/user/userInsertUserForm.do" name="sign_in" id='sign_in'
						class="find">회원가입</a></td>
				</tr>
			</table>
		</form>

	</main>
</body>
</html>