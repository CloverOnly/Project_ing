<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Book" %>
<%@ page import = "dao.BookRepository" %>

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
<title>Insert title here</title>
</head>
<body>
<div class ="container py-4">
	<%@ include file = "menu.jsp" %>
	
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
					<td>도서</td>
					<td>가격</td>
					<td>수량</td>
					<td>소계</td>
					<td>비고</td>					
				</tr>
				<%
					int sum = 0;
					ArrayList<Book> cartList = (ArrayList<Book>)session.getAttribute("cartlist");
					if(cartList == null)
					cartList = new ArrayList<Book>();
					//상품리스트 하나씩 출력하기
					for(int i = 0; i < cartList.size(); i++){
					Book book = cartList.get(i);
					int total = book.getUnitPrice() * book.getQuantity();
					sum = sum + total;
				
				%>
				<tr>
					<td><%=book.getBookId() %> - <%=book.getName()%> </td>
					<td><%=book.getUnitPrice() %></td>
					<td><%=book.getQuantity() %></td>
					<td><%=total %></td>
					<td><a href="./removeCart.jsp?id=<%=book.getBookId() %>" class = "badge text-bg-danger">삭제</a></td>
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
			<a href = "./book.jsp" class = "btn btn-secondary">&laquo;쇼핑 계속하기</a>
		</div>
	</div>
	
	<%@ include file = "footer.jsp" %>
</div>
</body>
</html>