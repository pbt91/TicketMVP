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

<!-- 결제 데이터 호출 -->
<%
  String orderId = request.getParameter("orderId");
  String paymentKey = request.getParameter("paymentKey");
  String amount = request.getParameter("amount");
  
  String secretKey = "test_sk_QbgMGZzorz5A4kmB9dElVl5E1em4:";
  
  Encoder encoder = Base64.getEncoder(); 
  byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
  String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);

  paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);
  
  URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
  
  HttpURLConnection connection = (HttpURLConnection) url.openConnection();
  connection.setRequestProperty("Authorization", authorizations);
  connection.setRequestProperty("Content-Type", "application/json");
  connection.setRequestMethod("POST");
  connection.setDoOutput(true);
  JSONObject obj = new JSONObject();
  obj.put("paymentKey", paymentKey);
  obj.put("orderId", orderId);
  obj.put("amount", amount);
  
  OutputStream outputStream = connection.getOutputStream();
  outputStream.write(obj.toString().getBytes("UTF-8"));
  
  int code = connection.getResponseCode();
  boolean isSuccess = code == 200 ? true : false;
  
  InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();
  
  Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
  JSONParser parser = new JSONParser();
  JSONObject jsonObject = (JSONObject) parser.parse(reader);
  responseStream.close();
%>
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
	<link rel="stylesheet" href="/TicketMvp/resources/css/ReserveFinish.css">
</head>
<body>
	<section>
	<% if (isSuccess) { %>
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
		                           <div class="col-sm-8"><%= jsonObject.get("orderId") %></div>
		                       </div>
		                       <div class="form-group row">
		                           <label class="col-sm-4 col-form-label">상품명:</label>
		                           <div class="col-sm-8"><%= jsonObject.get("orderName") %></div>
		                       </div>
		                       <div class="form-group row">
		                           <label class="col-sm-4 col-form-label">개수:</label>
		                           <div class="col-sm-8"><%= request.getParameter("ticketQuantity") %>장</div>
		                       </div>
		                       <div class="form-group row">
		                           <label class="col-sm-4 col-form-label">결제금액:</label> 	
		                           <div class="col-sm-8"><%= request.getParameter("amount") %>원</div>
		                       </div>
		                       <div class="form-group row">
		                           <label class="col-sm-4 col-form-label">결제일시:</label>
		                           <div class="col-sm-8"><%
								    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssXXX");
								    SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy'년' MM'월' dd'일' a hh'시' mm'분'");
								    String requestAt = (String) jsonObject.get("requestedAt");
								    try {
								        Date date = inputFormat.parse(requestAt);
								        String formattedDate = outputFormat.format(date);
								        out.print(formattedDate);
								    } catch (Exception e) {
								        e.printStackTrace();
								    }
								    %></div>
		                       </div>
		                   </div>
		               </div>
					</div>
				</div>
			<div class="text-center mt-3">
			    <div class="text-center mt-3">
			    	<button class="btn btn-primary">주문 목록</button>
				    <a href="/TicketMvp/athlete/main_page.do" class="btn btn-secondary">HOME</a>
				</div>
			</div>
		</div>
	<% } else { %>
		<c:redirect url="../billing/billingFail.do"/>	
	<% } %>
	</section>
</body>
</html>