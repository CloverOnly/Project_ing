<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, com.oreilly.servlet.*, com.oreilly.servlet.multipart.*,
		java.sql.*" %>
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
 	String filename="";
 	String realFolder="C:\\web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Test\\image";
 	String encType="utf-8";	//인코딩 타입
 	int maxSize=5 * 1024 * 1024;	//최대 업로드될 파일의 크기5mb
	
// 	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	
	
	String fileName = request.getParameter("fileName");
	String bookId = request.getParameter("bookId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String releaseDate = request.getParameter("releaseDate");
	String description = request.getParameter("description");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
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
	
	String sql = "SELECT * FROM book WHERE b_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		if(fileName!=null){
			sql="UPDATE book SET b_name=?, b_=?unitPrice, b_author=?, b_description=?,b_publisher=?,b_category=?,b_unitsInStock=?,b_releaseDate=?,b_condition=?,b_fileName=? WHERE b_id=?";
			
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
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
	
	response.sendRedirect("editBook.jsp?edit=update");
	
%>
</body>
</html>