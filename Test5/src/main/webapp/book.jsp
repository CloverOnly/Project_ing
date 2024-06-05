<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Book" %>
<%-- 도서 등록 페이지를 위한 작업 --%>
<%@ page import="dao.BookRepository" %>
<!-- 오류 페이지 호출 -->
<%@ page errorPage = "exceptionNoBookId.jsp" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>도서 정보</title>
<!-- 장바구니 페이지  -->
<script type="text/javascript">
	function addToCart(){
		if(confirm("도서를 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
<div class="container py-4">
    <%@ include file = "menu.jsp" %>
    -
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">도서정보</h1>
            <p class="col-md-8 fs-4">BookInfo</p>
        </div>
    </div>

    <%
        String id = request.getParameter("id");
        //도서 등록 페이지를 위한 작업
        BookRepository dao = BookRepository.getInstance();
        //수정
        Book book = dao.getBookById(id);
    %>

    <% if (book != null) { %>
          
        <%@ include file = "dbconn.jsp" %>
    <%
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = "SELECT * FROM book";
    	pstmt = conn.prepareStatement(sql);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    %>
        <div class="col-md-4">
            <div class="h-100 p-2">
                <img src="./image/<%=rs.getString("b_filename") %>" class="img" /> 
                <h5><b><%=rs.getString("b_name") %></b></h5>
                <p><%= rs.getString("b_author") %></p>
                <br><%=rs.getString("b_publisher") %> | <%=rs.getString("b_unitPrice") %>원
                <p><%=rs.getString("b_description") %></p>
                <p><%=rs.getString("b_unitPrice") %>원</p>
                
            </div>
        </div>
                <p>
                	<form name="addForm" action="./addCart.jsp?id=<%=book.getBookId() %>" method = "post">
                           <!-- onclick신경쓸것 -->
                		<a href="#" class="btn btn-info" onclick ="addToCart()">도서주문 &raquo;</a>
                		<a href="./cart.jsp" class= "btn btn-warning">장바구니 &raquo;</a>
						<a href="./books.jsp" class="btn btn-secondary">도서목록 &raquo;</a>                	
                	</form>
                </p> 
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
       
    <% } else { %>
        <div>
            <p>책을 찾을 수 없습니다.</p>
            <p><a href="./books.jsp" class="btn btn-secondary">도서목록으로 돌아가기 &raquo;</a></p>
        </div>
    <% } %>
    <%@ include file = "footer.jsp" %>
</div>
</body>
</html>