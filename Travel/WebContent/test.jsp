<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Go Travel</title>
<%-- 부트스트랩 사용을 위한 필수 파일 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  

    .hd {
        text-decoration: none;
        color: green;
        padding: 10;
    }
    
    .image-container {
        display: flex;
        align-items: center;
        gap: 15px;
    }
    
    .imc {
        text-decoration: none;
        color: black;
    }
    
    .navbar {
        height: 140px; /* 원하는 높이로 조절하세요 */
        background-color: #f0fff0; /* 연한 녹색 배경색 */
    }
    
    .nav-link {
        font-size: 20px;
        font-weight: bold;
        text-decoration: none;
        color: black;
    }
    .nav{
    	background-color: #f0fff0; /* 연한 녹색 배경색 */
    }
</style>
</head>
<body>

<%-- 네비게이션 바 --%>
<nav class="navbar navbar-expand-lg navbar-light py-20">
    <div class="container-fluid d-flex align-items-center">
        
        <%-- 로고 및 타이틀 --%>
        <div class="d-flex align-items-center me-auto">
            <img src="https://cdn.pixabay.com/photo/2018/01/31/05/43/web-3120321_1280.png" width="50" height="50" style="vertical-align:middle;">
            <span style="margin-left:10px;font-size:30px;"><a href="#" class="hd">GO Travel</a></span>
        </div>
        
        <%-- 중앙 정렬을 위한 검색 폼 --%>
        <div class="d-flex align-items-center justify-content-center ms- w-120">
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="검색어를 입력해 주세요." aria-label="search">
                <button class="btn btn-outline-success" type="submit"><img src="image/search.jpg" alt="alarm" width="20" height="20"></button>
            </form>
        </div>
        
        <%-- 이미지 창 --%>
        <div class="ms-3 image-container">
            <a class="imc d-flex flex-column align-items-center" href="#">
                <img src="image/alarm.jpg" alt="alarm" width="40" height="40">
                <span>알림</span>
            </a>
            <a class="imc d-flex flex-column align-items-center" href="#">
                <img src="image/login.jpg" alt="로그인" width="40" height="40">
                <span>로그인</span>
            </a>
            <a class="imc d-flex flex-column align-items-center" href="#">
                <img src="image/calendar.jpg" alt="부트스트랩" width="40" height="40">
                <span>예약내역</span>
            </a>
        </div>
    </div>
</nav>

<%-- 네비게이션 2 --%>
<nav class="nav">
  <a class="nav-link" href="#">해외여행</a>
  <a class="nav-link" href="#">국내여행</a>
  <a class="nav-link" href="#">항공</a>
  <a class="nav-link" href="#">호텔</a>
</nav>

</body>
</html>