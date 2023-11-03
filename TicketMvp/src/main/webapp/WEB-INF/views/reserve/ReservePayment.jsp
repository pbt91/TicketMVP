<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예매 / 결재</title>
    <!-- Jquery 호출 -->
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Bootstrap 호출 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<!-- 토스결제 호출 -->
	<script src="https://js.tosspayments.com/v1/payment-widget"></script>
	<!-- js코드 호출 -->
	<script src="/TicketMvp/resources/js/ReservePayment.js"></script>
	<!-- css 호출 -->
	<link rel="stylesheet" href="/TicketMvp/resources/css/ReservePayment.css"> 
</head>
<body>
<h1>예매 / 결재</h1>
<input id="ticketid" type="hidden" value="${ticketId}">
<input id="matchid" type="hidden" value="${ticket.matchid}">
<div class="container mt-5">
	<!-- 구마자정보 -->
	<div class="card mb-4">
	    <div class="card-header">구매자정보</div>
	    <div class="card-body">
	        <div class="form-group row">
		      	<label for="name" class="col-sm-2 col-form-label form-label">이름:</label>
		      	<div class="col-sm-10">
		      		<input type="text" class="form-control" id="name" name="name" value="<%=session.getAttribute("name")%>" readonly>
		     	</div>
	  		</div>
		  <div class="form-group row">
		      <label for="email" class="col-sm-2 col-form-label form-label">이메일:</label>
		      <div class="col-sm-10">
		                <input type="email" class="form-control" id="email" name="email" value="<%=session.getAttribute("email")%>" readonly>
		            </div>
		  </div>
		  <div class="form-group row">
		      <label for="phone" class="col-sm-2 col-form-label form-label">휴대폰 번호:</label>
		      <div class="col-sm-10">
                <input type="tel" class="form-control" id="phone" name="phone" size="15">
                <button>수정</button>
		      </div>
		  </div>
		</div>
	</div>
	
	<!-- 상품정보 -->
	<div class="card mb-4">
	    <div class="card-header">상품정보</div>
	    <div class="card-body">
	        <div class="form-group row">
	        	<label for="product" class="col-sm-2 col-form-label form-label">상품:</label>
	            <div id="productDisplay" class="col-sm-10">
	                ${ticket.ticketname}
	            </div>
	            <label for="product" class="col-sm-2 col-form-label form-label">경기일시:</label>
	            <div class="col-sm-10">
	                <fmt:formatDate value="${ticket.matchdate}" type="date" dateStyle="long"/> / <fmt:formatDate value="${ticket.matchtime}" type="time" timeStyle="short" />
	            </div>
	        </div>
	        <div class="form-group row">
	            <label for="quantity" class="col-sm-2 col-form-label form-label">수량:</label>
	            <div id="ticketQuantity" data-ticket-quantity="${ticketQuantityBuy}" class="col-sm-10">
	           		${ticketQuantityBuy}개
	            </div>
	        </div>
	        <div class="form-group row">
	            <label for="cancelDate" class="col-sm-2 col-form-label form-label">취소가능일시:</label>
	            <div class="col-sm-10">
					<fmt:formatDate value="${ticket.canceldate}" type="date" dateStyle="long"/>
	            </div>
	        </div>
	    </div>
	</div>
	
	
	<!-- 결제정보 -->
	<div class="card mb-4">
	    <div class="card-header">결제정보</div>
	    <div class="card-body">
	        <div class="form-group row">
	      <label for="totalPrice" class="col-sm-2 col-form-label form-label">총 상품가격:</label>
	      <div class="col-sm-10" id="totalPriceDisplay" data-ticket-quantity="${ticketQuantityBuy}" data-ticket-price="${ticket.ticketprice}"></div>
	        </div>
	        <div class="form-group row">
	            <label for="coupon" class="col-sm-2 col-form-label form-label">할인 쿠폰:</label>
	            <div class="col-sm-10">
	            	<button>여기 쿠폰 기능 기능 필요</button>
	        	</div>
	        </div>
	        <div class="form-group row">
	            <label for="finalPrice" class="col-sm-2 col-form-label form-label">총 결제금액:</label>
	            <div class="col-sm-10" id="finalPriceDisplay"></div>
	        </div>
	     </div>
	 </div>
	      
	
	 <div class="d-flex justify-content-end mb-3">
		<button id="cancel" type="button" class="btn btn-secondary mr-2">취소</button>
		<button id="order" type="button" class="btn btn-primary">예매확정</button>
	</div>
</div>

<!-- 토스 결제창 -->
<div class="modal fade" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="paymentModalLabel">결제방식 선택</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="payment-method"></div>
                <button id="payment-request-button" class="btn btn-primary">결제하기</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>


