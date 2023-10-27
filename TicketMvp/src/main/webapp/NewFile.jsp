<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Simple JSP Page</title>
</head>
<body>
    <h1>Welcome to My Simple JSP Page</h1>
    <p>This is a basic JSP example.</p>
    
    <%
        // Java code within JSP
        String name = "John Doe";
    %>
    
    <p>Hello, <%= name %>!</p>
    
    <ul>
        <li>Item 1</li>
        <li>Item 2</li>
        <li>Item 3</li>
    </ul>
</body>
</html>