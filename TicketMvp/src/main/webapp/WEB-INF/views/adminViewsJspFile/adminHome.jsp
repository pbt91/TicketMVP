<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<body>
<jsp:include page="headbar.jsp" />
                <!-- Begin Page Content -->
                <div class="container-fluid">
				<br></br>
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">회원관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
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
											<th><input type="checkbox" id="selectAll"
												onchange="selectAllCheckboxes(this)">
											</th>
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
								        		<input type="checkbox" name="selectedUser" value="${user.userid}" />
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

<jsp:include page="footer.jsp" />
</html>
