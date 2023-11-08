<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">

<title>내 문의글</title>

<meta charset="UTF-8">

<!-- js 코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- css 파일 연결 - main -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/main/templates.css">
<!-- css 파일 연결 - page -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/user/userMyInquiry.css">
<!-- js파일 연결 -->
<!-- <script src="/TicketMvp/resources/js/user/.js" type="text/javascript"></script> -->

<%
	int num = 0;
%>

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
			<div class="board_wrap">
				<div class="board_title">
					<strong>문의사항</strong>
					<p>문의주신 내용에 빠르게 안내드리겠습니다</p>
				</div>
				<div class="board_list_wrap">
					<div class="board_list">
						<div class="top">
							<div class="num">번호</div>
							<div class="title">제목</div>
							<div class="writer">글쓴이</div>
							<div class="date">작성일</div>
							<div class="count">답글</div>
						</div>
						<c:choose>
							<c:when test="${not empty inquiry}">
								<c:forEach var="inquiry" items="${inquiryList}">
									<div>
										<div class="num"><%=++num%></div>
										<div class="title">
											<a href="view.html">${inquiry.helptitle}</a>
										</div>
										<div class="writer">${inquriy.userid}</div>
										<div class="date">${inquiry.helpdate}</div>
										<div class="reply">
											<c:choose>
												<c:when test="${not empty inquiry.replydate}">완료</c:when>
												<c:otherwise>대기</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<span class="tb-center" style="font-size:20px; position:absolute;">아직 작성된 글이 없습니다</span>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="board_page">
						<a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
						<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
							href="#" class="num">3</a> <a href="#" class="num">4</a> <a
							href="#" class="num">5</a> <a href="#" class="bt next">></a> <a
							href="#" class="bt last">>></a>
					</div>
					<div class="bt_wrap">
						<a href="write.html" class="on">등록</a>
						<!--<a href="#">수정</a>-->
					</div>
				</div>
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




