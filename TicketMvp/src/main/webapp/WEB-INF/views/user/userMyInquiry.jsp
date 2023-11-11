<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">

<title>내 문의글</title>

<meta charset="UTF-8">

<!-- js 코드 호출 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- css 파일 연결 - main -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/main/templates.css">
<!-- css 파일 연결 - page -->
<link rel="stylesheet"
	href="/TicketMvp/resources/css/user/userMyInquiry.css">
<!-- js파일 연결 -->
<script src="/TicketMvp/resources/js/user/userMyInquiry.js"	type="text/javascript"></script>

</head>
<body>


	<div id="header">
		<jsp:include page="/WEB-INF/views/main/main_header.jsp" />
	</div>

	<div id="container">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/main/main_sidebar.jsp" />
		</div>
		<div id="content">
			<div class="board_wrap">
				<div id="list">
					<!-- 글목록 -->
					<div class="board_title">
						<strong>문의사항</strong>
						<p>문의주신 내용에 빠르게 안내드리겠습니다</p>
					</div>
					<div class="board_list_wrap">
						<div class="board_list">
							<div class="top">
								<div class="num">번호</div>
								<div class="title">제목</div>
								<div class="writer">글쓴이</div>
								<div class="date">작성일</div>
								<div class="reply">답글</div>
							</div>
							<c:choose>
					            <c:when test="${inquiryList != null && not empty inquiryList}">
					                <c:forEach var="inquiry" items="${inquiryList}">
					                    <div>
					                        <div class="num">${inquiry.helpid}</div>
					                        <div class="title">
					                            <a href="javascript:loadInquiry(${inquiry.helpid})">${inquiry.helptitle}</a>
					                        </div>
					                        <div class="writer">${inquiry.userid}</div>
					                        <div class="date">${inquiry.helpdate}</div>
					                        <div class="reply">
					                            <c:choose>
					                                <c:when test="${not empty inquiry.replydate}">완료</c:when>
					                                <c:otherwise>대기</c:otherwise>
					                            </c:choose>
					                        </div>
					                    </div>
					                </c:forEach>
					            </c:when>
					            <c:otherwise>
					                <span class="tb-center" style="font-size: 20px; position: absolute;">아직 작성된 글이 없습니다</span>
					            </c:otherwise>
					        </c:choose>
						</div>
						<div class="board_page">
					        <c:if test="${currentPage != 1}">
					            <a href="javascript:loadPage(${currentPage - 1})" class="bt prev">&lt;</a>
					        </c:if>
					
					        <c:forEach begin="1" end="${totalPages}" var="i">
					            <a href="javascript:loadPage(${i})" class="num ${currentPage == i ? 'on' : ''}">${i}</a>
					        </c:forEach>
					
					        <c:if test="${currentPage != totalPages}">
					            <a href="javascript:loadPage(${currentPage + 1})" class="bt next">&gt;</a>
					        </c:if>
					    </div>
						<div class="bt_wrap">
							<a id="inquiryinsertform" class="on">등록</a>
						</div>
					</div>
				</div>
				<!-- end of hide 할 부분 -->




				<div id="input">
					<!-- 글쓰기 -->
					<div class="board_title">
						<strong>문의글 작성</strong>
						<p>문의주신 내용에 빠르게 안내드리겠습니다</p>
					</div>
					<div class="board_write_wrap">
						<div class="board_write">
							<div class="title">
								<dl>
									<dt>제목</dt>
									<dd>
										<input id="inputtitle" type="text" placeholder="제목 입력">
									</dd>
								</dl>
							</div>
							<div class="info">
								<dl>
									<dt>상품명</dt>
									<dd>
										<input id="inputproduct" type="text"
											placeholder="상품명 입력 필수값아님">
									</dd>
								</dl>
							</div>
							<div class="cont">
								<textarea id="inputtext" placeholder="내용 입력"></textarea>
							</div>
						</div>
						<div class="bt_wrap">
							<a id="inquiryinsert" class="on">등록</a> <a id="inquirylist">취소</a>
						</div>
					</div>
				</div>
				<!-- hide 할 부분 -->




				<div id="view">
					<!-- 보드 뷰 -->
					<div class="board_wrap">
						<div class="board_title">
							<strong>문의사항</strong>
							<p>문의주신 내용에 빠르게 안내드리겠습니다</p>
						</div>
						<div class="board_view_wrap">
							<div class="board_view">
								<div class="title"></div>
								<div class="info">
									<dl>
										<dt>번호</dt>
										<dd>1</dd>
									</dl>
									<dl>
										<dt>글쓴이</dt>
										<dd></dd>
									</dl>
									<dl>
										<dt>작성일</dt>
										<dd></dd>
									</dl>
									<dl>
										<dt>상품명</dt>
										<dd></dd>
									</dl>
								</div>
								<div class="cont">
									
								</div>
								
								
								<div class="info" id="reply_view">
									<dl>
										<dt>관리자 답글 작성일</dt>
										<dd></dd>
									</dl>
									<div class="cont reply">
								
									</div>
								</div>
								
								
							</div>
							<div class="bt_wrap">
								<a href="/TicketMvp/user/userMyInquiry.do" class="on">목록</a> <a id="inquirymydelete">삭제</a>
							</div>
						</div>
					</div>



				</div>
















			</div>
		</div>
		<!-- end of div#content -->
	</div>
	<!-- end of div#container-->


	<div id="footer">
		<jsp:include page="/WEB-INF/views/main/main_footer.jsp" />
	</div>


</body>
</html>




