<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
    #clubManagement {
       background-color: #c2d3fa; /* 배경 색상을 빨간색으로 변경 */
    }
</style>
    <body>
	<jsp:include page="headbar.jsp" />
                  <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">구단 관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">구단 리스트</h6>
	                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
										<tr>
											<th>구단명</th>
											<th>선수명</th>
											<th>경기장</th>
											<th>소속리그</th>       
											<th>
							                	<input type="checkbox" id="selectAll" onchange="selectAllCheckboxes(this)">
							            	</th>
										</tr>
									</thead>
                                    <tbody>
                                    <c:forEach items="${clubList}" var="clubManagement">
										<tr>
										<td>${clubManagement.club}</td>
										<td>${clubManagement.athletename}</td>
										<td>${clubManagement.stadiumname}</td>
										<td>${clubManagement.league}</td>
										
										<td>
							        		<input type="checkbox" name="selectedUser" value="${clubManagement.club}" />
							      		</td>
										</tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                	<div id="actionButtons" style="display: block; ">
										<a href="${pageContext.request.contextPath}/adminViewsJspFile/clubRegister.do" class="clubRegister">구단 등록</a>
										<a href="${pageContext.request.contextPath}/adminViewsJspFile/clubModify.do" class="clubModify">구단 수정</a>
										<a href="${pageContext.request.contextPath}/adminViewsJspFile/clubManagement.do" class="clubManagement">구단 삭제</a>
							    	</div>
                            </div>
                        </div>
									<script>
										function selectAllCheckboxes(checkbox) {
											var checkboxes = document.getElementsByName("selectedUser");
											for (var i = 0; i < checkboxes.length; i++) {
												checkboxes[i].checked = checkbox.checked;
											}
										}
									</script>
                </div>
                    </div>    

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
    </body>
<jsp:include page="footer.jsp" />
</html>