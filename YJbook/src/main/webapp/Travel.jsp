<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "webtest.test.Travel" %>

<jsp:useBean id = "Travel" class="webtest.test.TravelRepository" scope="request" />
<!DOCTYPE html>
<html>
<style>
.ma {
	border:1px solid #888;
	margin: 15px;
	padding: 15px;
	background-color : 	#B0C4DE;
}
.ma h1{
	color: 	#00008B;
	
}
.col{
	
	margin: 15px
	height:auto;
}
.img {
    width:100%;
    height:auto%;
    object-fit:cover;
}
.col a {
  text-decoration: none;
  color: black;
}

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--부트 스트립 사용전 필수--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<%@ include file = "Hello_header.jsp" %>
<hr>
<div class ="ma">
	<h1>여행 가고 싶은곳 골라</h1>
	<h3>TravelList</h3>
</div>
<%-- 부트스트립 그리드 사용 --%>
<div class="container text-center">
  <div class="row row-cols-3">
    <% 
    ArrayList<Travel> listOfTravel = Travel.getAllTravel();  
    for(int i=0; i< listOfTravel.size(); i++){
        Travel travel = listOfTravel.get(i);
    %>
    <div class="col">
    	<a href="T_Information.jsp?id=<%=travel.getTravelId()%>">
    		<img src = <%= travel.getImage() %> class = "img">
    		<h5><%= travel.getTravelArea() %></h5>
    		<br><%= travel.getCategory() %> | <%=travel.getUnitPrice()%>원 
    		<p><%= travel.getDescription().substring(0,60) %></p>
    		<p><%= travel.getTravelDate() %></p>
    		<p><%= travel.getUnitPrice() %>원 1인 기준~</p>
    		
    	</a>
    </div>
    
    <% } %>
  </div>
<%-- 부트스트립 그리드 여기까지 --%>
<hr>
<%@ include file = "Hello_footer.jsp" %>
</div>
</body>