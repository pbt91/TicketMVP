<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Simple Sidebar - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/resources/js/admin.js" rel="stylesheet" type="text/js">
    </head>
 <style>
    a#athlete12 {
        background-color: #dedede; /* 배경 색상을 빨간색으로 변경 */
    }
</style>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
             <jsp:include page="sidebar.jsp" />
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="#!">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="#!">Link</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#!">Action</a>
                                        <a class="dropdown-item" href="#!">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#!">Something else here</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
 		<div class="athlete" >
			<h3>선수 관리</h3>
			<table>
			<tr>
			<th>선수명</th>
			<th>구단</th>
			<th>나이</th>
			<th>포지션</th>   
			<th>등번호</th>   
			     
			<th>
                <input type="checkbox" id="selectAll" onchange="selectAllCheckboxes(this)">
            </th>
			</tr>
			<c:forEach items="${athleteList}" var="athleteManagement">
			<tr>
			<td>${athleteManagement.athletename}</td>
			<td>${athleteManagement.club}</td>
			<td>${athleteManagement.age}</td>
			<td>${athleteManagement.position}</td>
			<td>${athleteManagement.backno}</td>
			
			<td>
        		<input type="checkbox" name="selectedUser" value="${athleteManagement.athletename}" />
      		</td>
			</tr>
			</c:forEach>
			</table>
		 </div>
		<div id="actionButtons" style="display: block; ">
        <!-- 선택된 항목이 있을 때만 표시될 버튼들 -->        
        		<a href="athleteRegister" class="athleteRegister">선수 등록</a>
				<a href="athleteModify" class="athleteModify">선수 수정</a>
				<a href="athleteManagement" class="athleteManagement3">선수 삭제</a>
        
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
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
    </body>
</html>
