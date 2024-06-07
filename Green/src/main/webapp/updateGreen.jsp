<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<head>
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<body>
<%@ include file = "header.jsp" %>

<div class = "container py-4">
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">	
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">상품 수정</h1>
			<p class="col-md-8 fs-4">Green Updating</p>
		</div>
	</div>
	
	<%@ include file ="dbconn.jsp" %>	
	<%
		String greenId = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM green WHERE g_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, greenId);
		rs=pstmt.executeQuery();
		if(rs.next()){
	%>
	<div class="row align-items-md-stretch">
		<div class="col-md-5">
			<img src="./image/<%=rs.getString("g_filename") %>" alt="image" style="width:100%" />
		</div>
		
		<div class="col-md-7">
			<form name="newGreen" action="./processUpdateGreen.jsp" method="post" enctype="multipart/form-date">
				<!-- 		상품 코드 -->
				<div class="mb-3" row>
					<label class ="col-sm-2">도서코드</label>
					<div class="col-sm-5">
						<input type="text" name="greenId" id="greenId" class="form-control" value='<%=rs.getString("g_id") %>'>
					</div>
				</div>
				
				<!-- 		상품명 -->
				<div class="mb-3" row>
					<label class ="col-sm-2">상품명</label>
					<div class="col-sm-5">
						<input type="text" name="name" id="name" class="form-control" value='<%=rs.getString("g_name") %>'>
					</div>
				</div>
				
<!-- 				가격 -->
				<div class="mb-3" row>
					<label class ="col-sm-2">가격</label>
					<div class="col-sm-5">
						<input type="text" name="unitPrice" id="unitPrice" class="form-control" value='<%=rs.getString("g_unitPrice") %>'>
					</div>
				</div>
				
<!-- 				재배자 -->
				<div class="mb-3" row>
					<label class ="col-sm-2">재배자</label>
					<div class="col-sm-5">
						<input type="text" name="author" id="author" class="form-control" value='<%=rs.getString("g_author") %>'>
					</div>
				</div>
				
<!-- 				수확시기 -->
				<div class="mb-3" row>
					<label class ="col-sm-2">수확시기</label>
					<div class="col-sm-5">
						<input type="text" name="releaseDate" id="releaseDate" class="form-control" value='<%=rs.getString("g_releaseDate") %>'>
					</div>
				</div>
				
<!-- 				상세정보 -->
				<div class="mb-3" row>
					<label class ="col-sm-2">상세정보</label>
					<div class="col-sm-5">
						<textarea name="description" id="description" rows="2" cols="50" class="form-control" 
								placeholder="50자 이상 적어주세요"><%=rs.getString("b_description") %></textarea>
					</div>
				</div>
				
<!-- 				원산지 -->
				<div class="mb-3" row>
					<label class ="col-sm-2">원산지</label>
					<div class="col-sm-5">
						<input type="text" name="category" id="category" class="form-control" value='<%=rs.getString("g_category") %>'>
					</div>
				</div>
				
<!-- 				재고 수 -->
				<div class="mb-3" row>
					<label class ="col-sm-2">재고 수</label>
					<div class="col-sm-5">
						<input type="text" name="unitsInStock" id="unitsInStock" class="form-control" value='<%=rs.getString("g_unitsInStock") %>'>
					</div>
				</div>
				
<!-- 				이미지 파일 -->
				<div class="mb-3" row>
					<label class ="col-sm-2">이미지</label>
					<div class="col-sm-8">
						<input type="file" name="filename" class="form-control">
					</div>
				</div>
				
				<div class="mb-3" row>
					<div class ="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="등록">
					</div>
				</div>
				
			</form>
		</div>
	</div>
	<% 
		}
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	%>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>