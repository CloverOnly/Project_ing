<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--부트 스트립 사용전 필수--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
	.bd {
		text-align: center;
		margin: 2px;
		padding: 2px;
	}
	
	a {
  		text-decoration: none;
  		color: green;
	}
	
	.carousel-item{
  		width: 800px;
  		height: 600px;
	}
	
	
	.carouselExampleInterval {
		.pics {      
        	width: 800px;
        	height: auto;
        	float: left;
        	position: relative;
        	left: 50%;
        	object-fit: cover;
    	}	
	}
		
	.carousel-inner {
    	width: 800px;
    	height: 450px; /* 이미지 높이 변경 */
	}
	
	.carousel-item {
    	width: 800px;
    	height: 400px;
	}
		
	.d-block {
    	display: block;
    	width: 800px;
    	height: 400px;
	}
	
</style>

</head>
<body>
	<%--header --%>
	<%@ include file="mainTravel_header.jsp" %>
	
	<%--캐러셀 사용--%>
	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000">
				<img src="image/osaka.jpg" class="d-block w-100" alt="오사카">
      			<strong class="main_image_text" style="font-size:20px">오사카, 교토 3박 4일 여행 초특가 가자!!!!!</strong>
    		</div>
    		<div class="carousel-item" data-bs-interval="2000">
      			<img src="image/taiwan.jpg" class="d-block w-100" alt="대만">
      			<strong class="main_image_text" style="font-size:20px">야경이 이쁜 대만 가보자잇!!!</strong>
    		</div>
    		<div class="carousel-item" data-bs-interval="3000">
      			<img src="image/Poland.jpg" class="d-block w-100" alt="폴란드">
      			<strong class="main_image_text" style="font-size:20px">폴란드 가본사람~~</strong>
    		</div>
    		<div class="carousel-item">
      			<img src="image/thailand.jpg" class="d-block w-100" alt="태국">
      			<strong class="main_image_text" style="font-size:20px">낭만의 동남아 태국~~</strong>
    		</div>
  			
  		</div>
  		
  		<%--캐러셀 버튼 --%> 
  		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    		<span class="visually-hidden">Previous</span>
  		</button>
  		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
    		<span class="visually-hidden">Next</span>
  		</button>
	</div>
	
	<%--인사말 --%>
	<div class="bd">
		<h2>안녕 Hi こんにちは 你好 chào </h2>
		<%=new Date() %>
	</div>
	
	<%--footer --%>
	<%@ include file="mainTravel_footer.jsp" %>

</body>
</html>