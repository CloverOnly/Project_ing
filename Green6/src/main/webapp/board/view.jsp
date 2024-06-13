<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="mvc.BoardDTO" %>
<%
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	System.out.println("#1");
	int num=((Integer) request.getAttribute("num")).intValue();
	System.out.println("#2");
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	System.out.println("#3");
	
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

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
	<form name="newUpdate" action="BoardUpdateAction.do?num=<%=notice.getNum() %>&pageNum=<%=nowpage%>"
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
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>