<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.Base64.Encoder"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.Reader" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>결재 완료</title>
     <!-- Jquery 호출 -->
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- Bootstrap 호출 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <!-- js코드 호출 -->
	<script src="/TicketMvp/resources/js/reserve/ReserveFinish.js"></script>
	<!-- css 호출 -->
	<link rel="stylesheet" type="text/css" href="/TicketMvp/resources/css/main/templates.css">
	<link rel="stylesheet" href="/TicketMvp/resources/css/ReserveFinish.css">
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
				<section>
					<h1>결재 완료 하셨습니다.</h1>
					<div class="container mt-5">
					       <div class="row">
					           <div class="col-md-4">
					               <img src="/TicketMvp/resources/images/reservation.png" alt="축구 티켓" class="img-fluid"> 
					           </div>
					           <div class="col-md-8">
					               <div class="card mb-4">
					                   <div class="card-header">예매 정보</div>
					                   <div class="card-body">
					                       <div class="form-group row">
					                           <label class="col-sm-4 col-form-label">예매번호:</label>
					                           <div class="col-sm-8"> 1234567890</div>
					                       </div>
					                       <div class="form-group row">
					                           <label class="col-sm-4 col-form-label">상품명:</label>
					                           <div class="col-sm-8">축구티켓</div>
					                       </div>
					                       <div class="form-group row">
					                           <label class="col-sm-4 col-form-label">개수:</label>
					                           <div class="col-sm-8">100장</div>
					                       </div>
					                       <div class="form-group row">
					                           <label class="col-sm-4 col-form-label">결제금액:</label> 	
					                           <div class="col-sm-8">1,000,000원</div>
					                       </div>
					                       <div class="form-group row">
					                           <label class="col-sm-4 col-form-label">결제일시:</label>
					                           <div class="col-sm-8">2023년 9월 1일 오전 10시 30분</div>
					                       </div>
					                   </div>
					               </div>
								</div>
							</div>
						<div class="text-center mt-3">
						    <div class="text-center mt-3">
						    	<a href="/TicketMvp/user/userMyOrderList.do" class="btn btn-secondary">주문 목록</a>
							    <a href="/TicketMvp/athlete/main_page.do" class="btn btn-secondary">HOME</a>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>

		<div id="footer">
			<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
		</div>
	</div>
</div>

</body>
</html>