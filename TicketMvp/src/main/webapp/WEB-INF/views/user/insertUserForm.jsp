<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script src='/TicketMvp/resources/js/user/joinCheck.js' type="text/javascript"></script>
</head>
<body>


	<form method="post" action="insertUser.do" name="userinput"	id="userinput" >
		<table class='table2'>
			<tr>
				<td class="normalbold tb_ttl">
					<div align="center">아이디</div>
				</td>
				<td colspan="3" class="normal"><input type="text" name="userid" id="userid" size="20" placeholder="5~12글자">
					<button type='button' id='idCheck' >중복확인</button> <span id="idCheckResult"style="width: 150px; color: red"></span>
				</td>
			</tr>
			<tr>
				<td class="normalbold tb_ttl">
					<div align="center">비밀번호</div>
				</td>
				<td width="154" class="normal">
					<input type="password" name="userpw" id="userpw" placeholder="8글자 이상 특수문자포함">
				</td>
				<td><span id="pwcheckResult"style="width: 150px"></span>
				</td>
				</tr>
				<tr>
				<td class="normalbold tb_ttl">
					<div align="center">비밀번호 확인</div>
				</td>
				<td width="160"><input type="password" name="userpwcheck" id="userpwcheck" >
				</td>
			</tr>
			<tr>
				<td class="normalbold tb_ttl">
					<div align="center">이름</div>
				</td>
				<td colspan="3" height="23" class="normal">
					<input type="text" name="name" id="name" placeholder="필수입력">
				</td>
			</tr>
			<tr>
				<td class=''>
					<div align="center">이메일</div>
				</td>
				<td colspan="3" height="23" class="normal">
					<input type="email" name="email" id="email" placeholder="필수입력">
				</td>
			</tr>
			<tr>
				<td class=''>
					<div align="center">연락처</div>
				</td>
				<td colspan="3" height="23" class="normal"><input type="tel"
					name="phone" id="phone" placeholder="필수입력">
				</td>
			</tr>
			<tr>
				<td colspan="4" class="normal">
					<div align="w">
						<input type="submit" name="join" id="join" value="등   록" >
						<input type="reset" name="reset" value="취   소">
					</div>
				</td>
			</tr>
		</table>
	</form>


</body>
</html>