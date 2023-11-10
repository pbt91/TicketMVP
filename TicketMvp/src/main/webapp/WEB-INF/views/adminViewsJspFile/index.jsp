<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!--     <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);

    function drawVisualization() {
        // Ajax를 사용하여 서버에서 데이터 가져오기
        $.ajax({
            url: "chartTicketClubData.do",
            type: "GET",
            dataType: "json",
            success: function(data) {
                // 데이터를 받아와서 차트를 그리는 로직 호출
                drawChartFromData(data);
            },
            error: function(error) {
                console.log(error);
            }
        });
    }

    function drawChartFromData(data) {
        // 초기 칼럼(열) 정보
        var chartData = [['선수명', '티켓 판매량']];

        // 서버에서 받아온 JSON 데이터 처리
        for (var i = 0; i < data.length; i++) {
            // 각 행의 데이터를 배열에 추가
            chartData.push([
                data[i].playerName,
                data[i].ticketSales
            ]);
        }

        // 차트 그리기
        var options = {
            title: '선수별 티켓 판매량',
            vAxis: { title: '티켓 판매량' },
            hAxis: { title: '선수명' },
            seriesType: 'bars',
            series: { 1: { type: 'line' } }
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(google.visualization.arrayToDataTable(chartData), options);
    }
    </script> -->
</head>
 <style>
    #index {
	background-color: #c2d3fa; /* 배경 색상을 빨간색으로 변경 */
    }
</style>
<body>
    <jsp:include page="headbar.jsp" />
        <!--Div that will hold the pie chart-->
    <div class="container-fluid">
   	<br></br>
    <h1 class="h3 mb-2 text-gray-800">관리자 차트</h1>
     <div class="card shadow mb-4">
     	<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">관리자 차트</h6>
		</div>
		<div id="chart_div" style="width: 900px; height: 500px;"></div>
	
	 </div>
   </div>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- chart.js -->
<div id="chart_div" style="width: 900px; height: 500px;"></div>

    </body>
  <jsp:include page="footer.jsp" />    
</html>
