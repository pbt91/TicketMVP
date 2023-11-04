<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>접근 오류</title>
    <!-- Bootstrap 호출 (디자인을 위해) -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">
                <h1>잠깐만요!</h1>
                <h2>로그인 필요</h2>
                <div class="error-details">
                    죄송합니다, 이 페이지를 보려면 로그인이 필요합니다.
                </div>
                <div class="error-actions mt-4">
                    <a href="login.jsp" class="btn btn-primary btn-lg">
                        <span class="glyphicon glyphicon-home"></span>
                        로그인 페이지로 이동 
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>