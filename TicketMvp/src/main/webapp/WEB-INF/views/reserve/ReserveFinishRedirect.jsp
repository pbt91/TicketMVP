<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Redirecting...</title>
    <script type="text/javascript">
        function openReserveFinish() {
            var orderId = '<%= request.getAttribute("orderId") %>';
            var amount = '<%= request.getAttribute("amount") %>';
            var url = '/TicketMvp/reserve/ReserveFinish.do?orderId=' + orderId + '&amount=' + amount;
            window.open(url, '_blank');
        }
    </script>
</head>
<body onload="openReserveFinish()">
    <p>결재화면 이동</p>
</body>
</html>