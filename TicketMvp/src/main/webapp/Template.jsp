<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>메인 페이지</title>
    <meta charset="utf-8">
    <style>
        #container {
            display: flex;
            height: 1000px; 
            background-color: #f8f9fa; 
        }
        #container > #sidebar {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            max-height: 1000px;
            overflow: auto; 
        }
        #container > #content {
            flex: 9;
            padding: 10px;
            border: 1px solid #ccc;
            height: 100%; 
        }
        iframe {
            width: 100%;
            height: 100%; 
            border: none;
        }
    </style>
    <!-- js코드 호출 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="header">
		<jsp:include page="/WEB-INF/views/main/main_header.jsp" />
	</div>
    
    <div id="container">
        <div id="sidebar">
            여기 사이드바
        </div>
        <div id="content">
            여기 주요 내용
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
</body>
</html>