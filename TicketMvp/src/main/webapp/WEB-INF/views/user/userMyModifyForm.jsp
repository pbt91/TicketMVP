<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">

<title>회원정보 수정 폼</title>

<meta charset="UTF-8">

<!-- js코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!-- css파일 연결 -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/user/userMyModifyForm.css">
<link rel="stylesheet" href="/TicketMvp/resources/css/main/templates.css">
<!-- js파일 연결 -->
<script src="/TicketMvp/resources/js/user/userMyModifyForm.js"
	type="text/javascript"></script>
<!-- 모달창 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
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
						<a href="#modal" rel="modal:open"> <input class="but5" type="button" id="elimination" value="탈퇴하기"></a>
						<section id="modal" class="modal modal-section type-confirm">
				            <div class="enroll_box" align="center">
				                <h5 class="menu_msg">정말 탈퇴하시겠습니까?</h5>
				                <h5 class="menu_msg">탈퇴후에는 되돌릴 수 없고 <br/>아이디에 저장된 정보를 확인할 수 없습니다 </h5>				                
				            </div>
				            <div class="enroll_btn" align="center">
				                <button class="btn gray_btn modal_close" id="elimination_no">취소</button>
				                <a rel="modal:close"><button class="btn pink_btn btn_ok" id="elimination_yes" style="color:red;">탈퇴</button></a>
				            </div>
						</section>
						
	
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