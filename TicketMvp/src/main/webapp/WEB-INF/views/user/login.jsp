<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/TicketMvp/resources/css/login-page.css">
<!-- <script defer src="/TicketMvp/resources/js/login.js"></script> -->
</head>
<body>
	<main id="main-holder">

		<div align="center">
			<h5>Ticket MVP</h5>		<!-- 나중에 메인페이지로 돌아가는 링크 걸기 -->
			<h1 id="login-header">Login</h1>
		</div>


		<div id="login-error-msg-holder">
			<p id="login-error-msg">
				아이디를 확인해주세요 <span id="error-msg-second-line"> 비밀번호를 확인해주세요</span>
			</p>
		</div>

<!-- 		<form id="login-form">
			<input type="text" name="username" id="username-field" class="login-form-field" placeholder="아이디"> 
			<input type="password" name="password" id="password-field" class="login-form-field" placeholder="비밀번호">
			<input type="submit" value="Login" id="login-form-submit">
		</form> -->
		
		<form id="login-form" method="post" action="login.do">
			<table>
				<tr>
					<td>
						<input type="text" name="username" id="username-field" class="login-form-field" placeholder="아이디"> 
					</td>
					<td rowspan="2"><input type="submit" value="Login" id="login-form-submit" style="width:100px;height:40px;font-size:15px;" ></td>
				</tr>
				<tr>
					<td>
						<input type="password" name="password" id="password-field" class="login-form-field" placeholder="비밀번호">
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<a href="find_id.do" name="find_id" id='find_id' class="find" >아이디찾기</a>
						|<!-- 그냥 구분선 -->
						<a href="find_pw.do" name="find_pw" id='find_pw' class="find" >비밀번호찾기</a>
					</td>
				</tr>
			</table>
		</form>

	</main>
</body>
</html>