<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js" type="text/javascript"></script>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css1/sb-admin-2.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css1/sb-admin-2.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">

</head>
<style>
    #ticket {
        background-color: #c2d3fa; /* 배경 색상을 빨간색으로 변경 */
    }
</style>
    <body>
    <jsp:include page="headbar.jsp" />
                  <div class="container-fluid">
                  				<br></br>
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">경기 및 티켓 관리</h1>
    <c:if test="${not empty updateResult}">
        <div class="alert alert-success">${updateResult}</div>
    </c:if>
                    <!-- DataTales Example -->
<!-- 추가 버튼 -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">경기 및 티켓 리스트</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>홈구단vs원정구단</th>
                        <th>티켓명</th>
                        <th>가격</th>
                        <th>전체수량</th>
                        <th>남은수량</th>
                        <th>티켓번호</th>
                        <th>경기번호</th>
                        <th>경기시간</th>
                        <th>경기날짜</th>
                        <th>삭제</th> <!-- 추가: 삭제 버튼 헤더 -->

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${ticketList}" var="ticket">
                        <tr>
                            <td>${ticket.homeclub}vs${ticket.awayclub}</td>
                            <td>${ticket.ticketname}</td>
                            <td>${ticket.ticketprice}원</td>
                            <td>${ticket.ticketall}개</td>
                            <td>${ticket.ticketremain}개</td>
                            <td>
                                <a href="ticketModify.do?ticketid=${ticket.ticketid}">${ticket.ticketid}</a>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty ticket.ticketid}">
                                        ${ticket.matchid}
                                    </c:when>
                                    <c:otherwise>
                                        <a href="ticketModify.do?matchid=${ticket.matchid}">${ticket.matchid}</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${ticket.matchdate}</td>
                            <td>${ticket.matchtime}</td>
                            <td>
                                <button class="btn btn-danger" id="deleteTicket" >삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div id="actionButtons" style="display: block;">
                <a href="${pageContext.request.contextPath}/adminViewsJspFile/ticketRegister.do" class="ticketRegister">경기 및 티켓등록</a>
            </div>
        </div>
    </div>
</div>

                    </div>
	<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->

	
    </body>
        <jsp:include page="footer.jsp" />
</html>
