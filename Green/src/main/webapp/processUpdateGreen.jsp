<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*, java.sql.*, java.util.*, dto.Green, dao.GreenRepository" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "java.sql.*, java.io.*, java.util.*" %>

<%@ include file = "dbconn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

// 이미지 파일 업로드
	File fileUploadPath = new File("C:\\web\\Green\\webapp\\image");
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setRepository(fileUploadPath);
	factory.setSizeThreshold(1024*1024);
	
	String fileName = request.getParameter("fileName");
	String greenId = request.getParameter("greenId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String author = request.getParameter("author");
	String releaseDate = request.getParameter("releaseDate");
	String description = request.getParameter("description");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	
	Integer price;

	if(unitPrice == null || unitPrice.isEmpty())
	    price = 0;
	else
	    price = Integer.valueOf(unitPrice);
	
	Integer stock;

	if(unitsInStock == null || unitsInStock.isEmpty())
	    stock = 0;
	else
	    stock = Integer.valueOf(unitsInStock);
	
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	
	String sql = "SELECT * FROM green WHERE g_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, greenId);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		if(fileName!=null){
			sql="UPDATE green SET g_name=?, g_unitPrice=?, g_author=?, g_description=?, g_category=?, g_unitsInStock=?, g_releaseDate=?, g_fileName=? WHERE g_id=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, category);
			pstmt.setInt(6, stock);
			pstmt.setString(7, releaseDate);
			pstmt.setString(8, fileName);
			pstmt.setString(9, greenId);
			pstmt.executeUpdate();
		}else{
			sql="UPDATE green SET g_name=?, g_unitPrice=?, g_author=?, g_description=?, g_category=?, g_unitsInStock=?, g_releaseDate=?, WHERE g_id=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(6, category);
			pstmt.setInt(7, stock);
			pstmt.setString(8, releaseDate);
			pstmt.setString(10, greenId);
			pstmt.executeUpdate();	
			
		}
	}
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
	
	response.sendRedirect("editGreen.jsp?edit=update");
	
%>
</body>
</html>