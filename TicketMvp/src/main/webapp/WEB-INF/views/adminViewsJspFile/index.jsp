<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 <script>
 google.charts.load('current', { 'packages': ['corechart'] });
 google.charts.setOnLoadCallback(drawChart);

 function drawChart() {
     // Java에서 전달한 JSON 데이터를 사용하여 차트를 그립니다.
     $.ajax({
         url: "chartTicketClubData.do",
         type: "GET",
         dataType: "json",
         success: function(data) {
             var jsonData = JSON.parse(data);
             var dataArray = [['Club Name', 'Ticket Sales']];
             for (var i = 0; i < jsonData.length; i++) {
                 dataArray.push([jsonData[i].clubName, jsonData[i].ticketSales]);
             }

             var data = google.visualization.arrayToDataTable(dataArray);

             var options = {
                 title : 'Monthly Ticket Sales by Club',
                 vAxis: {title: 'Ticket Sales'},
                 hAxis: {title: 'Club Name'},
                 seriesType: 'bars',
                 series: {1: {type: 'line'}}
             };

             var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
             chart.draw(data, options);
         },
         error: function(error) {
             console.log(error);
         }
     });
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

    </body>
  <jsp:include page="footer.jsp" />    
</html>
