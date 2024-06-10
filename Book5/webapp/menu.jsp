<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	String sessionId=(String) session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header class="pb-3 mb-4 border-bottom">
	<a href = "./welcome.jsp" class="d-flex align-items-center text-dark text-decoration-none">
		<svg width = "32" height = "32" file = "currentColor" class ="bi bi-house-fill" viewBox = "0 0 16 16">
			<path d = "M8.707 1.5a1 1 0 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L82.
			20716.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5
			 0 0 0-.5.5v1.293L8.707 1.52"/>
			 <path d = "m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 
			 13.5V9.29316-6Z" />
			 
		</svg>
		<span class = "fs-4">Home</span>
	</a>
	<ul class="nav nav-pills">
		<c:choose>
			<c:when test="${empty sessionId}">
				<li class="nav-item">
					<a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<c:url value="/member/addMember.jsp"/>">회원가입</a>
				</li>
			</c:when>
			<c:otherwise>
				<li style="padding-top: 7px; color: white">
					[<%=sessionId %>님]
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<c:url value="/member/updateMember.jsp"/>">회원 수정</a>
				</li>		
			</c:otherwise>
		</c:choose>
	</ul>
<!-- 	도서조회,등록,수정,삭제를 위한 준비 -->
	<ul class="nav nav-pills">
		<li class="nav-item"><a href="./books.jsp" class="nav-link">도서 목록</a></li>
		<li class="nav-item"><a href="./addBook.jsp" class="nav-link">도서 등록</a></li>
		<li class="nav-item"><a href="./editBook.jsp?edit=update" class="nav-link">도서 수정</a></li>	
		<li class="nav-item"><a href="./editBook.jsp?edit=delete" class="nav-link">도서 삭제</a></li>		
	</ul>
</header>
</body>
</html>