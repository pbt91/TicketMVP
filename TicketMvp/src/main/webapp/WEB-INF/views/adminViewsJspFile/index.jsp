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
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
          ['2004/05',  165,      938,         522,             998,           450,      614.6],
          ['2005/06',  135,      1120,        599,             1268,          288,      682],
          ['2006/07',  157,      1167,        587,             807,           397,      623],
          ['2007/08',  139,      1110,        615,             968,           215,      609.4],
          ['2008/09',  136,      691,         629,             1026,          366,      569.6]
        ]);

        var options = {
          title : 'Monthly Coffee Production by Country',
          vAxis: {title: 'Cups'},
          hAxis: {title: 'Month'},
          seriesType: 'bars',
          series: {5: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
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
   <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div id="page-content-wrapper">
                <!-- Page content-->
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
