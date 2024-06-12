<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그아웃</title>
</head>
<body>
    <h1>로그아웃</h1>
    <p>로그아웃 되었습니다.</p>
    <%
        // 사용자의 세션을 무효화하여 로그아웃 처리합니다.
        session.invalidate();
    %>
    <p><a href="main.jsp">Home</a></p>
</body>
</html>