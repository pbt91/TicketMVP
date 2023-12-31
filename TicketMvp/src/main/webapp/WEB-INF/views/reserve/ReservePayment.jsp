<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예매 확인</title>
    <!-- Jquery 호출 -->
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Bootstrap 호출 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<!-- 토스결제 호출 -->
	<script src="https://js.tosspayments.com/v1/payment-widget"></script>
	<!-- js코드 호출 -->
	<script src="/TicketMvp/resources/js/reserve/ReservePayment.js"></script>
	<!-- css 호출 -->
	<link rel="stylesheet" type="text/css" href="/TicketMvp/resources/css/main/templates.css">
	<link rel="stylesheet" href="/TicketMvp/resources/css/ReservePayment.css"> 
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
				<!-- 예매확인 페이지 -->
				<h1>예매 / 결재</h1>
				<input id="ticketid" type="hidden" value="${ticketId}">
				<input id="matchid" type="hidden" value="${ticket.matchid}">
				<input id="userId" type="hidden" value="${userInfo.userid}">
				<input id="couponId" type="hidden">
				<div class="container mt-5">
					<!-- 구마자정보 -->
					<div class="card mb-4">
					    <div class="card-header">구매자정보</div>
					    <div class="card-body">
					    
					        <div class="form-group row">
						      	<label for="name" class="col-sm-3 col-form-label form-label">이름</label>
						    	<div class="col-sm-7" id="userName">${sessionScope.name}</div>
					  		</div>
					  		
							<div class="form-group row">
								<label for="email" class="col-sm-3 col-form-label form-label">이메일</label>
								<div class="col-sm-7" id="userEmail">${userInfo.email}</div>
							</div>
							
							<div class="form-group row">
							    <label for="phone" class="col-sm-3 col-form-label form-label">휴대폰 번호</label>
							    <div class="col-sm-7 d-flex align-items-center justify-content-left">
							        <span id="userPhone" data-phone="${userInfo.phone}" class="mr-2">${userInfo.phone}</span> 
							        <input type="tel" size="10" id="userPhoneInput" value="${userInfo.phone}" class="form-control mr-2 tel-input" style="display:none;" placeholder="전화번호 입력하세요">
							        <button type="button" class="btn btn-primary" id="editPhone">수정</button>
							        <button type="button" class="btn btn-success" id="savePhone" style="display:none;">저장</button>
							    </div>
							</div>
						</div>
					</div>
					
					<!-- 상품정보 -->
					<div class="card mb-4">
					    <div class="card-header">상품정보</div>
					    <div class="card-body">
					        <div class="form-group row">
					            <label for="product" class="col-sm-3 col-form-label form-label">상품</label>
					            <div id="productDisplay" class="col-sm-7">${ticket.ticketname}</div>
					        </div>
					        <div class="form-group row">
					            <label for="product" class="col-sm-3 col-form-label form-label">경기일시</label>
					            <div class="col-sm-7">
					                <fmt:formatDate value="${ticket.matchdate}" type="date" dateStyle="long"/> / 
					                <fmt:formatDate value="${ticket.matchtime}" type="time" timeStyle="short" />
					            </div>
					        </div>
					        <div class="form-group row">
					            <label for="quantity" class="col-sm-3 col-form-label form-label">수량</label>
					            <div id="ticketQuantity" data-ticket-quantity="${ticketQuantityBuy}" class="col-sm-7">${ticketQuantityBuy}개</div>
					        </div>
					        <div class="form-group row">
					            <label for="cancelDate" class="col-sm-3 col-form-label form-label">취소가능일시</label>
					            <div class="col-sm-7"><fmt:formatDate value="${ticket.canceldate}" type="date" dateStyle="long"/></div>
					        </div>
					    </div>
					</div>
					
					
					<!-- 결제정보 -->
					<div class="card mb-4">
					    <div class="card-header">결제정보</div>
					    <div class="card-body">
					    	<div class="form-group row">
						    	<label for="totalPrice" class="col-sm-3 col-form-label form-label">총 상품가격</label>
						    	<div class="col-sm-7" id="totalPriceDisplay" data-ticket-quantity="${ticketQuantityBuy}" data-ticket-price="${ticket.ticketprice}"></div>
					    	</div>
					        <div class="form-group row">
					            <label for="coupon" class="col-sm-3 col-form-label form-label">할인 쿠폰</label>
					            <div class="col-sm-7" ><button id="loadCoupon" class="btn btn-primary">쿠폰 불러오기</button></div>
					        </div>
					        <div class="form-group row">
					            <label for="finalPrice" class="col-sm-3 col-form-label form-label">총 결제금액</label>
					            <div class="col-sm-7" id="finalPriceDisplay"></div>
					        </div>
					     </div>
					 </div>
					      
					
					 <div class="d-flex justify-content-end mb-3">
						<button id="order" type="button" class="btn btn-primary mr-4">예매확정</button>
						<button id="cancel" type="button" class="btn btn-secondary mr-2">취소</button>
					</div>
				</div>
				
				<!-- 쿠폰 창 -->
				<div class="modal fade" id="couponModal" tabindex="-1" role="dialog" aria-labelledby="couponModalLabel" aria-hidden="true">
				    <div class="modal-dialog" role="document">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title" id="couponModalLabel">내 쿠폰 목록</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body">
				                <!-- 여기 쿠폰 표시 -->
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				            </div>
				        </div>
				    </div>
				</div> <!-- 예매확인 페이지 끝 -->
			</div>
		</div>

		<div id="footer">
			<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
		</div>
	</div>
</div>

	
<!-- 토스 결재창 -->
<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="paymentModalLabel">결제방식 선택</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="payment-method"></div>
            </div>
            <div class="modal-footer">
            	<button id="payment-request-button" type="button" class="btn btn-primary">결제하기</button>
                <button id="cancel" type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				
            </div>
        </div>
    </div>
</div> 
</body>
</html>


