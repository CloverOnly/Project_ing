<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String name = (String)request.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Board</title>
</head>
<script type="text/javascript">
    function checkForm(){
        if(!document.newWrite.name.value){
            alert("성명을 입력하세요");
            return false;
        }
        if(!document.newWrite.subject.value){
            alert("제목을 입력하세요");
            return false;    
        }
        if(!document.newWrite.content.value){
            alert("내용을 입력하세요");
            return false;
        }
    }
</script>
<body>
<jsp:include page="../header.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">게시판</h1>
    </div>
    
    <div class="container">
        
        <form name="newWrite" action="./BoardWriteAction.do" class="form-horizontal" 
                method="post" onsubmit="return checkForm()">
            
            <input name="id" type="hidden" class="form-control" value="${sessionId}">
            
            <div class="form-group row">
                <label class="col-sm-2 control-label">성명</label>
                <div class="col-sm-3">
                    <input name="name" type="text" class="form-control" value="<%=name %>" placeholder="name">
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-sm-2 control-label">제목</label>
                <div class="col-sm-5">
                    <input name="subject" type="text" class="form-control" placeholder="subject">
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-sm-2 control-label">내용</label>
                <div class="col-sm-8">
                    <textarea name="content" rows="5" cols="50" class="form-control" placeholder="content">
                    </textarea>
                </div>
            </div>
            
            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="등록">
                    <input type="reset" class="btn btn-primary" value="취소"> <!-- '최소'를 '취소'로 수정 -->
                </div>
            </div>            
        </form>
    </div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>