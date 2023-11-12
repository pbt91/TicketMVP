<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인화면</title>

    <!-- 필수, 헤더에 넣기 -->
    <link rel="stylesheet" type="text/css" href="/TicketMvp/resources/css/admin/admin.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    

</head>
    <style>
    	#rotate-text {
    		font-size: 120px;
    		text-align: center;
   			 transform: rotate(45deg);
   			 position: relative;
   			 top: 143px; /* 텍스트를 아래로 50px 이동 */
   			 width: 468px;
   			 margin: auto;
   			 

    	}
    @keyframes rotateText {
      from {
        transform: rotate(0deg);
      }
      to {
        transform: rotate(360deg);
      }
    }

    .rotating-text {
      font-size: 24px;
      animation: rotateText 5s linear infinite; /* 5초 동안 360도 회전, 무한 반복 */
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
                    <!-- 여기 사이드바 -->
                    <jsp:include page="/WEB-INF/views/admin/admin_side.jsp" />
                </div>

                <div id="content">
                    <h1 style="color: #343a40; text-align: center;">관리자 페이지</h1>
                    <!-- 여기내용 -->
                    <div id="rotate-text" class="rotating-text">
                    TICKET MVP
                    </div>
                </div>
            </div>

            <div id="footer">
                <jsp:include page="/WEB-INF/views/admin/admin_footer.jsp" />
            </div>
        </div>
    </div>
    <!-- Begin Page Content -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
