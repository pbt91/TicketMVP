<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- EL태그 사용 라이브러리 -->

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">

<title>로그인 되어있는지 로그아웃 되어있는지 확인하는 페이지</title>

<meta charset="UTF-8">

<!-- js 코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- css 파일 연결 - main -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/main/templates.css">
<!-- css 파일 연결 - page -->
<!-- <link rel="stylesheet" href="/TicketMvp/resources/css/user/.css"> -->
<!-- js파일 연결 -->
<!-- <script src="/TicketMvp/resources/js/user/.js" type="text/javascript"></script> -->

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
			

<c:if test="${sessionScope.userid != null}">

${sessionScope.name}님 환영합니다 

<a href='logout.do'><input type="button" id='move_logout' name='move_logout' value='로그아웃'/></a>

<a href='userMyMain.do'><input type='button' id='mypagemain' name='mypagemain' value='마이페이지'/></a>

<a href='userMyModify.do'><input type='button' id='mypagemodify' name='mypagemodify' value='회원정보수정'/></a>

<a href = "../views/main_page.jsp">메인</a>

</c:if>

<c:if test="${sessionScope.userid == null}">


로그인을 해주세요 <a href='userLoginForm.do'><input type="button" id='move_login' name='move_login' value='로그인'/></a>

</c:if>

<strong>반갑습니다</strong>

		</div> <!-- end of div#content -->
	</div> <!-- end of div#container-->


	<div id="footer">
		<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
	</div>




</body>
</html>