<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.ticketmvp.*" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- EL 사용 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>

<title>나의 주문목록</title>
</head>
<body>
<%-- <%
	UserDAO userDAO = new UserDAO();
	ArrayList<UserOrderVO> list= userDAO.bookList();
%>
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
			<% for (int i=0; i<orderlist.size(); i++  ) %>
			<% for( UserOrderVO ordervo : list) %>
				<tr>
					<td><%=orderlist.getTicketname %></td>
					<td><%=orderlist.getTicketprice %></td>
					<td><%=orderlist.getTicketnum %></td>
					<td><%=orderlist.getDiscont %></td>
					<td><%=orderlist.getPaydate %></td>
					<td><%=orderlist.getReservestatus %></td>
				</tr>
			<%%>
			</tbody>
		</table>
	</form>
</div>
 --%>



</body>
</html>