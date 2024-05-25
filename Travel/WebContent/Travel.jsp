<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, webtest.Travel"%>

<jsp:useBean id = "Travel" class="webtest.TravelRepository" scope="request" />
<!DOCTYPE html>
<html>
<style>
	.ma {
		
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
<title>해외여행</title>
<%--부트 스트립 사용전 필수--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<%--header --%>
	<%@ include file = "mainTravel_header.jsp" %>
	<hr>
	
	<div class ="ma">
		<h1>해외여행</h1>
		<h3>Overseas Travel List</h3>
	</div>
	
	<%-- 그리드 --%>
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
	</div>
	
	<%-- footer --%>
	<%@ include file = "mainTravel_footer.jsp" %>
	
</body>
</html>