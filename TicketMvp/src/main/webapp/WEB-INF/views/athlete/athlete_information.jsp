<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/main/templates.css">
<link rel="stylesheet" type="text/css" href="../resources/css/athlete_information.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src='/TicketMvp/resources/js/athlete.js' type="text/javascript"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/masonry/4.2.2/masonry.pkgd.min.js"></script>


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
					<main class="athlete-information">
						<div class="athlete-top">
							<div class="gird-left">
								<!-- 선수 이미지가 들어가는 부분의 박스 -->
								<div class="image-layer">
									<img id="athlete-image"
										src="${pageContext.request.contextPath}/resources/images/member_images/${athlete.athleteimgfile}"
										alt="선수 이미지" />
								</div>
							</div>
							<!-- 선수 정보가 들어가는 부분 -->
							<div class="gird-right">
								<div class="text-layer">
									<h1 id="athlete-name">${athlete.athletename}</h1>
									<p id="athlete-info">${athlete.info}</p>
									<p id="athlete-career">경력: ${athlete.career}</p>
								</div>
							</div>
						</div>

						<div class="athlete-schedule">
							<h1>경기 일정</h1>
							
							<div class="grid-container">
								<c:forEach var="match" items="${matches}">
									<div class="gird-item">
										<p class="match-info">
											<input type="hidden" value="${match.matchid}">
											<!-- 하트 이모티콘 삽입 -->
											<i class="bi bi-heart" data-matchid="${match.matchid}"></i>

											${match.homeclub} vs ${match.awayclub} 일자: ${match.matchdate}
											시간: ${match.matchtime}

											<button class="payment-button"
												data-matchid="${match.matchid}">예매</button>
										</p>
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

<!-- /TicketMvp/reserve/ReserveChoose.do -->