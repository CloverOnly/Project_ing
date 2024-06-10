<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script type = "text/javascript" src="./js/validation.js"></script>

<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<div class = "row align-items-md-stretch">
	<%@ include file = "/menu.jsp" %>

	<%-- 소제목 --%>
	<div class = "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class = "container-fluid py-5">
			<h1 class="display-5 fw-bold">회원 가입</h1>
			<p class = "col-md-8 fs-4">Member Addition</p>
		</div>
		
	</div>
	
	<div class = "row align-items-md-stretch">
		<form name="newBook" action="processAddMember.jsp" method="post" enctype="multipart/form-data">
			<%-- 아이디 --%>
			<div class="mb-3 row">
				<label class = "col-sm-2">아이디</label>
				<div class = "col-sm-3">
					<input type="text" id = "id" name="id" class="form-control">
				</div>
			</div>
			
			<%-- 비밀번호 --%>
			<div class="mb-3 row">
				<label class = "col-sm-2">비밀번호</label>
				<div class = "col-sm-3">
					<input type="text" id = "password" name="password" class="form-control">
				</div>
			</div>
			
			<%-- 이름 --%>
			<div class="mb-3 row">
				<label class = "col-sm-2">이름</label>
				<div class = "col-sm-3">
					<input type="text" id = "name" name="name" class="form-control">
				</div>
			</div>
			
			<%-- 생일 --%>
			<div class="mb-3 row">
				<label class = "col-sm-2">생일</label>
				<div class = "col-sm-3">
					<input type="text" id = "birth" name="birth" class="form-control">
				</div>
			</div>
			
			<%-- mail --%>
			<div class="mb-3 row">
				<label class = "col-sm-2">mail</label>
				<div class = "col-sm-3">
					<input type="text" id = "mail" name="mail" class="form-control">
				</div>
			</div>
			
			<%-- 전화번호 --%>
			<div class="mb-3 row">
				<label class = "col-sm-2">전화번호</label>
				<div class = "col-sm-3">
					<input type="text" id = "phone" name="phone" class="form-control">
				</div>
			</div>
			
			<%-- 주소 --%>
			<div class="mb-3 row">
				<label class = "col-sm-2">주소</label>
				<div class = "col-sm-3">
					<input type="text" id = "address" name="address" class="form-control">
				</div>
			</div>
			
			<%-- 성별 --%>
			<div class="mb-3 row">
				<label class="col-sm-2">성별</label>
				<div class = "col-sm-5">
					<input type = "radio" name="gender" value="Men"> 남자
					<input type = "radio" name="gender" value="Women"> 여자
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
	<%@ include file = "/footer.jsp" %>
</div>
</body>
</html>