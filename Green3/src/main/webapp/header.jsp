<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId=(String)session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html>
<head>
<%-- 부트스트랩 사용을 위한 필수 파일 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
	
	
    .navbar {
        height: 140px; /* 원하는 높이로 조절하세요 */
        
        
    }
    .nav-link {
        font-size: 20px;
        font-weight: bold;
        text-decoration: none;
        color: black;
    }
    .hd {
        text-decoration: none;
        color: green;
        padding: 10;
    }
    .imc {
        text-decoration: none;
        color: black;
    }
    .image-container {
        display: flex;
        align-items: center;
        gap: 15px;
    }
</style>
<meta charset="UTF-8">
<title>상단 메뉴 페이지</title>
</head>
<body>
<%-- 네비게이션 바 --%>
<nav class="navbar navbar-expand-lg navbar-light py-20">
    <div class="container-fluid d-flex align-items-center">
        
        <%-- 로고 및 타이틀 --%>
        <div class="d-flex align-items-center me-auto">
        	<a href="main.jsp" class="hd">
            	<img src="image/clover.jpg" width="50" height="50" style="vertical-align:middle;">
            	<span style="margin-left:10px;font-size:30px;">금남의 GREEN CAFE</span>
            </a>
        </div>
        
   
        <%-- 이미지 창 --%>
        <div class="ms-3 image-container">

            <a class="imc d-flex flex-column align-items-center" href="loginMember.jsp">
                <img src="image/login.jpg" alt="로그인" width="40" height="40">
                <span>로그인</span>
            </a>
             <a class="imc d-flex flex-column align-items-center" href="addMember.jsp">
                <img src="image/login.jpg" alt="로그인" width="40" height="40">
                <span>회원가입</span>
            </a>
            <a class="imc d-flex flex-column align-items-center" href="#">
                <img src="image/order.jpg" alt="주문내역" width="40" height="40">
                <span>주문내역</span>
            </a>
            <a class="imc d-flex flex-column align-items-center" href="cart.jsp">
                <img src="image/box.jpg" alt="장바구니" width="40" height="40">
                <span>장바구니</span>
            </a>
        
        
        </div>
    </div>
</nav>

<ul class="nav nav-pills">
		<li class="nav-item"><a href="./green.jsp" class="nav-link">상품 목록</a></li>
		<li class="nav-item"><a href="./addGreen.jsp" class="nav-link">상품 등록</a></li>
		<li class="nav-item"><a href="./editGreen.jsp?edit=update" class="nav-link">상품 수정</a></li>	
		<li class="nav-item"><a href="./editGreen.jsp?edit=delete" class="nav-link">상품 삭제</a></li>		
	</ul>
<hr>

</body>
</html>