<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="mvc.BoardDTO" %>
<%
    BoardDTO notice = (BoardDTO) request.getAttribute("board");
    Integer numObj = (Integer) request.getAttribute("num");
    Integer pageObj = (Integer) request.getAttribute("page");

    // null 체크 및 기본값 설정
    int num = (numObj != null) ? numObj.intValue() : 0;
    int nowpage = (pageObj != null) ? pageObj.intValue() : 1;
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">게시판</h1>
    </div>
</div>
<div class="container">
    <%
        if (notice != null) {
    %>
    <form name="newUpdate" action="BoardUpdateAction.do?num=<%=notice.getNum() %>&pageNum=<%=nowpage %>"
        class="form-horizontal" method="post">
        <div class="form-group row">
            <label class="col-sm-2 control-label">성명</label>
            <div class="col-sm-3">
                <input name="name" class="form-control" value="<%=notice.getName() %>">
            </div>
        </div>
        
        <div class="form-group row">
            <label class="col-sm-2 control-label">제목</label>
            <div class="col-sm-5">
                <input name="subject" class="form-control" value="<%=notice.getSubject() %>">
            </div>
        </div>
        
        <div class="form-group row">
            <label class="col-sm-2 control-label">내용</label>
            <div class="col-sm-8" style="word-break: break-all;">
                <textarea name="content" class="form-control" cols="50" rows="5"><%=notice.getContent() %></textarea>
            </div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10">
                <c:set var="userId" value="<%=notice.getId() %>" />
                <c:if test="${sessionId==userId }">
                    <p><a href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
                        class="btn btn-danger">삭제</a></p>
                    <input type="submit" class="btn btn-success" value="수정">
                </c:if>
                <a href="./BoardListAction.do?pageNum=<%=nowpage%>" class="btn btn-primary">목록</a>
            </div>
        </div>    
    </form>
    <%
        } else {
            out.println("<p>게시글을 불러오는 데 문제가 발생했습니다. 다시 시도해 주세요.</p>");
        }
    %>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
