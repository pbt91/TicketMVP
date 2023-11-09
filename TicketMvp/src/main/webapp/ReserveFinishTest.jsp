<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<script src="/TicketMvp/resources/js/ReserveFinish.js"></script>
	<!-- css 호출 -->
	<link rel="stylesheet" href="/TicketMvp/resources/css/ReserveFinish.css">
</head>
<body>
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
		                           <div class="col-sm-8"></div>
		                       </div>
		                       <div class="form-group row">
		                           <label class="col-sm-4 col-form-label">상품명:</label>
		                           <div class="col-sm-8"></div>
		                       </div>
		                       <div class="form-group row">
		                           <label class="col-sm-4 col-form-label">개수:</label>
		                           <div class="col-sm-8">장</div>
		                       </div>
		                       <div class="form-group row">
		                           <label class="col-sm-4 col-form-label">결제금액:</label> 	
		                           <div class="col-sm-8">원</div>
		                       </div>
		                       <div class="form-group row">
		                           <label class="col-sm-4 col-form-label">결제일시:</label>
		                           <div class="col-sm-8"></div>
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
	</section>
</body>
</html>