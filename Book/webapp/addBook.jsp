<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>도서 등록</title>
</head>
<body>
<div class = "row align-items-md-stretch">
	<%@ include file = "menu.jsp" %>
	
	<%-- 소제목 --%>
	<div class = "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class = "container-fluid py-5">
			<h1 class="display-5 fw-bold">도서 등록</h1>
			<p class = "col-md-8 fs-4">Book Addition</p>
		</div>
	</div>
	
	<%-- 입력 받는 부분 --%>
	<div class = "row align-items-md-stretch">
	
	<%-- form 부분 --%>
		<form name="newBook" action="${contextPath}/Book/fileupload_process.do" method="post" enctype="multipart/form-data">
			
			<%-- 도서코드 - bookId --%>
			<div class="mb-3 row">
				<label class = "col-sm-2">도서코드</label>
				<div class = "col-sm-3">
					<input type="text" name="bookId" class="form-control">
				</div>
			</div>
			
			<%-- 도서명 - name --%>
			<div class = "mb-3 row">
				<label class="col-sm-2">도서명</label>
				<div class = "col-sm-3">
					<input type="text" name="name" class="form-control">
				</div>
			</div>
			
			<%-- 가격 - unitPrice --%>
			<div class="mb-3 row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type = "text" name = "unitPrice" class ="form-control">
				</div>
			</div>
			
			<%-- 저자 - author --%>
			<div class="mb-3 row">
				<label class="col-sm-2">저자</label>
				<div class = "col-sm-3">
					<input type = "text" name = "author" class ="form-control">
				</div>
			</div>
			
			<%-- 출판사 - publisher --%>
			<div class="mb-3 row">
				<label class="col-sm-2">출판사</label>
				<div class = "col-sm-3">
					<input type = "text" name = "publisher" class ="form-control">
				</div>
			</div>
			
			<%-- 출판일 - releaseDate --%>
			<div class="mb-3 row">
				<label class="col-sm-2">출판일</label>
				<div class = "col-sm-3">
					<input type = "text" name = "releaseDate" class ="form-control">
				</div>
			</div>
			
			<%-- 상세정보 - description --%>
			<div class="mb-3 row">
				<label class="col-sm-2">상세정보</label>
				<div class = "col-sm-5">
					<textarea name = "description" cols = "50" rows ="2"
					class = "form-control" placeholder="100자 이상 적어주세요"></textarea>
				</div>
			</div>
			
			<%-- 분류 - category --%>
			<div class="mb-3 row">
				<label class="col-sm-2">분류</label>
				<div class = "col-sm-3">
					<input type = "text" name = "category" class ="form-control">
				</div>
			</div>
			
			<%-- 재고 수 - unitsInStock --%>
			<div class="mb-3 row">
				<label class="col-sm-2">재고 수</label>
				<div class = "col-sm-3">
					<input type = "text" name = "unitsInStock" class ="form-control">
				</div>
			</div>
			
			<%-- 상태 - condition --%>
			<div class="mb-3 row">
				<label class="col-sm-2">상태</label>
				<div class = "col-sm-5">
					<input type = "radio" name="condition" value="New"> 신규도서
					<input type = "radio" name="condition" value="Old"> 중고도서
					<input type = "radio" name="condition" value="EBook"> E-Book
				</div>
			</div>
			
			<%-- 이미지 파일 업로드 --%>
			<div class="mb-3 row">
				<label class="col-sm-2">파일</label>
				<div class = "col-sm-3">
					<input type = "file" name = "filename" class ="form-control">
				</div>
			</div>
			
			<%-- 등록 버튼  --%>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class ="btn btn-primary" value ="등록">
				</div>
			</div>
		</form>
	</div>
	<%@ include file = "footer.jsp" %>
</div>
</body>
</html>

<%-- 262p --%>