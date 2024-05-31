<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Book" %>
<%-- 도서 등록 만들기 위한 작업 --%>
<%@ page import = "dao.BookRepository" %>

<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<head>
<meta charset="UTF-8">
<title>도서 목록</title>
</head>
<body>
<div class= "container py-4">
    <%@ include file="menu.jsp" %>
    
    <div class = "p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class = "display-5 fw-blod">도서목록</h1>
            <p class = "col-md-8 fs-4">BookList</p>
        </div>
    </div> 
    
    <%
        //도서 등록 페이지를 위한 작업
        BookRepository dao = BookRepository.getInstance();
        ArrayList<Book> listOfBooks = dao.getAllbooks();
    %>    
    
    
    <div class="row align-items-md-stretch text-center">
        <% 
            for(int i=0; i< listOfBooks.size(); i++){
                Book book = listOfBooks.get(i);
        %>
        
        <div class="col-md-4">
            <div class="h-100 p-2">
                <h5><b><%=book.getName() %></b></h5>
                <p><%= book.getAuthor() %></p>
                <br><%=book.getPublisher() %> | 35<%=book.getUnitPrice() %>원
                <p>
                    <% 
                        String description = book.getDescription();
                        if (description.length() > 60) {
                            description = description.substring(0, 60) + "...";
                        }
                        out.print(description);
                    %>
                </p>
                <p><%=book.getUnitPrice() %>원</p>
                
                <%--도서 상세 정보 버튼 만들기 --%>
                <p><a href="./book.jsp?id=<%=book.getBookId() %>"
                class="btn btn-secondary" role="button">상세 정보 &raquo;></a></p>
            </div>
        </div>
        
        <%
        }
        %>
    </div>
    <%@ include file = "footer.jsp" %>
</div>
</body>
</html>
