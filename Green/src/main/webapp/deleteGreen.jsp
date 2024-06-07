<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	String greenId=request.getParameter("id");

	PreparedStatement pstmt = null;
	ResultSet rs=null;

	String sql = "SELECT * FROM green";
	pstmt = conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		sql="DELETE FROM green WHERE g_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, greenId);
		pstmt.executeUpdate();
	}else
		out.println("일치하는 상품이 없습니다.");
	
	if(rs!=null)
		rs.close();
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
	
	response.sendRedirect("editGreen.jsp?edit=delete");
%>
</body>
</html>