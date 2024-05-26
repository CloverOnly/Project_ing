<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "webtest.Travel, java.text.NumberFormat, java.util.Locale" %>
<jsp:useBean id="travel" class="webtest.TravelRepository" scope="request" />
<!DOCTYPE html>
<html>
<style>
	
	.img {
    	width: 300px; /* 원하는 너비 */
    	height: 190px; /* 원하는 높이 */
    	object-fit: cover;	
	}
	
</style>
<head>
<meta charset="UTF-8">
<title>Travel Details</title>
<%--부트 스트립 사용전 필수--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<%-- header --%>
	<%@ include file="mainTravel_header.jsp" %>
	<hr>
	
	<%
    	String id = request.getParameter("id");
    	Travel travel1 = travel.getTravelById(id);
    	if (travel1 != null) {	//if 시작
        	NumberFormat formatter = NumberFormat.getNumberInstance(Locale.KOREA);  // NumberFormat 인스턴스 생성
	%>
	
	<%-- 여행 정보 --%>
	<div>
    	<div style="float: left; margin-right: 20px;">
        	<img src="<%= travel1.getImage() %>" class="img">
    	</div>
    	<div>
        	<h5><%= travel1.getTravelArea() %></h5>
        	<br><%= travel1.getCategory() %> | <%= formatter.format(travel1.getUnitPrice()) %>원 
        	<p><%= travel1.getDescription() != null ? travel1.getDescription().substring(0, Math.min(137, travel1.getDescription().length())) : "" %></p>
        	<p><%= travel1.getTravelDate() %></p>
        	<p><%= formatter.format(travel1.getUnitPrice()) %>원 1인 기준~</p>
    	</div>
	</div>

	<%
    	} else {
	%>
    	<p>여행 정보를 찾을 수 없습니다.</p>
	<%
    	}	// if문 끝
	%>
	<hr>
	
	<%-- footer --%>
	<%@ include file="mainTravel_footer.jsp" %>

</body>
</html>
