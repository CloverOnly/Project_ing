<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, dto.Green, dao.GreenRepository" %>

<!DOCTYPE html>
<html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<%
	String cartId = session.getId();
%>
<style>
.ta{
	width = "100%";
}

</style>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<%@ include file = "header.jsp" %>
	

<div class ="container py-4">
	<div class = "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class = "container-fluid py-5">
			<h1 class="display-5 fw-bold">장바구니</h1>
			<p class="col-md-8 fs-4">Cart</p>
		</div>
	</div>
	
	<div class = "row align-items-md-stretch">
		<div class = "row">
			<table class ="ta">
				<tr>
					<td align="left"><a href = "./deleteCart.jsp?cartId=<%=cartId %>"
						class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%=cartId %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style = "padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<td>상품</td>
					<td>가격</td>
					<td>수량</td>
					<td>소계</td>
					<td>비고</td>					
				</tr>
				<%
					int sum = 0;
					ArrayList<Green> cartList = (ArrayList<Green>)session.getAttribute("cartlist");
					if(cartList == null)
					cartList = new ArrayList<Green>();
					//상품리스트 하나씩 출력하기
					for(int i = 0; i < cartList.size(); i++){
					Green green = cartList.get(i);
					int total = green.getUnitPrice() * green.getQuantity();
					sum = sum + total;
				
				%>
				<tr>
					<td><%=green.getGreenId() %> - <%=green.getName()%> </td>
					<td><%=green.getUnitPrice() %></td>
					<td><%=green.getQuantity() %></td>
					<td><%=total %></td>
					<td><a href="./removeCart.jsp?id=<%=green.getGreenId() %>" class = "badge text-bg-danger">삭제</a></td>
					<td></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td></td>
					<td></td>
					<td>총액</td>
					<td><%=sum %></td>
					<td></td>
				</tr>
			</table>
			<a href = "./green.jsp" class = "btn btn-secondary">&laquo;쇼핑 계속하기</a>
		</div>
	</div>
</div>

<%@ include file = "footer.jsp" %>
</body>
</html>