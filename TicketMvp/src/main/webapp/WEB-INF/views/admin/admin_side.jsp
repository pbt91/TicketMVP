<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))        
	response.setHeader("Cache-Control", "no-cache");
%> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>사이드바</title>
<style type="text/css">
body {
	width:100%;
	higth:100%;
}	

aside {
	width:200px;
	higth:800px;

}
</style>
	<!-- js코드 호출 -->
</head>
<body>
	<div>
	<section class="main-content">
		<aside class="sidebar">
			<ul class="menu">
<%-- 							<li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/adminViewsJspFile/index.do" id="index" 
                    aria-expanded="true" aria-controls="collapseTwo">
                    <span>Charts</span>
                    
                </a>
            </li> --%>
           <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/adminViewsJspFile/userAdmin.do" id="userAdmin" 
                    aria-expanded="true" aria-controls="collapseTwo">
                    <span>회원 관리</span>
                    
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/adminViewsJspFile/ticket.do" id="ticket" 
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>경기 및 티켓 관리</span>
                </a>
            </li>
            
			<li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/adminViewsJspFile/ticketRegister.do" id="ticketRegister" 
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>경기 및 티켓 등록</span>
                </a>
            </li>
           
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/adminViewsJspFile/athleteManagement.do" id="athleteManagement" 
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>선수 관리</span>
                </a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/adminViewsJspFile/athleteRegister.do" id="athleteRegister" 
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>선수 등록</span>
                </a>
            </li>
            
			<li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/adminViewsJspFile/clubManagement.do" id="clubManagement" 
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>구단 관리</span>
                </a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/adminViewsJspFile/clubRegister.do" id="clubRegister" 
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>구단 등록</span>
                </a>
            </li>
            <li>
            	<a href="/TicketMvp//adminViewsJspFile/handleInquiry.do">문의 관리하기</a>
            </li>
            <li>
            	<a href="/TicketMvp/user/logout.do" class="logout-link">로그아웃</a>
            </li>     
			</ul>
		</aside>
	</section>
	</div>
</body>
</html>