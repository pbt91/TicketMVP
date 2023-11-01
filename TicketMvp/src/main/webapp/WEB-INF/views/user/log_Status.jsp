<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 되어있는지 로그아웃 되어있는지 확인하는 페이지</title>
</head>
<body>


${sessionScope.name}님 환영합니다 <a href='loginForm.do'><input type="button" id='move_logout' name='move_logout' value='로그아웃'/></a>





</body>
</html>