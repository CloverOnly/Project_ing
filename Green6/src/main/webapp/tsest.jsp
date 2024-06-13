<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*, java.sql.*, java.util.*, dto.Green, dao.GreenRepository" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "java.sql.*, java.io.*, java.util.*" %>

<%@ include file = "dbconn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");

    // 변수 초기화
    String greenId = null;
    String name = null;
    String unitPrice = null;
    String author = null;
    String releaseDate = null;
    String description = null;
    String category = null;
    String unitsInStock = null;
    String fileName = null;

    // 이미지 파일 업로드
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (isMultipart) {
        File fileUploadPath = new File("C:\\web\\Green\\src\\main\\webapp\\image");
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(fileUploadPath);
        factory.setSizeThreshold(1024 * 1024);
        ServletFileUpload upload = new ServletFileUpload(factory);
        
        try {
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {
                if (!item.isFormField()) {
                    fileName = item.getName();
                    if (fileName != null && !fileName.isEmpty()) {
                        File uploadedFile = new File(fileUploadPath, fileName);
                        item.write(uploadedFile);
                    }
                } else {
                    if (item.getFieldName().equals("greenId")) {
                        greenId = item.getString("utf-8");
                    } else if (item.getFieldName().equals("name")) {
                        name = item.getString("utf-8");
                    } else if (item.getFieldName().equals("unitPrice")) {
                        unitPrice = item.getString("utf-8");
                    } else if (item.getFieldName().equals("author")) {
                        author = item.getString("utf-8");
                    } else if (item.getFieldName().equals("releaseDate")) {
                        releaseDate = item.getString("utf-8");
                    } else if (item.getFieldName().equals("description")) {
                        description = item.getString("utf-8");
                    } else if (item.getFieldName().equals("category")) {
                        category = item.getString("utf-8");
                    } else if (item.getFieldName().equals("unitsInStock")) {
                        unitsInStock = item.getString("utf-8");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        greenId = request.getParameter("greenId");
        name = request.getParameter("name");
        unitPrice = request.getParameter("unitPrice");
        author = request.getParameter("author");
        releaseDate = request.getParameter("releaseDate");
        description = request.getParameter("description");
        category = request.getParameter("category");
        unitsInStock = request.getParameter("unitsInStock");
    }

    Integer price = (unitPrice == null || unitPrice.isEmpty()) ? 0 : Integer.valueOf(unitPrice);
    Integer stock = (unitsInStock == null || unitsInStock.isEmpty()) ? 0 : Integer.valueOf(unitsInStock);

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String sql = "SELECT * FROM green WHERE g_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, greenId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            if (fileName != null && !fileName.isEmpty()) {
                sql = "UPDATE green SET g_name=?, g_unitPrice=?, g_author=?, g_description=?, g_category=?, g_unitsInStock=?, g_releaseDate=?, g_fileName=? WHERE g_id=?";
            } else {
                sql = "UPDATE green SET g_name=?, g_unitPrice=?, g_author=?, g_description=?, g_category=?, g_unitsInStock=?, g_releaseDate=? WHERE g_id=?";
            }
            pstmt.close(); // 기존 pstmt 닫기
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setInt(2, price);
            pstmt.setString(3, author);
            pstmt.setString(4, description);
            pstmt.setString(5, category);
            pstmt.setInt(6, stock);
            pstmt.setString(7, releaseDate);
            if (fileName != null && !fileName.isEmpty()) {
                pstmt.setString(8, fileName);
                pstmt.setString(9, greenId);
            } else {
                pstmt.setString(8, greenId);
            }
            pstmt.executeUpdate();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    response.sendRedirect("editGreen.jsp?edit=update");
%>
</body>
</html>
