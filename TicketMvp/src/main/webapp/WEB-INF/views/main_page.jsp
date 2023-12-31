<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인화면</title>
<link rel="stylesheet" type="text/css" href="/TicketMvp/resources/css/main/main.css">
<link rel="stylesheet" type="text/css" href="/TicketMvp/resources/css/main/templates.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/masonry/4.2.2/masonry.pkgd.min.js"></script>
<script src='../resources/js/main.js' type="text/javascript"></script>
</head>
<body>
<div id="body-wrapper">
	<div id="body-content">
		<div id="header">
			<jsp:include page="/WEB-INF/views/main/main_header.jsp" />
		</div>

		<div id="container">
			<div id="sidebar">
				<jsp:include page="/WEB-INF/views/main/main_sidebar.jsp" />
			</div>

			<div id="content">
				<main class="shopping-area">
					<div id="image-grid-container">
						<div id="image-grid" class="image-grid">
							<c:forEach var="athlete" items="${athletes}" varStatus="loop">
								<div class="image-item"
									data-athlete-name="${athlete.athletename}">
									<a
										href="${pageContext.request.contextPath}/athlete/athlete_information.do?athletename=${athlete.athletename}">
										<img
										src="/TicketMvp/resources/images/member_images/${athlete.athleteimgfilefull}_${athlete.athleteimgfile}"
										alt="선수 이미지" />
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</main>
			</div>
		</div>

		<div id="footer">
			<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
		</div>
	</div>
</div>
</body>
</html>
