<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ticketmvp.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquergy 코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- js코드 연결 -->
<script src='/TicketMvp/resources/js/user/userMyOrderList.js' type="text/javascript"></script>
<!-- css 파일 연결 - main -->
<link rel="stylesheet" href="/TicketMvp/resources/css/main/templates.css">
<!-- css 파일 연결 - page -->
<link rel="stylesheet" href="/TicketMvp/resources/css/user/userMyOrderList.css">
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
								<th>할인율</th>
								<th>결제금액</th>
								<th>결제일</th>
								<th>상태</th>
								<th>예약 취소하기</th>
							</tr>
						</thead>
						<tbody>
						    <c:forEach items="${order}" var="order">
						        <tr>
						            <td>${order.ticketname}</td>
						            <td>${order.ticketprice}</td>
						            <td>${order.totalseat}</td>
						            <td>${order.discount}%</td>
						            <td>${order.totalpayment}</td>
						            <td>${order.paydate}</td>
						            <td>${order.reservestatus}</td>
						            <c:if test="${!order.reservestatus.equals('예약취소')}">
                                        <td><button class="cancel">취소</button></td>
                                    </c:if>
                                    <td><input type="hidden" value="${order.reserveid}"></td>
						        </tr>
						    </c:forEach>
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