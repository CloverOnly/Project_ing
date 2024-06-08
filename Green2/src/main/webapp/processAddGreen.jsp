<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*, dto.Green, dao.GreenRepository" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "java.sql.*, java.io.*, java.util.*" %>
<%@ include file = "dbconn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 process</title>
</head>
<body>


<%
	request.setCharacterEncoding("utf-8");
	
	String greenId = null;
	String name = null;
	String author = null;
	String description = null;
	String category = null;
	String releaseDate = null;
	String filename = null;
	String unitPriceStr = null;
	String unitsInStockStr = null;
	
	
	int Price=0;
	int Stock=0;
	
	File fileUploadPath = new File("C:\\web\\Green\\src\\main\\webapp\\image");
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setRepository(fileUploadPath);
	factory.setSizeThreshold(1024*1024);
	
	
	ServletFileUpload upload = new ServletFileUpload(factory);
	 try {
		 	List<FileItem> items = upload.parseRequest(request);
	     	Iterator<FileItem> params = items.iterator();
         
         while (params.hasNext()) {
             FileItem fileItem = (FileItem) params.next();
             
             if (fileItem.isFormField()) {
                 switch (fileItem.getFieldName()) {
                     case "greenId":
                         greenId = fileItem.getString("utf-8");
                         break;
                     case "name":
                         name = fileItem.getString("utf-8");
                         break;
                     case "author":
                         author = fileItem.getString("utf-8");
                         break;
                     case "description":
                         description = fileItem.getString("utf-8");
                         break;
                     case "category":
                         category = fileItem.getString("utf-8");
                         break;
                     case "releaseDate":
                         releaseDate = fileItem.getString("utf-8");
                         break;                   
                     case "unitPrice":
                         unitPriceStr = fileItem.getString("utf-8");
                         break;
                     case "unitsInStock":
                         unitsInStockStr = fileItem.getString("utf-8");
                         break;   
                         
                 }
             } else {
                 filename = new File(fileItem.getName()).getName();
                 if (filename != null && !filename.isEmpty()) {
                     File file = new File(fileUploadPath, filename);
                     fileItem.write(file);
                 }
             }
         }
     } catch (Exception e) {
         e.printStackTrace();
     }
     
     if (unitPriceStr != null && !unitPriceStr.isEmpty()) {
         try {
             Price = Integer.parseInt(unitPriceStr);
         } catch (NumberFormatException e) {
             e.printStackTrace();
         }
     }
     if (unitsInStockStr != null && !unitsInStockStr.isEmpty()) {
         try {
             Stock = Integer.parseInt(unitsInStockStr);
         } catch (NumberFormatException e) {
             e.printStackTrace();
         }
     }
	
	//db에 새로운 상품 등록
    PreparedStatement pstmt = null;
	
	String sql = "INSERT INTO green VALUES(?,?,?,?,?,?,?,?,?)";

	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, greenId);
	pstmt.setString(2, name);
	pstmt.setInt(3, Price);
	pstmt.setString(4, author);
	pstmt.setString(5, description);
	pstmt.setString(6, category);
	pstmt.setLong(7, Stock);
	pstmt.setString(8, releaseDate);
	pstmt.setString(9, filename);
	pstmt.executeUpdate();
	
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
	
	response.sendRedirect("green.jsp");
	
%>

</body>
</html>