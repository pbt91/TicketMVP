<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">

<title>회원정보수정</title>

<meta charset="UTF-8">

<!-- js 코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- css 파일 연결 - main -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/main/templates.css">
<!-- css 파일 연결 - page -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/user/userMyModify.css">

</head>
<body>


	<div id="header">
		<jsp:include page="/WEB-INF/views/main/main_header.jsp" />
	</div>

	<div id="container">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/main/main_sidebar.jsp" />
		</div>
		<div id="content">

			<div id="modi">
			
			
				<form action='/TicketMvp/user/checkPw.do' id='mymodify'
					name='mymodify' method='post'>
					<table id='tbmymodify' name='tbmymodify'>

						
						<tr>						
						
							<td>
							<input type='password' id='userpw' name='userpw' placeholder="현재 비밀번호">
							<td><button type='submit' ><img alt="확인" src="/TicketMvp/resources/images/user/check.png"></button>
							</td>
							
					</table>
					
				</form>
				
			
			
			</div>
		</div>
		<!-- end of div#content -->
	</div>
	<!-- end of div#container-->


	<div id="footer">
		<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
	</div>




</body>
</html>