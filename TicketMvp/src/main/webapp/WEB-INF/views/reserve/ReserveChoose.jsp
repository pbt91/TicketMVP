<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>경기 예매 - 좌석 선택</title>
	<!-- Jquery 호출 -->
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- Bootstrap 호출 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<!-- js코드 호출 -->
	<script src="/TicketMvp/resources/js/reserve/ReserveChoose.js"></script>
	<!-- css 호출 -->
	<link rel="stylesheet" href="/TicketMvp/resources/css/ReserveChoose.css">
</head>
<body>
<!-- 예매 페이지 전체 -->
<div id="reserveMain">
	<div class="container-fluid mt-5">
        <div class="row">		
			<!-- 좌석 별 티켓 리스트 -->
			<div class="col-md-7" id="reserveTicketList">
			    <ul class="list-group">
			    	
			    	<!-- 티켓 수량 있는 확인 -->
			    	<c:set var="ticketNone" value="true" />
			    	
			    	<!-- 티켓을 DB에서 불러와서 표시 -->
			        <c:forEach items="${ticketList}" var="ticket" varStatus="loop">
		    			<c:if test="${ticket.ticketremain > 0}">
		    				<c:set var="ticketNone" value="false" />
		       			 	<li class="list-group-item d-flex justify-content-between align-items-center" data-ticketId="${ticket.ticketid}" >
		           				<div class="d-flex flex-row">
		                			<img src="/TicketMvp/resources/images/soccer-ticket.png" class="soccer-ticket">
		                			<div class="ml-2">
		                    			<h6 class="mb-0">${ticket.ticketname}</h6>
		                    			<div class="ticket-info"><span price="${ticket.ticketprice}">표당 ${ticket.ticketprice}원</span>
		                        			<br><span>${ticket.ticketremain}좌석 남음</span>
		                    			</div>   
		                			</div>
		            			</div>
		        			</li>
		    			</c:if>   
					</c:forEach>
					
					<!-- 티켓이 모두 없으면 표시되는 메시지 -->		
					<c:if test="${ticketNone}">
						<div id="noTickets" class="message-container">해당 경기의 티켓이 없습니다.</div>
					</c:if>
			    </ul>
			</div> 
			<!-- 좌석 별 티켓 리스트 끝 -->
			
			<!-- 예매 페이지 정보 사이드페이지 -->
			<div class="col-md-5" id="reserveSide">
				<div id="reserveSideContent">
					<!-- 경기장 이미지 -->
				    <c:choose>
				    	<c:when test="${stadiumImage.stadiumimgsize > 0}">
				            <!-- 경기장 이미지 -->
				        	<div class="text-center mb-4"><img id="stadium" alt="${stadiumImage.stadiumname} 좌석 지도" src="/TicketMvp/resources/images/stadium/${stadiumImage.stadiumimgfilefull}_${stadiumImage.stadiumimgfile}" id="stadiumMap" class="reserveSide"></div>
				        </c:when>
				        <c:otherwise>
				            <div id="stadiumMissing" class="message-container reserveSide">
				                경기장 지도가 없습니다.
				            </div>
				        </c:otherwise>
				    </c:choose>
					<!-- 경기장 이미지 끝-->
					
					<!-- 경기장 이름, 시간  -->
					<div class="text-center mb-4" id="matchDate" class="reserveSide">
						<h4 id="stadiumName">${stadiumImage.stadiumname}</h4>
                    	<p id="matchDay"><c:choose>
							    <c:when test="${not empty ticketList[0].matchdate}">
							        <fmt:parseDate value="${ticketList[0].matchdate}" pattern="yyyy-MM-dd" var="parsedDate" />
							        <fmt:formatDate value="${parsedDate}" pattern="yyyy'년' MM'월' dd'일'" var="formattedDate" />
							        <p id="matchDay">경기일: ${formattedDate}</p>
							    </c:when>
							    <c:otherwise>
							        <p id="matchDay">경기일: 0000년 00월 00일</p>
							    </c:otherwise>
							</c:choose>
						</p>
                    	<p id="matchTime">
                    		<c:choose><c:when test="${not empty ticketList[0].matchtime}">
							        <fmt:parseDate value="${ticketList[0].matchtime}" pattern="HH:mm:ss" var="parsedTime" />
							        <fmt:formatDate value="${parsedTime}" pattern="a hh'시' mm'분'" var="formattedTime" />
							        <p id="matchTime">경기시간: ${formattedTime}</p>
							    </c:when>
							    <c:otherwise>
							        <p id="matchTime">경기시간: 오전/오후 00시 00분</p>
							    </c:otherwise>
							</c:choose>
                    	</p>
					</div>
					<!-- 경기장 이름, 시간  끝-->
					
					<!-- 수량표시, 금액 -->
					<div class="form-group text-center" id="pickQuantity">
						<label id="matchName" class="mb-3">티켓을 선택해주세요</label> <br/>
						<label for="ticketQuantity" class="hidden-input">수량을 선택해주세요:</label> <br/>
    					<input size="5" type="number" id="ticketQuantity" class="hidden-input form-control" name="ticketQuantity" min="1" value="1"> <br/>
    					<p class="mt-2">총금액: <span id="totalAmount">0</span>원</p>
					</div>
					<!-- 수량표시, 금액 끝-->
					
					<!-- 결제 -->
					<div class="text-center">
                       	<button id="purchase" class="btn btn-primary">예매하기</button>
                   	</div>
					<!-- 결제 끝-->
					
				</div>   		
			</div>	
			<!-- 예매 페이지 정보 사이드페이지 끝-->
			
		</div> <!-- #row div 끝 -->
	</div>
</div>
<!-- 예매 페이지 전체 -->

<!-- 경기장 이미지 팝업 -->
<div id="stadiumPopup" class="popup">
    <img id="stadiumPopupImage" src="" alt="${stadiumImage.stadiumname}" class="img-fluid">
</div>

<!-- 예매확인 팝업창 -->
<div class="modal fade" id="reservationInfoModal" tabindex="-1" role="dialog" aria-labelledby="reservationInfoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
        	<form id="reservationForm" action="/TicketMvp/reserve/ReserveConfirm.do" method='post'>
       			<div class="modal-header bg-primary text-white">
	                <h5 class="modal-title" id="reservationInfoModalLabel">예약정보</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                <p><strong>경기장:</strong> <span id="reservationStadium"></span></p>
	                <p><strong>경기일:</strong> <span id="reservationDate"></span></p>
	                <p><strong>경기시간:</strong> <span id="reservationTime"></span></p>
	                <p><strong>좌석:</strong> <span id="reservationSeat"></span></p>
	                <p><strong>수량:</strong> <span id="reservationQuantity"></span></p>
	                <p><strong>총 금액:</strong> <span id="reservationTotal"></span>원</p>
					<input type="hidden" id="ticketId" name="ticketId" />
					<input type="hidden" id="ticketQuantityBuy" name="ticketQuantityBuy" />
	                <br/>
	                <p>이대로 예매하시겠습니까?</p>
	            </div>
	            <div class="modal-footer">
	                <button id="purchaseConfirm" class="btn btn-primary ajaxlink">예매확인</button>
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	            </div>
        	</form>
        </div>
    </div>
</div>

<!-- 로그인 확인 -->
<c:choose>
    <c:when test="${sessionScope.userid != null}">
        <input type="hidden" id="userLoggedIn" value="true" />
    </c:when>
    <c:otherwise>
        <input type="hidden" id="userLoggedIn" value="false" />
    </c:otherwise>
</c:choose>
</body>
</html>

<!-- /TicketMvp/reserve/ReserveChoose.do -->