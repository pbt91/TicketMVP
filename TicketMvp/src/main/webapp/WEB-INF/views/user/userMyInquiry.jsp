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
			<div class="myinquiry_board">
				<h2 class="boardname">내 문의글 보기</h2>
			</div>
			<div class="conut_board">
				<p>총 게시글 ${fn:length(inquirtList)} 건</p>
			</div>
			<div class="table">
				<table>
					<caption>문의글 리스트</caption>
					<colgroup>
						<col width="65">
						<!-- 번호 -->
						<col width="*">
						<!-- 제목 -->
						<col width="100">
						<!-- 날짜 -->
						<col width="65">
						<!-- 답글 유무 -->
					</colgroup>
					<thead>
						<tr>
							<th scope="row">
								<div class="tb-center">번호</div>
							</th>
							<th scope="row">
								<div class="tb-center">제목</div>
							</th>
							<th scope="row">
								<div class="tb-center">날짜</div>
							</th>
							<th scope="row">
								<div class="tb-center">답글</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="inquiry" items="${inquiryList}">
							<c:choose>
								<c:when test="${not empty inquiry}">
									<tr>
										<td><%=++num%></td>
										<td>${inquiry.helptitle}</td>
										<td>${inquiry.helpdate}</td>
										<td><c:choose>
												<c:when test="${not empty inquiry.replydate}">완료</c:when>
												<c:otherwise>대기</c:otherwise>
											</c:choose></td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="3"><span class="tb-center">아직 작성된 글이
												없습니다</span></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<%-- <c:forEach var="inquiry" items="${inquirtList }">
							<c:if test="${not empty inquiryList}"> <!-- controller에서 넘어온 model에 값이 있으면 -->
								<tr>
									<td><%= ++num %></td>
									<td>${inquiryList.helptitle }</td>
									<td>${inquiryList.helpdate }</td>
									<td><c:if test="${not empty inquiryList.replydate }">완료</c:if>
										<c:if test="${empty inquiryList.replydate }">대기</c:if></td>								
								</tr>
							</c:if>
							<c:if test="${empty inquiryList}"> <!-- controller에서 넘어온 model에 값이 있으면 -->
								<tr>
									<td colspan="3">
										<span class="tb-center">아직 작성된 글이 없습니다</span>
									</td>
								</tr>
							</c:if>
						</c:forEach> --%>
					</tbody>
				</table>
			</div>
			<!-- class="table" -->



		</div>
		<!-- end of div#content -->
	</div>
	<!-- end of div#container-->


	<div id="footer">
		<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
	</div>




</body>
</html>