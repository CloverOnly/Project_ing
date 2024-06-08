<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
	.img {
    	width: 250px; 
    	height: 300px;
	}
</style>

<meta charset="UTF-8">
<title>상품 편집</title>

<!-- 삭제페이지 작성  -->
<script type="text/javascript">
	function deleteConfirm(id){
		if(confirm("해당 상품을 삭제합니다.")==true)
			location.href="./deleteGreen.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
<%@ include file = "header.jsp" %>

<div class = "container py-4">
	<div class= "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">상품 편집</h1>
			<p class="col-md-8 fs-4">GreenEditing</p>
		</div>
	</div>
	
	<%@ include file = "dbconn.jsp" %>
	<div class = "row align-items-md-stretch text-center">
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM green";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
		%>
		<div class="col-md-4">
			<div class="h-100 p-2 round-3">
				<img src="./image/<%=rs.getString("g_filename") %>" class="img" />
				<p><h5><b><%= rs.getString("g_name") %></b></h5></p>
				<p><%=rs.getString("g_author") %></p>
				<br><%=rs.getString("g_unitPrice") %>원
				<p><%=rs.getString("g_description").substring(0, 60) %>...</p>
				<p><%=rs.getString("g_unitPrice") %>원</p>
				<p>
					<%
						if(edit != null && edit.equals("update")){
					%>
					<a href="./updateGreen.jsp?id=<%=rs.getString("g_id") %>" class="btn btn-success" role = "button">수정 &raquo;</a>
				</p>
				<%
						}else if (edit != null && edit.equals("delete")){
				%>
				<a href="#" onclick="deleteConfirm('<%=rs.getString("g_id") %>')" class="btn btn-danger" role="button">삭제 &raquo;</a>
				<%
						}
					
				%>
				
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
</div>

<%@ include file = "footer.jsp" %>
</body>
</html>