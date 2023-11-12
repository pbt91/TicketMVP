<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #clubModify {
       color: #c2d3fa;; 
    }
</style>

     <body>
     <div id="body-wrapper">
	<div id="body-content">
		<div id="header">
			<jsp:include page="/WEB-INF/views/admin/admin_header.jsp" />
		</div>

		<div id="container"  style="background-color: white;">
			<div id="sidebar">
			<jsp:include page="/WEB-INF/views/admin/admin_side.jsp" />
			</div>

			<div id="content">
			    <div class="container-fluid">
   		<form action="clubManageModify.do" method="post" enctype="multipart/form-data">

		    				<br></br>
		    <h1 class="h3 mb-2 text-gray-800">구단 수정</h1>
     		<div class="card shadow mb-4">
     		<div class="card-header py-3">
			<h3 class="m-0 font-weight-bold text-primary">구단 수정</h3>
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
                                <th>클럽</th>
                                <td>
									<a href='${pageContext.request.contextPath}/resources/images/club_images/${clubM.clubimgfilefull}_${clubM.clubimgfile}' style="max-width: 300px; max-height: 300px;">
									    <img src='${pageContext.request.contextPath}/resources/images/club_images/${clubM.clubimgfilefull}_${clubM.clubimgfile}' alt="클럽 이미지" style="max-width: 300px; max-height: 300px;">
									</a>
                                </td>
								<td>
                                    <input type="file" id="clubImg" name="clubImg"  onchange="displaySelectedImageClub(this)">
                                </td>
                                <td colspan="2">
							        <img id="selectedImageClub" name="selectedImageClub" src="" style="max-width: 300px; max-height: 300px;" alt="클럽 이미지">
							    </td>
                            </tr>
							<tr>
							    <th>클럽명</th>
							    <td colspan="3">
							    <input type="text" id="club" name="club" value="${clubM.club}"  readonly placeholder="클럽명." />
							    </td>
							</tr>
                            <tr>
                                <th>소속 리그</th>
                                <td colspan="3"><input type="text" id="league" name="league" value="${clubM.league}"  placeholder="소속 리그 입력해 주세요." /></td>
                            </tr>
							
							<tr>
                                <th>경기장</th>
                                <td>
									<a href='${pageContext.request.contextPath}/resources/images/stadium_images/${clubM.stadiumimgfilefull}_${clubM.stadiumimgfile}' style="max-width: 300px; max-height: 300px;">
									    <img src='${pageContext.request.contextPath}/resources/images/stadium_images/${clubM.stadiumimgfilefull}_${clubM.stadiumimgfile}' alt="경기장 이미지" style="max-width: 300px; max-height: 300px;">
									</a>	
                                </td>
								<td>
                                    <input type="file" id="stadiumImg" name="stadiumImg"  onchange="displaySelectedImageStadium(this)">
                                </td>
                                <td colspan="2">
							        <img id="selectedImageStadium" name="selectedImageStadium" src="" style="max-width: 300px; max-height: 300px;" alt="경기장 이미지">
							    </td>
                            </tr>                 
							
							<tr>
                                <th>경기장 이름</th>
                                <td colspan="3"><input type="text" id="stadiumname" name="stadiumname" value="${clubM.stadiumname}"  placeholder="경기장 이름 입력해 주세요."  /></td>
                            </tr>
                            
							
							<tr>
								<td colspan="2" align="center"><input type="submit" id="clubMo"	value=" 구단 수정 " /></td>
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


        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div id="page-content-wrapper">
                <!-- Page content-->
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
                 // 클럽 이미지 미리 보기 
                    function displaySelectedImageClub(input) {
                        var selectedImageClub = document.getElementById("selectedImageClub");
                        if (input.files && input.files[0]) {
                            var reader = new FileReader();
                            reader.onload = function(e) {
                                selectedImageClub.src = e.target.result;
                            };
                            reader.readAsDataURL(input.files[0]);
                        } else {
                            selectedImageClub.src = "";
                        }
                    }
    
                 // 경기장 이미지 미리 보기    
                    function displaySelectedImageStadium(input) {
                        var selectedImageStadium = document.getElementById("selectedImageStadium");
                        if (input.files && input.files[0]) {
                            var reader = new FileReader();
                            reader.onload = function(e) {
                            	selectedImageStadium.src = e.target.result;
                            };
                            reader.readAsDataURL(input.files[0]);
                        } else {
                        	selectedImageStadium.src = "";
                        }
                    }
    </script>
        <!-- Core theme JS-->
    </body>
</html>
