<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ticketmvp.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- js 코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- css 파일 연결 - main -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/main/templates.css">
<!-- css 파일 연결 - page -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/user/userMyOrderList.css">


<title>나의 주문목록</title>
</head>
<body>

	<div id="header">
		<jsp:include page="/WEB-INF/views/main/main_header.jsp" />
	</div>

	<div id="container">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/main/main_sidebar.jsp" />
		</div>
		<div id="content">
			<h2>내 주문목록</h2>
			<div id="div_orderlist" class="orderlist">
				<form id="form_orderlist" class="orderlist" action="" method="post">
					<table id="tb_orderlist">
						<thead>
							<tr>
								<th>상품명</th>
								<th>가격</th>
								<th>개수</th>
								<th>할인</th>
								<th>결제금액</th>
								<th>결제일</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
							</tr>
							<tr>
								<td>2</td>
								<td>2</td>
								<td>2</td>
								<td>2</td>
								<td>2</td>
								<td>2</td>
								<td>2</td>
							</tr>
							<%-- <c:forEach items="${orderList}" var="list">
					<tr>
						<td>${UserOrder.ticketname}</td>	<!-- 상품명 -->
						<td>${UserOrder.ticketname}</td>	<!-- 개당가격 -->
						<td>${UserOrder.ticketname}</td>	<!-- 개수 -->
						<td>${UserOrder.ticketname}</td>	<!-- 할인정보 -->
						<td>${UserOrder.ticketname}</td>	<!-- 결제금액 -->
						<td>${UserOrder.ticketname}</td>	<!-- 결제일 -->
						<td>${UserOrder.ticketname}</td>	<!-- 주문상태 -->
					</tr>
				</c:forEach> --%>
						</tbody>
					</table>
				</form>
			</div>
		</div> <!-- end of div#content -->
	</div> <!-- end of div#container -->


	<div id="footer">
		<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
	</div>




</body>
</html>