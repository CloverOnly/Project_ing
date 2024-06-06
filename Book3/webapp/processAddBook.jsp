<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "dto.Book" %>
<%@ page import = "dao.BookRepository" %>
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
	
	String bookId = null;
	String name = null;
	String author = null;
	String description = null;
	String publisher = null;
	String category = null;
	String releaseDate = null;
	String filename = null;
	String unitPriceStr = null;
	String unitsInStockStr = null;
	String condition = null;
	
	int Price=0;
	int Stock=0;
	
	File fileUploadPath = new File("C:\\web\\Book\\webapp\\image");
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
                     case "bookId":
                         bookId = fileItem.getString("utf-8");
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
                     case "publisher":
                         publisher = fileItem.getString("utf-8");
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
                     case "condition":
                    	 condition = fileItem.getString("utf-8");
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
	
	//db에 새로운 도서 등록
	   
    
    	PreparedStatement pstmt = null;
    	
    	
    	

	
	
	String sql = "INSERT INTO book VALUES(?,?,?,?,?,?,?,?,?,?,?)";

	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	pstmt.setString(2, name);
	pstmt.setInt(3, Price);
	pstmt.setString(4, author);
	pstmt.setString(5, description);
	pstmt.setString(6, publisher);
	pstmt.setString(7, category);
	pstmt.setLong(8, Stock);
	pstmt.setString(9, releaseDate);
	pstmt.setString(10, condition);
	pstmt.setString(11, filename);
	pstmt.executeUpdate();
	

	
    	
	
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
	
	response.sendRedirect("books.jsp");
	
%>

</body>
</html>