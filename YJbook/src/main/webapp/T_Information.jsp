<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "webtest.test.Travel" %>
<jsp:useBean id = "travel" class="webtest.test.TravelRepository" scope="request" />
<!DOCTYPE html>
<html>
<style>
.img {
    width:75%;
    height:auto%;
    object-fit:cover;
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
<%@ include file="Hello_header.jsp" %>
<hr>
<%
	String id = request.getParameter("id");
	Travel travel1 = travel.getTravelById(id);

 %>

<div>
    <div style="float: left">
        <img src = <%= travel1.getImage() %> class = "img">
    </div>
    <div>
        <h5><%= travel1.getTravelArea() %></h5>
    		<br><%= travel1.getCategory() %> | <%=travel1.getUnitPrice()%>원 
    		<p><%= travel1.getDescription().substring(0,60) %></p>
    		<p><%= travel1.getTravelDate() %></p>
    		<p><%= travel1.getUnitPrice() %>원 1인 기준~</p>
    </div>
</div>
<hr>
<%@ include file="Hello_footer.jsp" %>

</body>
</html>