<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Store Login</title>
</head>
<body>
    <h1>로그인</h1>
    <form action="processLoginMember.jsp" method="post">
        ID: <input type="text" name="id"><br>
        Password: <input type="password" name="passwd"><br>
        <input type="submit" value="로그인">
    </form>
</body>
</html>
