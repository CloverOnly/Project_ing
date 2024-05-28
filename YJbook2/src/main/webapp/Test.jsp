<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, webtest.Travel, webtest.TravelRepository" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>

<%
    // POST 요청으로 전달된 데이터를 받기 위한 코드
    String travelId = request.getParameter("travelId");
    String travelArea = request.getParameter("travelArea");
    String category = request.getParameter("category");
    String unitPriceStr = request.getParameter("unitPrice");
    String subheading = request.getParameter("subheading");
    String explanation = request.getParameter("explain");
    String travelDate = request.getParameter("travelDate");

    // 금액은 숫자로 변환
    int unitPrice = 0;
    if (unitPriceStr != null && !unitPriceStr.isEmpty()) {
        unitPrice = Integer.parseInt(unitPriceStr);
    }

    // 이미지 파일 업로드 처리
    String imagePath = ""; // 이미지 파일의 경로를 저장할 변수
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    if (isMultipart) {
        try {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(request);

            for (FileItem item : items) {
                if (!item.isFormField()) { // 파일 필드인 경우
                    String fileName = new File(item.getName()).getName();
                    String uploadDir = getServletContext().getRealPath("/") + "uploads/";
                    String filePath = uploadDir + fileName;
                    File storeFile = new File(filePath);
                    item.write(storeFile);
                    imagePath = "uploads/" + fileName; // 이미지 파일의 경로 저장
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Travel 객체 생성 및 정보 설정
    Travel travel = new Travel();
    travel.setTravelId(travelId);
    travel.setTravelArea(travelArea);
    travel.setCategory(category);
    travel.setUnitPrice(unitPrice);
    travel.setSubheading(subheading);
    travel.setExplain(explanation);
    travel.setTravelDate(travelDate);
    travel.setImage(imagePath); // 이미지 파일의 경로 설정

    // TravelRepository를 사용하여 여행지 정보 저장
    TravelRepository repository = (TravelRepository) getServletContext().getAttribute("travel");
    repository.addTravel(travel);

    // 등록이 완료되면 사용자를 다른 페이지로 리다이렉트 또는 메시지 표시
    response.sendRedirect("registration_complete.jsp");
%>
