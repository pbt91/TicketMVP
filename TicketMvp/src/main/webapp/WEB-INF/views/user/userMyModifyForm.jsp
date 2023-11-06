<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<style>
#container {
	display: flex;
	height: 1000px;
	background-color: #f8f9fa;
}

#container>#sidebar {
	flex: 1;
	/* padding: 10px; */
	background-color:#333;
	min-width: 180px;
	/* border: 1px solid #ccc; */
	max-height: 1000px;
	overflow: auto;
}

#container>#content {
	flex: 9;
	padding-top: 15px;
/* 	border: 1px solid #ccc; */
	height: 100%;
}

iframe {
	width: 100%;
	height: 100%;
	border: none;
}
</style>

<title>회원정보 수정 폼</title>

<meta charset="UTF-8">

<!-- js코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- css파일 연결 -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/user/userMyModifyForm.css">
<link rel="stylesheet" href="/TicketMvp/resources/css/main/main.css">
<!-- js파일 연결 -->
<script src="/TicketMvp/resources/js/user/userMyModifyForm.js"
	type="text/javascript"></script>

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
			<form method="post" id="usermodify">
				<div class="container">
					<div class="insert">
						<table>
							<caption>
								<h2>회원정보수정</h2>
							</caption>
							<tr>
								<td class="col1">이름</td><!-- col1 -->
								<td class="col2"><input type="text" value="${name}" id="name" name="name" maxlength="5" required></td>
							</tr>
							<tr>
								<td class="col1">아이디</td>
								<td class="col2"><input type="text" value="${userid}" id="userid" name="userid" maxlength="12" minlength="5" readonly></td> 
							</tr>
							<tr>
								<td class="col1">비밀번호</td>
								<td class="col2"><input type="password" id="userpw" name="userpw" maxlength="15" placeholder="변경을 원하지 않으면 공백">
									<p>
										※비밀번호는 <span class="num" id='userpw_span'>문자, 숫자, 특수문자(~!@#$%^&*)의 조합 8
											~ 15자리로</span> 입력이 가능합니다.
									</p></td>
							</tr>
							<tr>
								<td class="col1">비밀번호 확인</td>
								<td class="col2"><input type="password" id="userpwcheck" name="userpwcheck"	maxlength="15" placeholder="변경을 원하지 않으면 공백"></td>
							</tr>
							<tr>
								<td class="col1">이메일</td>
								<td class="col2"><input type="text" value="${emailid}" id='emailid'name="mailid" >
									<span class="a">@</span> <input type="text" id='email' name="email" value="${mailslc}">
									<select id="mailslc" name="mailslc">
										<option value="" selected>직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="daum.com">daum.com</option>
										<option value="nate.com">nate.com</option>
								</select> 
								</td>
							</tr>
							<tr>
								<td class="col1">연락처</td>
								<td class="col2"><input type="text" value="${phone}" id="phone" name="phone" pattern="[0-9]+" required> 
								<p>
										※연락처는 <span class="num">'-'를 제외한 숫자만</span> 입력이 가능합니다.
									</p>
								</td>
							</tr>
						</table>

					</div>

					<div class="create">
						<a href="/TicketMvp/user/userMyMain.do"><!-- 마이페이지 메인으로 -->
						<input class="but3" type="button" value="돌아가기" ></a>
						<input class="but4" type="button" id="modify" value="수정하기">
					</div>
				</div>
			</form>



		</div>
	</div>


	<div id="footer">
		<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
	</div>




</body>
</html>