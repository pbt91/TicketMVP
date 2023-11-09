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
    #userAdmin {
        background-color: #c2d3fa; /* 배경 색상을 빨간색으로 변경 */
    }
</style>
    <body>
<jsp:include page="headbar.jsp" />
                <div class="container-fluid">
                    <!-- Page Heading -->
                    				<br></br>
                    <h1 class="h3 mb-2 text-gray-800">회원 관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">회원 리스트</h6>
	                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>회원ID</th>
                                            <th>이름</th>
                                            <th>Email</th>
                                            <th>전화번호</th>
                                            <th>회원삭제</th>
										</tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${userList}" var="user">
                                        <tr>
											<td>${user.userid}</td>
											<td>${user.name}</td>
											<td>${user.email}</td>
											<td>${user.phone}</td>
											<td>
                                				<button class="btn btn-danger" id="deleteUser" >유저 정보 삭제</button>
                            				</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                
                               		<div id="actionButtons" style="display: block; ">
							        <!-- 선택된 항목이 있을 때만 표시될 버튼들 -->
							        <button  id="deleteUser">선택한 회원 탈퇴</button>
							        <button  id="stopUser">선택한 회원 정지</button>
							    	</div> 
                            </div>
                        </div>

                </div>
                    </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
<jsp:include page="footer.jsp" />
    </body>
    
</html>
