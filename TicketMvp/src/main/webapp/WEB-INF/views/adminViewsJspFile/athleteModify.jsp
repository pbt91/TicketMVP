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
    #athleteModify {
       color: #c2d3fa; 
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
			    <form action="athleteModifysubmit.do" method="post" enctype="multipart/form-data">
			
			    				<br></br>
			    <h1 class="h3 mb-2 text-gray-800">선수 수정</h1>
			     <div class="card shadow mb-4">
			     	<div class="card-header py-3">
						<h3 class="m-0 font-weight-bold text-primary">선수 수정</h3>
					</div>
			     	 <div class="content">
								
			                    <!--/* 서버로 전달할 공지글 여부 */-->
			                    <table class="tb tb_row">
			                          <colgroup>
			                            <col style="width:15%;" /><col style="width:35%;" /><col style="width:15%;" /><col style="width:35%;" />
			                        </colgroup>
			                        <tbody>
			                            <tr>
			                                <th>선수 이미지</th>
			                                <td>
			                                   	<a  href='${pageContext.request.contextPath}/resources/images/member_images/${athleteM.athleteimgfilefull }_${athleteM.athleteimgfile}'  style="max-width: 300px; max-height: 300px;">
												<img src='${pageContext.request.contextPath}/resources/images/member_images/${athleteM.athleteimgfilefull}_${athleteM.athleteimgfile}' alt="선수 이미지"  style="max-width: 300px; max-height: 300px;">
												</a>	
			                                </td>
											<td>
			                                    <input type="file" id="athleteImg" name="athleteImg"  onchange="displaySelectedImage(this)">
			                                </td>
			                                <td colspan="2">
										        <img id="selectedImage" name="athleteImg" src="" style="max-width: 300px; max-height: 300px;" alt="선수 이미지">
										    </td>
			                            </tr> 
			                            <tr>
										</tr>                
										
										<tr>
										<th>선수명</th>
			                                <td colspan="3"><input type="text" id="athletename" name="athletename"  value="${athleteM.athletename}"  placeholder="선수명 입력해 주세요." /></td>
			                            </tr>
			                            <tr>
			                                <th>선수 구단</th>
			                                <td colspan="3"><input type="text" id="club" name="club"  value="${athleteM.club}"  placeholder="선수 구단 입력해 주세요." /></td>
			                            </tr>
										
										<tr>
			                                <th>선수 나이</th>
			                                <td colspan="3"><input type="number" id="age" name="age"  value="${athleteM.age}"  placeholder="선수 나이 입력해 주세요."  /></td>
			                            </tr>
			                            
			                            <tr>
			                                <th>포지션</th>
			                                <td colspan="3"><input type="text" id="position" name="position"  value="${athleteM.position}"  placeholder="포지션 입력해 주세요."  /></td>
			                            </tr>
										
										<tr>
			                                <th>선수 등번호</th>
			                                <td colspan="3"><input type="number" id="backno" name="backno"  value="${athleteM.backno}"  placeholder="선수 등번호 입력해 주세요."  /></td>
			                            </tr>
			                            
			                            <tr>
			                                <th>선수 정보</th>
			                                <td colspan="3">
			                           		<textarea id="info" name="info" cols="50" rows="10"  placeholder="선수 경력 입력해 주세요.">${athleteM.info}</textarea>
			                           		</td>
			                                
			                            </tr>
			                            
			                            <tr>
			                                <th>선수 경력</th>
			                                <td colspan="3">
			                                <textarea id="career" name="career" cols="50" rows="10"  placeholder="선수 경력 입력해 주세요.">${athleteM.career}</textarea>
			                                </td>
			                            </tr>
										
										<tr>
											<td colspan="2" align="center"><input type="submit"	value=" 선수 수정 " /></td>
										</tr>
			                        </tbody>
			                    </table>
			                                  	
			        </div> <!--/* .content */-->
			     
			     
			     </div>
			     </form>
			     </div>
			</div>
		</div>

		<div id="footer">
			<jsp:include page="/WEB-INF/views/admin/admin_footer.jsp" />
		</div>
	</div>
</div>
<script>
    function displaySelectedImage(input) {
        var selectedImage = document.getElementById("selectedImage");
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                selectedImage.src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            selectedImage.src = "";
        }
    }
    
    
    </script>
    
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
           <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
    </body>
</html>
