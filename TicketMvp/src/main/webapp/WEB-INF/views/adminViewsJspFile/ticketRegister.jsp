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
  #ticketRegister {
		background-color: #c2d3fa; /* 배경 색상을 빨간색으로 변경 */
    }
  #ticketstyle{
  font-weight: bold
  }
  .container{
  	text-align: center;
  }
</style>
    <body>
    <jsp:include page="headbar.jsp" />
    <div class="container-fluid">
    	<form action="saveMatchTicket.do"  method="post">
    				<br></br>
    <h1 class="h3 mb-2 text-gray-800">경기 및 티켓 등록</h1>
     <div class="card shadow mb-4">
     	<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">경기 등록</h6>
		</div>
		   <th:block layout:fragment="content">
        <div class="content">


                    <!--/* 서버로 전달할 공지글 여부 */-->
                    <input type="hidden" id="noticeYn" name="noticeYn" />
                    <table class="tb tb_row">
                        <colgroup>
                            <col style="width:15%;" /><col style="width:35%;" /><col style="width:15%;" /><col style="width:35%;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">등록일</th>
                                <td colspan="3"><input type="text" id="createdDate" name="createdDate" readonly /></td>
                            </tr>
							                            
                            <tr>
                                <th>홈구단 <span class="es">필수 입력</span></th>
                                <td colspan="3"><input type="text" id="homeclub" name="homeclub"  placeholder="홈구단 입력해 주세요." /></td>
                            </tr>
                            <tr>
                                <th>원정 구단<span class="es">필수 입력</span></th>
                                <td colspan="3"><input type="text" id="awayclub" name="awayclub"  placeholder="원정 구단 입력해 주세요." /></td>
                            </tr>
							
							<tr>
                                <th>경기 날짜<span class="es">필수 입력</span></th>
                                <td colspan="3"><input type="date" id="matchdate" name="matchdate"  placeholder="경기 날짜 입력해 주세요."  /></td>
                            </tr>
                            
                            <tr>
                                <th>경기 시간<span class="es">필수 입력</span></th>
                                <td colspan="3"><input type="time" id="matchtime" name="matchtime"  placeholder="경기 시간 입력해 주세요."  /></td>
                            </tr>
							
							<tr>
								<td colspan="2" align="center"><input type="submit"	value=" 경기 등록 " /></td>
							</tr>
                        </tbody>
                    </table>
                                  	
        </div> <!--/* .content */-->
    </th:block>
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
<%--                 <p class="btn_set">
                    <button type="button" id="saveBtn" onclick="ticketRegister();" class="btns btn_st3 btn_mid">경기 및 티켓 등록</button>
                    <a href="${pageContext.request.contextPath}/adminViewsJspFile/ticket.do" class="btns btn_bdr3 btn_mid">경기 및 티켓 관리로 돌아가기</a>
                </p> --%>

    <th:block layout:fragment="script">
        <script th:inline="javascript">
        /*<![CDATA[*/

            window.onload = () => {
                initCreatedDate();
            }


            // 등록일 초기화
            function initCreatedDate() {
                document.getElementById('createdDate').value = dayjs().format('YYYY-MM-DD');
            }



        /*]]>*/
        </script>
    </th:block>
     
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
        <script src="https://cdn.jsdelivr.net/npm/dayjs@1.10.6/dayjs.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/resources/js/admin/adminTicketadd.js"></script>
    </body>
  <jsp:include page="footer.jsp" />    
</html>
