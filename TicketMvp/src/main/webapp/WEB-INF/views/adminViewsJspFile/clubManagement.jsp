<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))        
	response.setHeader("Cache-Control", "no-cache");
%>  
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
	<link rel="stylesheet" type="text/css" href="/TicketMvp/resources/css/admin/admin.css">

</head>
 <style>
    #clubManagement {
       color: #c2d3fa; /* 배경 색상을 빨간색으로 변경 */
    }
</style>
    <body>
    <div id="body-wrapper">
	<div id="body-content">
		<div id="header">
			<jsp:include page="/WEB-INF/views/admin/admin_header.jsp" />
		</div>

		<div id="container" style="background-color: white;">
			<div id="sidebar">
			<jsp:include page="/WEB-INF/views/admin/admin_side.jsp" />
			</div>

			<div id="content">
				<div class="container-fluid">
                  				<br></br>
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">구단 관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h3 class="m-0 font-weight-bold text-primary">구단 리스트</h3>
	                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
										<tr>
											<th>구단명</th>
											<th>경기장</th>
											<th>소속리그</th>
											<th>구단삭제</th>
											<th>구단수정</th>       

										</tr>
									</thead>
                                    <tbody>
                                    <c:forEach items="${clubList}" var="clubManagement">
										<tr>
										<td>
                                			<a href="clubModify.do?club=${clubManagement.club}">${clubManagement.club}</a>
                            			</td>
										<td>${clubManagement.stadiumname}</td>
										<td>${clubManagement.league}</td>
										<td>
                                			<button class="btn btn-danger" id="deleteClub" >구단 정보 및 이미지 삭제</button>
                            			</td>
                            			<td>
                                			<button class="btn btn-dangerGRE" id="clubModify" >구단 정보 및 이미지 수정</button>
                            			</td>
										
										</tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                	<div id="actionButtons" style="display: block; ">
										<a href="${pageContext.request.contextPath}/adminViewsJspFile/clubRegister.do" class="clubRegister">구단 등록</a>
							    	</div>
                            </div>
                        </div>
                </div>
              </div>    
			</div>
		</div>

		<div id="footer">
			<jsp:include page="/WEB-INF/views/admin/admin_footer.jsp" />
		</div>
	</div>
</div>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
    </body>
</html>
