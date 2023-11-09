<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <title>관리자 - 문의에 답변하기</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> 
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css1/sb-admin-2.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css1/sb-admin-2.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/dayjs@1.10.6/dayjs.min.js"></script>
	<!-- Core theme JS-->
	<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
	
	<!-- js코드 연결 -->
    <script src="/TicketMvp/resources/js/admin/replyToInquiryForm.js"></script>
</head>
<body>
    <jsp:include page="headbar.jsp" />
    <div class="container-fluid">
    	<form action="replyToInquiry.do" method="post">                	
	       	<div class="card shadow mb-4">
	     		<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">문의 답변</h6>
				</div>   
	        	<div class="content">
					<section> 
	    				<table class="tb tb_row">	
			          		<tbody>    	
			                    <tr>
			                        <th>번호</th>
			                        <td colspan="3" id="helpid">${inquiry.helpid}</td>
			                    </tr>                  
								<tr>	
									<th>제목</th>
									<td colspan="3">${inquiry.helptitle}</td>
								</tr>
								<tr>
									<th>회원</th>
									<td colspan="3">${inquiry.userid}</td>
	                     		</tr>
								<tr>
								    <th>상품이름</th>
								    <td colspan="3">
								        <c:choose>
								            <c:when test="${empty inquiry.helpproduct}">
								                문의 상품없음
								            </c:when>
								            <c:otherwise>
								                ${inquiry.helpproduct}
								            </c:otherwise>
								        </c:choose>
								    </td>
								</tr>
								<tr>
								    <th>작성일</th>
								    <td colspan="3">${inquiry.helpdate}</td>
								</tr>
								<tr>
								    <th>내용</th>
								    <td colspan="3">
										<textarea readonly cols="50" rows="5">${inquiry.helptext}</textarea>
									</td>
								</tr>         
								<tr>
								    <th>답변 작성 <span class="es">필수 입력</span></th>
								    <td colspan="3"><textarea id="replytext" name="replytext" cols="50" rows="10" placeholder="내용을 입력해 주세요.">${inquiry.replytext}</textarea></td>
								</tr>
								<tr>
									<td colspan="2" align="center"><input type="submit" id="replysubmit" value="${empty inquiry.replytext ? '답변 등록' : '수정 등록'}" /></td>
								</tr>
	                   		</tbody>
	                   </table> 
					</section>
				</div> 
	       </div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />   
</body>   
</html>
