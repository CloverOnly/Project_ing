<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, dto.Green, dao.GreenRepository, java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.ma {
    	height: 350px;
    	background: url(image/green1.jpg) no-repeat center;
    	background-size: cover;
    	color: #000000;
	}
</style>
<meta charset="UTF-8">
<title>상품 리스트</title>
</head>
<body>
<%@ include file="header.jsp" %>

    <div class="ma p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">상품</h1>
            <p class="col-md-8 fs-4">Vegetable List</p>
        </div>
    </div> 
    
    <%
        GreenRepository dao = GreenRepository.getInstance();
    %>    
    
    <div class="row align-items-md-stretch text-center">
        
		<!--  DB에 상품 조회, 등록, 수정,삭제   -->
        <%@ include file = "dbconn.jsp" %>
    <%
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = "SELECT * FROM green";
    	pstmt = conn.prepareStatement(sql);
    	rs=pstmt.executeQuery();
    	while(rs.next()){
    %>
        <div class="col-md-4">
            <div class="h-100 p-2">
                <img src="./image/<%=rs.getString("g_filename") %>" class="img" /> 
                <h5><b><%=rs.getString("g_name") %></b></h5>
                <p><%= rs.getString("g_author") %></p>
                <p><%=rs.getString("g_description").substring(0, 60) %>....</p>
                <p><%=rs.getString("g_unitPrice") %>원</p>
                
                <p><a href="./info.jsp?id=<%=rs.getString("g_id") %>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a></p>
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