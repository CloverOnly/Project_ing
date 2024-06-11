<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 처리</title>
</head>
<body>
<%	
	 request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String birth = request.getParameter("birth");
    String mail = request.getParameter("mail");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

    // Debugging output
    out.println("id: " + id);
    out.println("password: " + password);
    out.println("name: " + name);
    out.println("gender: " + gender);
    out.println("birth: " + birth);
    out.println("mail: " + mail);
    out.println("phone: " + phone);
    out.println("address: " + address);

    // Check if id is null or empty and handle it
    if(id == null || id.isEmpty()) {
        out.println("ID cannot be null or empty");
        return;
    }
%>
    <sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/bookmarketdb"
            driver="com.mysql.jdbc.Driver" user="root" password="1234" />
    
    <sql:update dataSource="${dataSource}" var="resultSet">
        INSERT INTO member(id, password, name, gender, birth, mail, phone, address, regist_day) 
        VALUES(?, ?, ?, ?, ?, ?, ?, ?, default)
        <sql:param value="<%=id%>" />
        <sql:param value="<%=password%>" />
        <sql:param value="<%=name%>" />n
        <sql:param value="<%=gender%>" />
        <sql:param value="<%=birth%>" />
        <sql:param value="<%=mail%>" />
        <sql:param value="<%=phone%>" />
        <sql:param value="<%=address%>" />
    	</sql:update>
    
    <c:import var="url" url="resultMember.jsp" />
    ${url}
</body>
</html>