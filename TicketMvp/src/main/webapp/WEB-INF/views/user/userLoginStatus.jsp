<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- EL태그 사용 라이브러리 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 되어있는지 로그아웃 되어있는지 확인하는 페이지</title>
</head>
<body>
<c:if test="${sessionScope.userid != null}">

${sessionScope.name}님 환영합니다 

<a href='logout.do'><input type="button" id='move_logout' name='move_logout' value='로그아웃'/></a>

</c:if>

<c:if test="${sessionScope.userid == null}">


로그인을 해주세요 <a href='userLoginForm.do'><input type="button" id='move_login' name='move_login' value='로그인'/></a>

</c:if>

<strong>반갑습니다</strong>

</body>
</html>