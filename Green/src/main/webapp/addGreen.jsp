<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script type = "text/javascript" src="./js/validation.js"></script>

<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
<%@ include file = "header.jsp" %>

<div class = "row align-items-md-stretch">
	<%-- 소제목 --%>
	<div class = "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class = "container-fluid py-5">
			<h1 class="display-5 fw-bold">상품 등록</h1>
			<p class = "col-md-8 fs-4">Vegetable Addition</p>
		</div>
	</div>
	
	<%-- 입력 받는 부분 --%>
	<div class = "row align-items-md-stretch">
	
	<!-- 로그아웃 -->
		<div class="row align-items-md-stretch">
			<div class = "text-end">
				<a href = "logout.jsp" class="btn btn-sm btn-success pull right">
				logout</a>
			</div>
		</div>
	
	<%-- form 부분 --%>
		<!-- 프로젝트 폴더명 부분 주의해야한다 Test-->
		<form name="newGreen" action="./processAddGreen.jsp" method="post" enctype="multipart/form-data">
			
			<%-- 상품 아이디 - greenId --%>
			<div class="mb-3 row">
				<label class = "col-sm-2">상품코드</label>
				<div class = "col-sm-3">
					<input type="text" id = "greenId" name="greenId" class="form-control">
				</div>
			</div>
			
			<%-- 상품명 - name --%>
			<div class = "mb-3 row">
				<label class="col-sm-2">상품명</label>
				<div class = "col-sm-3">
					<input type="text" id = "name" name="name" class="form-control">
				</div>
			</div>
			
			<%-- 가격 - unitPrice --%>
			<div class="mb-3 row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type = "text" id = "unitPrice" name = "unitPrice" class ="form-control">
				</div>
			</div>
			
			<%-- 책임자 - author --%>
			<div class="mb-3 row">
				<label class="col-sm-2">책임자</label>
				<div class = "col-sm-3">
					<input type = "text" name = "author" class ="form-control">
				</div>
			</div>
			
			<%-- 수확시기 - releaseDate --%>
			<div class="mb-3 row">
				<label class="col-sm-2">수확시기</label>
				<div class = "col-sm-3">
					<input type = "text" name = "releaseDate" class ="form-control">
				</div>
			</div>
			
			<%-- 상세정보 - description --%>
			<div class="mb-3 row">
				<label class="col-sm-2">상세정보</label>
				<div class = "col-sm-5">
					<textarea name = "description" id = "description" cols = "50" rows ="2"
					class = "form-control" placeholder="50자 이상 적어주세요"></textarea>
				</div>
			</div>
			
			<%-- 원산지 - category --%>
			<div class="mb-3 row">
				<label class="col-sm-2">원산지</label>
				<div class = "col-sm-3">
					<input type = "text" name = "category" class ="form-control">
				</div>
			</div>
			
			<%-- 재고 수 - unitsInStock --%>
			<div class="mb-3 row">
				<label class="col-sm-2">재고 수</label>
				<div class = "col-sm-3">
					<input type = "text" id = "unitsInStock" name = "unitsInStock" class ="form-control">
				</div>
			</div>
			
			<%-- 이미지 파일 업로드 --%>
			<div class="mb-3 row">
				<label class="col-sm-2">이미지 파일</label>
				<div class = "col-sm-3">
					<input type = "file" name = "filename" class ="form-control">
				</div>
			</div>
			
			<%-- 등록 버튼  --%>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class ="btn btn-primary" value ="상품등록"
						onclick = "CheckAddGreen()">
				</div>
			</div>
		</form>
	</div>
</div>

<%@ include file = "footer.jsp" %>
</body>
</html>