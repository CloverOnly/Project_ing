<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
<!-- 	데이터 베이스 연결 추가 -->
	<ul class="nav nav-pills">
		<li class="nav-item"><a href="./books.jsp" class="nav-link">도서 목록</a>
	</ul>
</header>
</body>
</html>