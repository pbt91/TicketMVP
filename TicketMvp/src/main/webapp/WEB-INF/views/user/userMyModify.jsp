<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>

	<form action='userMyModify.do' id='mymodify' name='mymodify' method='post' align='center'>
		<table id='tbmymodify' name='tbmymodify'>
			<tr>
				<td>현재 비밀번호</td>
				<td><input type='password' id='userpw' name='userpw'></td>
				<td><input type='submit' value='확인'></td>
			</tr>
		</table>
	</form>

<%-- <c:if test="${sessionScope.ok!=null}">

</c:if> --%>

</body>
</html>