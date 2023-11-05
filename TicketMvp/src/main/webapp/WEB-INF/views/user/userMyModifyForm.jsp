<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 폼</title>
<link rel="stylesheet" href="/TicketMvp/resources/css/user/userMyModifyForm.css">
<script src="/TicketMvp/resources/js/user/userMyModifyForm.js" type="text/javascript"></script>
</head>
<body>
<h2>회원정보수정</h2>
<form action="userMyModifyForm.do" method='post'>
<div>
	<table >
		<tr>
			<td class='title'> 이름 </td>
			<td> <input type='text' id='name' name='name' value='${name}' required> </td>	
		</tr>
		<tr>
			<td class='title'> 아이디 </td>
			<td> <input type='text' id='userid' name='userid' value='${userid}' readonly> </td>
		</tr>
		<tr>
			<td class='title'> 비밀번호 </td>
			<td> <input type='password' id='userpw' name='userpw'> </td>
		</tr>
	
		<tr>
			<td class='title'> 비밀번호 확인 </td>
			<td> <input type='password' id='userpwcheck' name='userpwcheck'> </td>
		</tr>
		<tr>
			<td class='title'> 이메일 </td>
			<td> <input type='email' id='email' name='email' value='${email}' required> </td>
		</tr>
		<tr>
			<td class='title'> 연락처 </td>
			<td> <input type='tel' id='phone' name='phone' value='${phone}' pattern="[0-9]+" required > </td>
		</tr>
		<tr class='lastcan'>
			<td></td>
			<td colspan="1" align="right" ><button type='submit' id='modify' required>수정</button></td>
		</tr>
	</table>
</div>
</form>


</body>
</html>