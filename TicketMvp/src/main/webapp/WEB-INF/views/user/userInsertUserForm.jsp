<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	type="text/javascript"></script>
<script src='/TicketMvp/resources/js/user/userInsertUserForm.js'
	type="text/javascript"></script>
<link rel="stylesheet"
	href="/TicketMvp/resources/css/user/userInsertUserPage.css">
</head>
<body>

	<main id="main-holder">
		<h2>회원가입</h2>

		<form method="post" action="insertUser.do" name="userinput"
			id="userinput">
			<table class='tbuserinput' align="center" id='tbuserinput'>
				<tr>
					<td class="normalbold tb_ttl">
						<div align="center">아이디</div>
					</td>
					<td colspan="3" class="normal"><input type="text"
						name="userid" id="userid" class='userinput' size="20"
						placeholder="5~12글자">
					</td>
					<td>
						<button type='button' id='idCheck' class='btuserinput'>중복확인</button>
					</td>
				</tr>
				<tr>
					<td></td>
					<td colspan='2'><span id="idCheckResult"
						style="width: 150px; color: red"></span></td>
				</tr>
				<tr>
					<td class="normalbold tb_ttl">
						<div align="center">비밀번호</div>
					</td>
					<td width="154" class="normal"><input type="password"
						name="userpw" id="userpw" class='userinput'
						placeholder="8글자 이상 특수문자포함"></td>
					<td><span id="pwcheckResult" style="width: 150px"></span></td>
				</tr>
				<tr>
					<td class="normalbold tb_ttl">
						<div align="center">비밀번호 확인</div>
					</td>
					<td width="160"><input type="password" name="userpwcheck"
						id="userpwcheck" class='userinput'></td>
				</tr>
				<tr>
					<td class="normalbold tb_ttl">
						<div align="center">이름</div>
					</td>
					<td colspan="3" height="23" class="normal"><input type="text"
						name="name" id="name" class='userinput' placeholder="필수입력">
					</td>
				</tr>
				<tr>
					<td class='normalbold tb_ttl'>
						<div align="center">이메일</div>
					</td>
					<td colspan="3" height="23" class="normal"><input type="email"
						name="email" id="email" class='userinput' placeholder="필수입력">
					</td>
				</tr>
				<tr>
					<td class='normalbold tb_ttl'>
						<div align="center">연락처</div>
					</td>
					<td colspan="3" height="23" class="normal"><input type="tel"
						name="phone" id="phone" class='userinput' pattern="[0-9]+" placeholder="-를 제외하고 입력해주세요">
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
				</tr>
				<tr>				
					<td align='center' colspan='5' >
						<a href='userLoginStatus.do'><input type="button" name="reset" value="첫페이지로 이동"	class='btuserinput'></a>
						<input type="reset" name="reset" value="리   셋" class='btuserinput'>
						<input type="submit" name="join" id="join" value="등   록" class='btuserinput'>
					</td>
				
				</tr>
			</table>

		</form>
		<div>

			
		</div>

	</main>



</body>
</html>