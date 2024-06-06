<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import = "java.util.Date"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	.ma {
    	height: 500px;
    	background: url(image/green.jpg) no-repeat center;
    	background-size: cover;
	}
	.pp{
		color: green;
	}	
</style>
<title>Welcome</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<div class="container py-4">
	
	<%!String greeting = "운규와 금남의 유기농 채소 cafe에 오신것을 환영합니다.";
	String tagline = "Welcome to Green Market!";%>
	
	<div class = "p-5 mb-4  rounded-3">
		<div class="ma container-fluid py-5">
			<h2><%=greeting %></h2>
			<p class = "pp col-md-8 fs-4">GreenMarket</p>
		</div>
	</div>
	
	<div class="row align-items-md-stretch text-center">
		<div class="col-md-12">
			<div class="h-100 p-5">
				<h3 class="pp"><%=tagline %></h3>
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
</div>
<%@ include file = "footer.jsp" %>
</body>
</html>