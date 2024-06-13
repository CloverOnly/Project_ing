<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.*, mvc.BoardDTO" %>
<%
	String sessionId1 = (String)session.getAttribute("sessionId");
	List boardList = (List)request.getAttribute("boardlist");
	System.out.println("#1");
	int total_record = ((Integer)request.getAttribute("total_record")).intValue();
	System.out.println("#2");
	int pageNum = ((Integer)request.getAttribute("pageNum")).intValue();
	System.out.println("#3");
	int total_page = ((Integer)request.getAttribute("total_page")).intValue();
	System.out.println("#4");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Board</title>
<script type="text/javascript">
	function checkForm(){
		if(${sessionId==null}){
			alert("로그인 해주세요.");
			return false;
		}
		location.href="./BoardWriteForm.do?id=<%=sessionId1%>"
	}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="jumbotron">

	<div class="container">
		<h1 class="display-3">게시판</h1>
	</div>
</div>
<div class="container">
	<form action="<c:url value="./BoardListAction.do"/>" method="post">
		<div>
			<div class="text-rigth">
				<span class="badge badge-success">전체 <%=total_record %>건</span>
			</div>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성일</td>
					<td>조회</td>
					<td>글쓴이</td>
				</tr>
				<% 
					for(int j = 0; j<boardList.size(); j++){
						BoardDTO notice = (BoardDTO)boardList.get(j);
				%>
				<tr>
					<td><%=notice.getNum() %></td>
					<td><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject() %></a></td>
					<td><%=notice.getRegist_day() %></td>
					<td><%=notice.getHit() %></td>
					<td><%=notice.getName() %></td>
				</tr>
				<%
					}
				%>	
			</table>
		</div>
		<div align="center">
			<c:set var="pageNum" value="<%=pageNum %>"/>
			<c:forEach var="i" begin="1" end="<%=total_page %>">
				<a href="<c:url value="./BoardListAction.do?pageNum=${i}"/>">
					<c:choose>
						<c:when test="${pageNum==i}">
							<font color='4C5317'><b>[${i}]</b></font>
						</c:when>
						<c:otherwise>
							<font color='4C5317'>[${i} }]</font>
						</c:otherwise>
					</c:choose>
				</a>
			</c:forEach>
		</div>
		<div align="left">
			<table>
				<tr>
					<td width="100%" align="left">&nbsp;&nbsp;
						<select name="items" class="txt">
							<option value="subject">제목에서</option>
							<option value="content">본문에서</option>
							<option value="name">글쓴이에서</option>
						</select><input name="text" type="text" /><input type="submit" id="btnAdd" class="btn btn-primary" value="검색"/>
					</td>
					<td width="100%" align="right">
						<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">&laquo;글쓰기</a>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>