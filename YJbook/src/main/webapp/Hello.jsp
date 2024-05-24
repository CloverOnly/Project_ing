<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.bd {
	text-align: center;
	background: #e6e6fa;
	margin: 2px;
	padding: 2px;
}
a {
  text-decoration: none;
  color: green;
}
.carousel-item{
  width: 200px;
  height: 150px;
 
}
.ti{
	background: #e6e6fa;
}

.ti h1{
	color: green;
}
.carouselExampleInterval{
	.pics {      /* 전체 케러셀 */
            width: 600px;
            float: left;
            position: relative;
            left: 50%;
            object-fit: cover;
        }
}
.carousel-inner {
            width: auto;
            height: 250px; /* 이미지 높이 변경 */
        }

.carousel-item {
            width: auto;
            height: 100%;
        }

.d-block {
            display: block;
            width: auto;
            height: 100%;
        }

</style>
<%--부트 스트립 사용전 필수--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
	<%@ include file = "Hello_header.jsp" %>
	<hr>
	<%-- 네비게이션 바 --%>
	
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link active" aria-current="page" href="#">Home</a>
        <a class="nav-link" href="webapp.Travel.jsp">해외 여행</a>
        <a class="nav-link" href="#">국내 여행</a>
        <a class="nav-link disabled" aria-disabled="true">Disabled</a>
      </div>
    </div>
  </div>
</nav>
	
	<%-- 네비게이션 끝 --%>
	
	<div class="ti">
	<h1>Hello Travel World!</h1>
	<img src="https://cdn.pixabay.com/photo/2023/07/19/21/07/ai-generated-8137871_1280.png"
				width="30" height="30" style="vertical-align:middle;" >
	<span style="margin-top:20px;font-size:25px;">travel World</span>
	</div>
	<hr>
	<%--캐러셀 부트스트립 사용--%>
	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="image/im1.png" class="d-block w-100 h-80" alt="...">
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="image/im2.jpg" class="d-block w-100 h-80" alt="...">
    </div>
    <div class="carousel-item">
      <img src="image/im3.jpg" class="d-block w-100 h-80" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
	<%--캐러셀 끝 --%>
<div class="bd">
	<h2>안녕 Hi こんにちは 你好 chào </h2>
	<%=new Date() %>
</div>
	<%@ include file = "Hello_footer.jsp" %>
</body>
</html>