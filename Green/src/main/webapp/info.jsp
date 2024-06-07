<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Green, dao.GreenRepository" %>
<!-- , exceptionNoGreenId.jsp -->
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>상세 정보</title>
<script type="text/javascript">
<!-- 장바구니 페이지  -->
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
<body>
<%@ include file = "header.jsp" %>

<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">상품정보</h1>
            <p class="col-md-8 fs-4">vegetable Info</p>
        </div>
    </div>

    <%
        String id = request.getParameter("id");
        GreenRepository dao = GreenRepository.getInstance();
        Green green = dao.getGreenById(id);
    %>

    <% if (green != null) { %>
        <div class="row align-items-md-stretch">
            <div class="col-md-12">
            	<div class = "col-md-5">
            	<img src = "./image/<%=green.getFilename() %>" style = "width : 70%"  /> 
                </div>
                <h3><b><%= green.getName() %></b></h3>
                <p><%=green.getDescription() %></p>
                <p><b>상품코드 : </b><span class="badge text-bg-danger"><%=green.getGreenId() %></span></p>
                <p><b>저자</b> : <%=green.getAuthor() %></p>
                <p><b>출판일</b> : <%=green.getReleaseDate() %></p>
                <p><b>분류</b> : <%=green.getCategory() %></p>
                <p><b>재고 수</b> : <%=green.getUnitsInStock() %></p>
                <h4><%=green.getUnitPrice() %>원</h4>
                <p>
                	<form name="addForm" action="./addCart.jsp?id=<%=green.getGreenId() %>" method = "post">
                           <!-- onclick신경쓸것 -->
                		<a href="#" class="btn btn-info" onclick ="addToCart()">상품주문 &raquo;</a>
                		<a href="./cart.jsp" class= "btn btn-warning">장바구니 &raquo;</a>
						<a href="./green.jsp" class="btn btn-secondary">상품목록 &raquo;</a>                	
                	</form>
                </p> 
            </div>
        </div>
    <% } else { %>
        <div>
            <p>상품을 찾을 수 없습니다.</p>
            <p><a href="./green.jsp" class="btn btn-secondary">상품목록으로 돌아가기 &raquo;</a></p>
        </div>
    <% } %>
</div>

<%@ include file = "footer.jsp" %>
</body>
</html>