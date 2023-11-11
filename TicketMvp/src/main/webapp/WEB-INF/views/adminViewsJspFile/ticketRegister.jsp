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
  #ticketRegister {
		color: #c2d3fa; /* 배경 색상을 빨간색으로 변경 */
    }
  #ticketstyle{
  font-weight: bold
  }
  .container{
  	text-align: center;
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
    	<form action="saveMatchTicket.do"  method="post">
    				<br></br>
    <h1 class="h3 mb-2 text-gray-800">경기 및 티켓 등록</h1>
     <div class="card shadow mb-4">
     	<div class="card-header py-3">
			<h3 class="m-0 font-weight-bold text-primary">경기 등록</h3>
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
                                <th>홈구단</th>
                                <td colspan="3"><input type="text" id="homeclub" name="homeclub"  placeholder="홈구단 입력해 주세요." /></td>
                            </tr>
                            <tr>
                                <th>원정 구단</th>
                                <td colspan="3"><input type="text" id="awayclub" name="awayclub"  placeholder="원정 구단 입력해 주세요." /></td>
                            </tr>
							
							<tr>
                                <th>경기 날짜</th>
                                <td colspan="3"><input type="date" id="matchdate" name="matchdate"  placeholder="경기 날짜 입력해 주세요."  /></td>
                            </tr>
                            
                            <tr>
                                <th>경기 시간</th>
                                <td colspan="3"><input type="time" id="matchtime" name="matchtime"  placeholder="경기 시간 입력해 주세요."  /></td>
                            </tr>
							
							<tr>
								<td colspan="2" align="center"><input type="submit"	id= "matchsubmit" value=" 경기 등록 " /></td>
							</tr>
                        </tbody>
                    </table>
                                  	
        </div> <!--/* .content */-->
     </div>
                	
       <div class="card shadow mb-4">
     	<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">티켓 등록</h6>
		</div>   
        <div class="content">
		          <section> 
    	<table class="tb tb_row">	
		            	  <tbody>    	
                            <tr>
                                <th>티켓명 <span class="es">필수 입력</span></th>
                                <td colspan="3"><input type="text" id="ticketname" name="ticketname"  placeholder="티켓명 입력해 주세요." /></td>
                            </tr>
                            
							<tr>
                                <th>티켓 가격<span class="es">필수 입력</span></th>
                                <td colspan="3"><input type="number" id="ticketprice" name="ticketprice"  placeholder="티켓 가격 입력해 주세요." /></td>
                            </tr>
                            <tr>
                                <th>티켓 전체 수량 <span class="es">필수 입력</span></th>
                                <td colspan="3"><input type="number" id="ticketall" name="ticketall"  placeholder="티켓 전체 수량 입력해 주세요." /></td>
                            </tr>
                            
                            <tr>
                                <th>티켓 남은 수량 <span class="es">필수 입력</span></th>
                                <td colspan="3"><input type="number" id="ticketremain" name="ticketremain"  placeholder="티켓 남은 수량 입력해 주세요." /></td>
                            </tr>
                            
							<tr>
								<td colspan="2" align="center"><input type="submit" id="ticketsubmit"	value=" 티켓 등록 " /></td>
							</tr>
                            
                            <tr>
                                <th>선수명 <span class="es">필수 입력</span></th>
                                <td colspan="3"><textarea id="content" name="content" cols="50" rows="10" placeholder="내용을 입력해 주세요."></textarea></td>
                            </tr>
                           </tbody>
                          </table> 
				</section>
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

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/dayjs@1.10.6/dayjs.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
    </body>
</html>
