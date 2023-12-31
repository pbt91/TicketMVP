<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset="UTF-8">
<title>경기 목록 페이지</title>
<!-- css코드 호출 -->
<link rel="stylesheet" type="text/css" href="/TicketMvp/resources/css/main/templates.css">
<link rel="stylesheet" type="text/css" href="/TicketMvp/resources/css/athlete_information.css">
<link rel="stylesheet" type="text/css" href="/TicketMvp/resources/css/athlete_matches.css">
<!-- jquery 및 jquery UI 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- js코드 호출 -->
<script src='/TicketMvp/resources/js/athlete_matches.js' type="text/javascript"></script>
<!-- Bootstrap 호출 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

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
				<main class="matches-information">
					<div class="matches-schedule">
						<h1>경기 일정</h1><br/><br/>
						<div id="filters" class="row justify-content-center">
						    <!-- 구단 필터 -->
						    <div class="col-md-2 mb-2">
						        <div class="dropdown">
						            <button class="btn btn-secondary dropdown-toggle" type="button" id="clubFilterDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						                구단 선택
						            </button>
						            <div class="dropdown-menu" aria-labelledby="clubFilterDropdown">
							            <c:forEach var="club" items="${uniqueClubs}">
							                <label class="dropdown-item">
							                    <input type="checkbox" class="clubFilterCheckbox" value="${club}"> ${club}
							                </label>
							            </c:forEach>
							        </div>
						        </div>
						    </div>
						
						    <!-- 날짜 필터 -->
							<div class="col-md-2 mb-2">
							    <button class="btn btn-primary" type="button" id="dateFilterButton">
							        날짜 선택
							    </button>
							    <div id="dateInputs" style="display: none;">
							        <input type="date" id="from" class="datepick" >
							        <input type="date" id="to" class="datepick">
							    </div>
							</div>
						
						    <!-- 경기장 필터 -->
						    <div class="col-md-2 mb-2">
						        <div class="dropdown">
						            <button class="btn btn-primary dropdown-toggle" type="button" id="stadiumFilterDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						                경기장 선택
						            </button>
						            <div class="dropdown-menu" aria-labelledby="stadiumFilterDropdown">
							            <c:forEach var="stadium" items="${uniqueStadiums}">
							                <label class="dropdown-item">
							                    <input type="checkbox" class="stadiumFilterCheckbox" value="${stadium}"> ${stadium}
							                </label>
							            </c:forEach>
							        </div>
						        </div>
						    </div>
						</div>
						
						<!-- 경기 리스트 -->
						<div id="list-matches">
							<c:forEach var="match" items="${matches}">
							    <div class="gird-item" data-homeclub="${match.homeclub}" data-awayclub="${match.awayclub}" data-stadiumname="${match.stadiumname}" data-matchdate="${match.matchdate}">
							        <p class="match-info">
							            <input type="hidden" value="${match.matchid}">
							            <i class="bi-heart" data-matchid="${match.matchid}"></i>
							            ${match.homeclub} vs ${match.awayclub} 
							            일자: ${match.matchdate} 
							            시간: ${match.matchtime}
							            <button class="payment-button" data-matchid="${match.matchid}">예매</button>
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