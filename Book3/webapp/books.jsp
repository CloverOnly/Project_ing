<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Book" %>
<%@ page import = "dao.BookRepository" %>
<%@ page import = "java.sql.*" %>

<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.img {
    width: 250px; 
    height: 350px;
}
</style>

<head>
<meta charset="UTF-8">
<title>도서 목록</title>
</head>
<body>
<div class="container py-4">
    <%@ include file="menu.jsp" %>
    
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">도서목록</h1>
            <p class="col-md-8 fs-4">BookList</p>
        </div>
    </div> 
    
    <%
        BookRepository dao = BookRepository.getInstance();
//         ArrayList<Book> listOfBooks = dao.getAllbooks();
    %>    
    
    <div class="row align-items-md-stretch text-center">

<%--         
		<%  
            for (int i = 0; i < listOfBooks.size(); i++) { 
             Book book = listOfBooks.get(i); 
         %> 
--%>
   
        
<!--        도서 조회, 등록, 수정,삭제 위한 준비 작업  -->
        <%@ include file = "dbconn.jsp" %>
    <%
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = "SELECT * FROM book";
    	pstmt = conn.prepareStatement(sql);
    	rs=pstmt.executeQuery();
    	while(rs.next()){
    %>
        <div class="col-md-4">
            <div class="h-100 p-2">
                <img src="./image/<%=rs.getString("b_filename") %>" class="img" /> 
                <h5><b><%=rs.getString("b_name") %></b></h5>
                <p><%= rs.getString("b_author") %></p>
                <br><%=rs.getString("b_publisher") %> | <%=rs.getString("b_unitPrice") %>원
                <p><%=rs.getString("b_description").substring(0, 60) %>....</p>
                <p><%=rs.getString("b_unitPrice") %>원</p>
                
                <p><a href="./book.jsp?id=<%=rs.getString("b_id") %>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a></p>
            </div>
        </div>
        <%
    		
            }
    		if(rs!=null)
    			rs.close();
    		if(pstmt!=null)
    			pstmt.close();
    		if(conn!=null)
    			conn.close();
            
        %>
    </div>
    <%@ include file = "footer.jsp" %>
</div>
</body>
</html>