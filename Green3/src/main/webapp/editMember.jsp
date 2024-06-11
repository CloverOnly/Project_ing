<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
    
    
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>회원 정보 수정</title>

</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
<div class = "container py-4">
<%@ include file = "/header.jsp" %>
	<div class= "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">회원 정보 편집</h1>
			<p class="col-md-8 fs-4">MemberEditing</p>
		</div>
	</div>
<%@ include file = "/dbconn.jsp" %>
<div class = "row align-items-md-stretch text-center">
	<h3><a href ="updateMember.jsp">정보 수정</a></h3>
	<h3><a href ="deleteMember.jsp">회원 탈퇴</a></h3>
	
</div>
<%@ include file = "/footer.jsp" %>
</div>
</body>
</html>