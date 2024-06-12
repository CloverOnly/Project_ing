<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>회원수정</title>
</head>
<body>

<div class="container py-4">			
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">회원수정</h1>
			<p class="col-md-8 fs-4">Update</p>
		</div>
	</div>
			
			<div class="row align-items-md-stretch text-center">
				<div class="row justify-content-center align-items-center">
					<div class="h-100 p-5 col-md-6">
						<form class="form-signin" action="processUpdateMember.jsp" method="post">
							<div class="form-floating mb-3 row">
								<label for="floatingInput">아이디</label>
								<input type="text" class="form-control" name="id" required autofocus>
							</div>
							<div class="form-floating mb-3 row">
								<label for="floatingInput">비밀번호</label>
								<input type="password" class="form-control" name="passwd">
							</div>
							<div class="form-floating mb-3 row">
								<label for="floatingInput">이름</label>
								<input type="text" class="form-control" name="name">
							</div>
							<div class="mb-3 row">
								<div class="col-auto">성별</div>
								<div class="col-auto">
									<div class="form-check">
										<label for="male">남자</label>
										<input type="radio" class="form-check-input" id="male" name="gender" value="male" checked>
									</div>
								</div>
								<div class="col-auto">
									<div class="form-check">
										<label for="female">여자</label>
										<input type="radio" class="form-check-input" id="female" name="gender" value="female">
									</div>
								</div>	
							</div>
							<div class="form-floating mb-3 row">
								<label for="floatingInput">생년월일</label>							
								<input type="date" class="form-control" name="birth">
							</div>
							<div class="form-floating mb-3 row">
								<label for="floatingInput">이메일 주소</label>
								<input type="email" class="form-control" name="mail">
							</div>
							<div class="form-floating mb-3 row">
								<label for="floatingInput">전화번호</label>							
								<input type="tel" class="form-control" name="phone">
							</div>
							<div class="form-floating mb-3 row">
								<label for="floatingInput">주소</label>
								<input type="text" class="form-control" name="address">
							</div>
							<button class="btn btn-lg btn-success" type="submit">회원수정</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>