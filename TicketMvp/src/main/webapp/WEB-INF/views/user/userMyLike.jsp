<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">

<title>no name</title>

<meta charset="UTF-8">

<!-- jquery 코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- css 파일 연결 - main -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/main/templates.css">
<!-- css 파일 연결 - page -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/user/userMyLike.css">
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
			<h2>찜 목록</h2>
			<form action="/TicketMvp/user/userMyLikeDelete.do">
				<div>
					<table>
						<thead>
							<tr>
								<th>선택</th>
								<th>경기번호</th>
								<th>홈구단</th>
								<th>원정구단</th>
								<th>경기일</th>
								<th>경기시간</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="like" items="${likeList}">
								<tr>
									<td>
										<input type="checkbox" name="likes" value="굿" />
										<input type="hidden" name="matchId" value="${like.matchid}" />
									</td>
									<td>${like.matchid}</td>
									<td>${like.homeclub}</td>
									<td>${like.awayclub}</td>
									<td>${like.matchdate}</td>
									<td>${like.matchtime}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div align="right"><input type="submit" value="삭제"></div>
			</form>
		</div>
		<!-- end of div#content -->
	</div>
	<!-- end of div#container-->


	<div id="footer">
		<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
	</div>




</body>
</html>