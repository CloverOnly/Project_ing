<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, java.text.NumberFormat, 
    	java.util.Locale, webtest.Travel, webtest.TravelRepository"%>

<jsp:useBean id="Travel" class="webtest.TravelRepository" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해외여행</title>
<%-- 부트스트랩 사용을 위한 필수 파일 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	.ma {
	}
	
	.ma h1 {
		color: #00008B;
	}
	
	.col {
		margin: 15px;
		height: auto;
	}
	
	.img {
		width: 100%;
		height: auto;
		object-fit: cover;
	}
	
	.col a {
		text-decoration: none;
		color: black;
	}
	.highlight{
		color: #FFD700;
	}
	
	.highlight1{
		color: #228B22;
	}
	
	/*캐러셀 크기 조정*/
	.carousel-container {
        max-width: 800px;  /* 원하는 너비로 설정 */
        margin: 0 auto;  /* 가운데 정렬 */
    }

    .carousel-inner img {
        height: 400px;  /* 원하는 높이로 설정 */
        object-fit: cover;
    }
	
</style>
</head>
<body>
	
	<%-- header --%>
	<%@ include file="mainTravel_header.jsp" %>
	
	<div class="ma">
		<h1>해외여행</h1>
		<br>
		<h3><span class="highlight1">Go Travel</span>이 뽑은 <span class="highlight">"황금"</span> 여행지</h3>
	</div>
	
	<%-- 캐러셀 --%>
	<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<% 
			ArrayList<Travel> listOfTravel1 = Travel.getAllTravel();
			  
				// 필터링할 여행 객체 ID 목록
				String[] travelIds = {"T10", "T11", "T12", "T13"};
				boolean firstItem = true;
				for (Travel travel : listOfTravel1) {
					boolean include = false;
					for (String id : travelIds) {
						if (travel.getTravelId().equals(id)) {
							include = true;
							break;
						}
					}
					if (!include) continue;
			%>
			<div class="carousel-item <%= firstItem ? "active" : "" %>">
				<img src="<%= travel.getImage() %>" class="d-block w-100" alt="<%= travel.getTravelArea() %>">
				<div class="container">
					<div class="carousel-caption d-none d-md-block">
						<h5><%= travel.getTravelArea() %></h5>
						<p><%= travel.getDescription().length() > 60 ? travel.getDescription().substring(0, 60) + "..." : travel.getDescription() %></p>
					</div>
				</div>
			</div>
			<% 
					if (firstItem) firstItem = false;
				} 
			%>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	
	<%--줄 뛰움 --%>
	<br><br><br>
	
	<%-- 그리드 --%>
	<div class="container text-left">
		<div class="row row-cols-1 row-cols-md-5 g-4">
			<% 
			TravelRepository create = TravelRepository.getInstance();
			ArrayList<Travel> listOfTravel = create.getAllTravel();
				  
				NumberFormat formatter = NumberFormat.getNumberInstance(Locale.KOREA);  // NumberFormat 인스턴스 생성
				for (int i = 0; i < listOfTravel.size(); i++) {
					Travel travel = listOfTravel.get(i);
			%>
			<div class="col">
				<a href="T_Information.jsp?id=<%= travel.getTravelId() %>">
					<img src="<%= travel.getImage() %>" class="img">
					<strong><%= travel.getSubheading() %></strong>
					<br><br>
					<%= travel.getExplain() %>
					<p><%= formatter.format(travel.getUnitPrice()) %>원 1인 기준~</p> <!-- 숫자를 포맷팅하여 출력 -->
				</a>
			</div>
			<% } %>
		</div>
	</div>
	
	<%-- footer --%>
	<%@ include file="mainTravel_footer.jsp" %>
</body>
</html>