<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, dto.Green, dao.GreenRepository" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("green.jsp");
		return;
	}
	
	GreenRepository dao = GreenRepository.getInstance();
	
	Green book = dao.getGreenById(id);
	if(book == null){
		response.sendRedirect("exceptionNoBookId.jsp");
	}
	
	ArrayList<Green> cartList = (ArrayList<Green>) session.getAttribute("cartlist");
	Green goodsQnt = new Green();
	for(int i = 0; i < cartList.size(); i++){
		goodsQnt = cartList.get(i);
		if(goodsQnt.getGreenId().equals(id)){
			cartList.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
%>
</body>
</html>