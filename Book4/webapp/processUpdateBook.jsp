<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	String fileName = null;
	String unitPrice = null;
	String unitsInStockStr = null;
	String condition = null;

	File fileUploadPath = new File("C:\\web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Book\\image");
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setRepository(fileUploadPath);
	factory.setSizeThreshold(1024*1024);
	
	System.out.println("123123");
	System.out.println(fileName);
	System.out.println("123126");
	
	ServletFileUpload upload = new ServletFileUpload(factory);
	System.out.println(upload);
	 try {
		 	List<FileItem> items = upload.parseRequest(request);
	     	Iterator<FileItem> params = items.iterator();
	     	System.out.println("sdfsjdkfjew");
	    	System.out.println(items);
      
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
                	  unitPrice = fileItem.getString("utf-8");
                      break;
                  case "unitsInStock":
                      unitsInStockStr = fileItem.getString("utf-8");
                      break;
                  case "condition":
                 	 condition = fileItem.getString("utf-8");
                      break;    
                      
              }
          } else {
              fileName = new File(fileItem.getName()).getName();
              if (fileName != null && !fileName.isEmpty()) {
                  File file = new File(fileUploadPath, fileName);
                  fileItem.write(file);
                  System.out.println("123123222222");
               	System.out.println(fileName);
              }
          }
      }
  } catch (Exception e) {
      e.printStackTrace();
  }

	List<FileItem> items = upload.parseRequest(request); 

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
	System.out.println("1231232");
	String sql = "SELECT * FROM book WHERE b_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	rs=pstmt.executeQuery();
	System.out.println("1231233");
	System.out.println(fileName);
	while(rs.next()){
		if(fileName!=null){
			sql="UPDATE book SET b_name=?, b_unitPrice=?, b_author=?, b_description=?,b_publisher=?,b_category=?,b_unitsInStock=?,b_releaseDate=?,b_condition=?,b_fileName=? WHERE b_id=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setInt(7, stock);
			pstmt.setString(8, releaseDate);
			pstmt.setString(9, condition);
			pstmt.setString(10, fileName);
			pstmt.setString(11, bookId);
			pstmt.executeUpdate();
			System.out.println("pstmst123");
			System.out.println(pstmt);
			System.out.println(fileName);
			
		}else{
			sql="UPDATE book SET b_name=?, b_unitPrice=?, b_author=?, b_description=?,b_publisher=?,b_category=?,b_unitsInStock=?,b_releaseDate=?,b_condition=? WHERE b_id=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setInt(7, stock);
			pstmt.setString(8, releaseDate);
			pstmt.setString(9, condition);
			pstmt.setString(10, bookId);
			pstmt.executeUpdate();	
			
		}
	}
	System.out.println("1231235");
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
	
	response.sendRedirect("editBook.jsp?edit=update");
	
%>
</body>
</html>