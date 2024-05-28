<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="webtest.Travel, webtest.TravelRepository" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<jsp:useBean id="travel" class="webtest.TravelRepository" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");

    String travelId = request.getParameter("travelId");
    String travelArea = request.getParameter("travelArea");
    String unitPrice = request.getParameter("unitPrice");
    String description = request.getParameter("description");
    String category = request.getParameter("category");
    String travelDate = request.getParameter("travelDate");
    String image = request.getParameter("image");

    Integer price;

    if (unitPrice == null || unitPrice.isEmpty()) {
        price = 0;
    } else {
        price = Integer.valueOf(unitPrice);
    }

    TravelRepository trr = TravelRepository.getInstance();

    Travel tra = new Travel();

    tra.setTravelId(travelId);
    tra.setTravelArea(travelArea);
    tra.setUnitPrice(price);
    tra.setDescription(description);
    tra.setCategory(category);
    tra.setTravelDate(travelDate);
    tra.setImage(image);

    trr.addArea(tra);

    response.sendRedirect("Travel.jsp");
%>
</body>
</html>
