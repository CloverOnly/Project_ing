<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="travel" class="webtest.TravelRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- header --%>
	<%@ include file="mainTravel_header.jsp" %>
	
	<%-- 머리말 --%>
	<div>
		<h1>여행지 등록</h1>
		<p>admin page</p>	
	</div>
	
	<%-- 등록 구간, 입력 그룹 사용 --%>
	<div>
		<form name ="tra" action="processAddArea.jsp" method="post" enctype="multipart/form-data">
		<div class="input-group mb-3">
  			<span class="input-group-text" id="basic-addon1">여행ID</span>
  			<input type="text" name="travelId" class="form-control"  aria-label="travelId" aria-describedby="basic-addon1">
		</div>
		
		<div class="input-group mb-3">
  			<span class="input-group-text" id="basic-addon1">나라명</span>
  			<input type="text" name="travelArea" class="form-control"  aria-label="travelArea" aria-describedby="basic-addon1">
		</div>
		
		<div class="input-group mb-3">
  			<span class="input-group-text" id="basic-addon1">분류</span>
  			<input type="text" name="category" class="form-control"  aria-label="category" aria-describedby="basic-addon1">
		</div>

		<div class="input-group mb-3">
  			<span class="input-group-text">&#8361;</span>
  			<input type="text" name="unitPrice" class="form-control" aria-label="Amount (to the nearest dollar)">
  			<span class="input-group-text">원</span>
		</div>
		
		<div class="input-group mb-3">
  			<span class="input-group-text" id="basic-addon1">소제목</span>
  			<input type="text" name="subheading" class="form-control"  aria-label="subheading" aria-describedby="basic-addon1">
		</div>
		
		<div class="input-group mb-3">
  			<span class="input-group-text" id="basic-addon1">설명</span>
  			<input type="text" name="explain" class="form-control"  aria-label="explain" aria-describedby="basic-addon1">
		</div>
		
		<div class="input-group mb-3">
  			<span class="input-group-text" id="basic-addon1">일정</span>
  			<input type="text" name="travelDate" class="form-control"  aria-label="travelDate" aria-describedby="basic-addon1">
		</div>

		<div class="input-group">
  			<span class="input-group-text">상세 정보</span>
  			<textarea class="form-control" name="description" aria-label="With textarea"></textarea>
		</div>
		
		 
		
		<div>
			<input type="submit" value="등록">
		</div>
		
		</form>
	</div>
	
	<br><br><br><br>
	
	<%-- footer --%>
	<%@ include file="mainTravel_footer.jsp" %>
</body>
</html>