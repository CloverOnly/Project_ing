<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="webtest.Travel, webtest.TravelRepository" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<jsp:useBean id="travel" class="webtest.TravelRepository" scope="session" />
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
/*
    // 이미지 업로드를 위한 코드 수정
    Part imagePart = request.getPart("image");
    String imageName = null;
    if (imagePart != null) {
        imageName = imagePart.getSubmittedFileName();
        // 이미지를 저장할 경로 설정 및 저장 로직
        String imagePath = "C:\file_repo/이미지/" + imageName;
        // 이미지를 저장하는 로직 작성
        InputStream imageStream = imagePart.getInputStream();
        // 이미지 저장 로직
    }
*/
    Integer price;

    if (unitPrice == null || unitPrice.isEmpty()) {
        price = 0;
    } else {
        price = Integer.valueOf(unitPrice);
    }

    TravelRepository create = TravelRepository.getInstance();

    Travel tra = new Travel();

    tra.setTravelId(travelId);
    tra.setTravelArea(travelArea);
    tra.setUnitPrice(price);
    tra.setDescription(description);
    tra.setCategory(category);
    tra.setTravelDate(travelDate);
    //tra.setImage(imageName); // 이미지 이름으로 설정

    create.addArea(tra);

    response.sendRedirect("Travel.jsp");
%>
</body>
</html>
