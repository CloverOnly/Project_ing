<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, dto.Green, dao.GreenRepository" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 등록 페이지</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	if(id==null || id.trim().equals("")){
		response.sendRedirect("green.jsp");
		return;
	}
	
	GreenRepository dao = GreenRepository.getInstance();
	
	Green Green = dao.getGreenById(id);
	if(Green==null){
		response.sendRedirect("exceptionNoGreenId.jsp");
	}
	
	ArrayList<Green> goodsList=dao.getAllGreen();
	Green goods = new Green();
	for(int i =0; i < goodsList.size(); i++){
		goods = goodsList.get(i);
		if(goods.getGreenId().equals(id)){
			break;
		}
	}
	
	ArrayList<Green> list = (ArrayList<Green>)session.getAttribute("cartlist");
	if(list == null){
		list = new ArrayList<Green>();
		session.setAttribute("cartlist", list);
	}
	
	int cnt=0;
	Green goodsQnt = new Green();
	for(int i = 0; i< list.size(); i++){
		goodsQnt = list.get(i);
		if(goodsQnt.getGreenId().equals(id)){
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	if(cnt==0){
		goods.setQuantity(1);
		list.add(goods);
	}
	
	response.sendRedirect("green.jsp?id=" + id);
%>
</body>
</html>