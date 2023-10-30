<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Jquery 호출 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Bootstrap 호출 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" >
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- js코드 호출 -->
<script src="/TicketMvp/resources/js/ReserveChoose.js"></script>
<!-- css 호출 -->
<link rel="stylesheet" href="/TicketMvp/resources/css/ReserveChoose.css">
<meta charset="UTF-8">
<title>경기 예매 - 좌석 선택</title>
</head>
<body>

<div id="reserveMain">
	<!-- 좌석 별 티켓 리스트 -->
	<div class="container d-flex justify-content-center" id="reserveTicketList">
	    <ul class="list-group mt-5 text-white">
	        <c:forEach items="${ticketList}" var="ticket" varStatus="loop">
	        	<c:if test="${ticket.ticketremain > 0}">
	        		<li class="list-group-item d-flex justify-content-between align-items-center" id="${ticket.ticketname}">
		                <div class="d-flex flex-row">
		                    <img src="/TicketMvp/resources/images/soccer-ticket.png" class="soccer-ticket">
		                    <div class="ml-2">
		                        <h6 class="mb-0">${ticket.ticketname}</h6>
		                        <div class="ticket-info">
		                            <span>표당 ${ticket.ticketprice}원</span>
		                            <br>
		                            <span>${ticket.ticketremain}좌석 남음</span>
		                        </div>   
		                    </div>
		                    <button class="reserve" id="${ticket.ticketname}">예매</button>
		                </div>
	            	</li>
	        	</c:if>    
	        </c:forEach>
	    </ul>
	</div>
	<div id="reserveSide">
		<!-- 구역 이미지 -->
		<img alt="좌석 지도" src="" id="stadiumMap">
	</div>
	
</div>


</body>
</html>