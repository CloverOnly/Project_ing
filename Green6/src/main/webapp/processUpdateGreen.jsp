<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "dto.Green" %>
<%@ page import = "dao.GreenRepository" %>
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

	String greenId = null;
	String name = null;
	String author = null;
	String description = null;
	
	String category = null;
	String releaseDate = null;
	String fileName = null;
	String unitPrice = null;
	String unitsInStockStr = null;
	

	File fileUploadPath = new File("C:\\web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Green\\image");
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
                	  unitPrice = fileItem.getString("utf-8");
                      break;
                  case "unitsInStock":
                      unitsInStockStr = fileItem.getString("utf-8");
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
	String sql = "SELECT * FROM green WHERE g_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, greenId);
	rs=pstmt.executeQuery();
	System.out.println("1231233");
	System.out.println(fileName);
	while(rs.next()){
		if(fileName!=null){
			sql="UPDATE green SET g_name=?, g_unitPrice=?, g_author=?, g_description=?,g_category=?,g_unitsInStock=?,g_releaseDate=?,g_fileName=? WHERE g_id=?";
			
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
			System.out.println("pstmst123");
			System.out.println(pstmt);
			System.out.println(fileName);
			
		}else{
			sql="UPDATE green SET g_name=?, g_unitPrice=?, g_author=?, g_description=?,g_category=?,g_unitsInStock=?,g_releaseDate=? WHERE g_id=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			
			pstmt.setString(5, category);
			pstmt.setInt(6, stock);
			pstmt.setString(7, releaseDate);
			
			pstmt.setString(8, greenId);
			pstmt.executeUpdate();	
			
		}
	}
	System.out.println("1231235");
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
	
	response.sendRedirect("editGreen.jsp?edit=update");
	
%>
</body>
</html>