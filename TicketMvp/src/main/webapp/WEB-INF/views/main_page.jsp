<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인화면</title>
<link rel="stylesheet" type="text/css" href="../resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/masonry/4.2.2/masonry.pkgd.min.js"></script>
<script src='../resources/js/main.js' type="text/javascript"></script>
</head>
<body>
	<div id="body-wrapper">
		<div id="body-content">
			<jsp:include page="../views/main/main_header.jsp" />
			
				<jsp:include page="../views/main/main_sidebar.jsp" />
			
				<main class="shopping-area">
					<div id="image-grid-container">
						<div id="image-grid" class="image-grid">
							<c:forEach var="imagePath" items="${imagePaths}" varStatus="loop">
								<div class="image-item">
									<a href="#"> <img
										src="${pageContext.request.contextPath}/${imagePath}"
										alt="선수 이미지" />
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</main>

			
				<jsp:include page="../views/main/main_footer.jsp" />
			
		</div>
	</div>
</body>
</html>
