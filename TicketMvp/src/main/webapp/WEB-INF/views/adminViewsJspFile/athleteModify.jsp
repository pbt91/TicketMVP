<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #athleteModify {
        background-color: #c2d3fa; 
    }
</style>
    <body>
    <jsp:include page="headbar.jsp" />
    <div class="container-fluid">
    <form action="athleteModify" method="post" enctype="multipart/form-data">

    				<br></br>
    <h1 class="h3 mb-2 text-gray-800">선수 수정</h1>
     <div class="card shadow mb-4">
     	<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">선수 수정</h6>
		</div>
     	 <div class="content">


                    <!--/* 서버로 전달할 공지글 여부 */-->
                    <input type="hidden" id="noticeYn" name="noticeYn" />
                    <table class="tb tb_row">
                          <colgroup>
                            <col style="width:15%;" /><col style="width:35%;" /><col style="width:15%;" /><col style="width:35%;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>선수 이미지<span class="es">필수 입력</span></th>
                                <td>
                                    <input type="file" id="athleteImg" name="athleteImg"  onchange="displaySelectedImage(this)">
                                </td>
                            </tr> 
                            <tr>
							    <td colspan="2">
							        <img id="selectedImage" src="" style="max-width: 300px; max-height: 300px;" alt="선수 이미지">
							    </td>
							</tr>                
							
							<tr>
							<th>선수명 <span class="es">필수 입력</span></th>
                                <td colspan="3"><input type="text" id="athletename" name="athletename"  placeholder="선수명 입력해 주세요." /></td>
                            </tr>
                            <tr>
                                <th>선수 구단<span class="es">필수 입력</span></th>
                                <td colspan="3"><input type="text" id="club" name="club"  placeholder="선수 구단 입력해 주세요." /></td>
                            </tr>
							
							<tr>
                                <th>선수 나이<span class="es">필수 입력</span></th>
                                <td colspan="3"><input type="number" id="age" name="age"  placeholder="선수 나이 입력해 주세요."  /></td>
                            </tr>
                            
                            <tr>
                                <th>포지션<span class="es">필수 입력</span></th>
                                <td colspan="3"><input type="text" id="position" name="position"  placeholder="포지션 입력해 주세요."  /></td>
                            </tr>
							
							<tr>
                                <th>선수 등번호<span class="es">필수 입력</span></th>
                                <td colspan="3"><input type="number" id="backno" name="backno"  placeholder="선수 등번호 입력해 주세요."  /></td>
                            </tr>
                            
                            <tr>
                                <th>선수 정보<span class="es">필수 입력</span></th>
                                <td colspan="3"><input type="text" id="info" name="info"  placeholder="선수 정보 입력해 주세요."  /></td>
                            </tr>
                            
                            <tr>
                                <th>선수 경력<span class="es">필수 입력</span></th>
                                <td colspan="3">
                                <input type="text" id="career" name="career"  placeholder="선수 경력 입력해 주세요."  />
                                <textarea id="career" name="career" cols="50" rows="10" placeholder="선수 경력 입력해 주세요."></textarea>
                                </td>
                            </tr>
							
							<tr>
								<td colspan="2" align="center"><input type="submit"	value=" 선수 등록 " /></td>
							</tr>
                        </tbody>
                    </table>
                                  	
        </div> <!--/* .content */-->
     
     
     </div>
     </form>
     </div>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div id="page-content-wrapper">
                <!-- Page content-->
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
           <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
    <jsp:include page="footer.jsp" />   
    </body>
</html>
