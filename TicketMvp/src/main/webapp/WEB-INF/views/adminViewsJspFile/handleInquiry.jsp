<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 - 문의하기 관리</title>

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

	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- jquery 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <!-- js코드 연결 -->
    <script src="/TicketMvp/resources/js/admin/handleInquiry.js"></script>
</head>
<body>
<jsp:include page="headbar.jsp" />

	<!-- 문의 리스트 -->
	<div class="container-fluid"><br></br>
		<h1 class="h3 mb-2 text-gray-800">문의 관리</h1>
		<div class="card shadow mb-4">
        	<div class="card-header py-3">
         		<h6 class="m-0 font-weight-bold text-primary">문의 리스트</h6>
          	</div>
          	<div class="card-body">
           		<div class="table-responsive">
                	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    	<thead>
              				<tr>
                        		<th>번호</th>
                        		<th>제목</th>
                        		<th>회원</th>
                       			<th>작성일</th>
								<th>답글</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${inquiryList}" var="inquiry">
								<c:choose>
									<c:when test="${not empty inquiry}">
										<tr>
											<td>${inquiry.helpid}</td>
											<td class="helptitle">${inquiry.helptitle}</td>
											<td>${inquriy.userid}</td>
											<td>${inquiry.helpdate}</td>
											<c:choose>
												<c:when test="${not empty inquiry.replydate}">
													<td>완료</td>
												</c:when>
												<c:otherwise>
													<td>대기</td>
												</c:otherwise>
											</c:choose>
			                        	</tr>
									</c:when>
									<c:otherwise>
										<span>불러올 문의글이 없습니다</span>
									</c:otherwise>
								</c:choose>
				
                        	</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>  <!-- 문의 리스트 끝-->
<jsp:include page="footer.jsp" />
</body>

</html>
