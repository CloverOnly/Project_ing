<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Welcome</title>
</head>
<body>
<div class="container py-4">
	<%@ include file = "menu.jsp" %>
	
	<%-- %!로 값을 넣어준다고 선언 --%>
	<%!String greeting = "도서 쇼핑몰에 오신 것을 환영합니다.";
	String tagline = "Welcome to web Market!";%>
	
	<div class = "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<%-- 선언된 값을 사용 --%>
			<h1 class ="display-5 fw-bold"><%=greeting %></h1>
			<p class = "col-md-8 fs-4">BookMarket</p>
		</div>
	</div>
	
	<div vlass="row align-items-md-stretch text-center">
		<div class="col-md-12">
			<div class="h-100 p-5">
				<h3><%=tagline %></h3>
				<%
					//시작 페이지의 접속 시각 자동 갱신하기
					response.setIntHeader("Refresh", 5);
					
					Date day = new java.util.Date();
					String am_pm;
					int hour = day.getHours();
					int minute = day.getMinutes();
					int second = day.getSeconds();
					if(hour / 12 == 0){
						am_pm = "AM";
					}else{
						am_pm = "PM";
						hour = hour -12;
					}
					String CT = hour + ":" + minute + ":" + second + " " + am_pm;
					out.println("현재 접속 시간: " + CT + "\n");
				%>
			</div>
		</div>
	</div>
	<%@ include file = "footer.jsp" %>
</div>
</body>
</html>