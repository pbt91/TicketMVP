<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/main.css">
<link rel="stylesheet" type="text/css" href="../resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='../resources/js/athlete.js' type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/masonry/4.2.2/masonry.pkgd.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
#container {
	display: flex;
	height: 1000px;
	background-color: #f8f9fa;
}

#container>#sidebar {
	flex: 1;
	/* padding: 10px; */
	background-color: #333;
	min-width: 180px;
	/* border: 1px solid #ccc; */
	max-height: 1000px;
	overflow: auto;
}

#container>#content {
	flex: 9;
	padding-top: 15px;
	/*    border: 1px solid #ccc; */
	height: 100%;
}

iframe {
	width: 100%;
	height: 100%;
	border: none;
}
</style>

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
						<div class="athlete-information-gird">
							<!-- 선수 이미지가 들어가는 부분의 박스 -->
							<div class="image-layer">
								<img id="athlete-image"
									src="${pageContext.request.contextPath}/resources/images/member_images/${athlete.athleteimgfile}"
									alt="선수 이미지" />
							</div>
							<!-- 선수 정보가 들어가는 부분 -->
							<div class="text-layer">
								<h1 id="athlete-name">${athlete.athletename}</h1>
								<p id="athlete-info">${athlete.info}</p>
								<p id="athlete-career">경력: ${athlete.career}</p>
							</div>
						</div>
					</main>

					<div class="athlete-schedule">
						<!-- 선수의 경기 일정 리스트가 여기에 들어갈 수 있음 -->
						<h2>경기 일정</h2>
						<ul>
							<li>경기 1 - 날짜 및 정보</li>
							<li>경기 2 - 날짜 및 정보</li>
							<!-- 다른 경기 리스트 항목 추가 -->
						</ul>
					</div>

				</div>
			</div>
			<div id="footer">
				<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
			</div>
		</div>
	</div>
</body>
</html>