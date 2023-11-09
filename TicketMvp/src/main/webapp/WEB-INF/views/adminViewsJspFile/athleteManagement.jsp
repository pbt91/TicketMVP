<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/adminTicketadd.js" type="text/javascript"></script>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    
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
    #athleteManagement {
        background-color: #c2d3fa; /* 배경 색상을 빨간색으로 변경 */
    }
    
</style>
    <body>
    <jsp:include page="headbar.jsp" />
	<div class="container-fluid">
					<br></br>
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">선수 관리</h1>
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">선수 리스트</h6>
	                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>선수명</th>
                                            <th>구단</th>
                                            <th>나이</th>
                                            <th>포지션</th>
                                            <th>등번호</th>
											<th>삭제</th>
										</tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${athleteList}" var="athleteManagement">
                                        <tr>
                                        	<td>
                                			<a href="athleteModify.do?athletename=${athleteManagement.athletename}">${athleteManagement.athletename}</a>
                            				</td>
											<td>${athleteManagement.club}</td>
											<td>${athleteManagement.age}</td>
											<td>${athleteManagement.position}</td>
											<td>${athleteManagement.backno}</td>
											<td>
                                				<button class="btn btn-danger" id="deleteAthlete" >삭제</button>
                            				</td>
											
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
								<div id="actionButtons" style="display: block; ">
						        		<a href="${pageContext.request.contextPath}/adminViewsJspFile/athleteRegister.do" class="athleteRegister">선수 등록</a>
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
