package dao;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import dto.Green;

//어노테이션
@WebServlet("/fileupload_process.do")
public class Fileupload_process extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.print("111");
        request.setCharacterEncoding("utf-8");
        
        String greenId = null;
        String name = null;
        String author = null;
        String description = null;
        
        String category = null;
        String releaseDate = null;
       
        String filename = null;
        String unitPriceStr = null;
        String unitsInStockStr = null;
        
        int unitPrice = 0;
        int unitsInStock = 0;
        
        // Use relative path for file upload
        String uploadPath = getServletContext().getRealPath("/") + "image";
        //오류 확인
        System.out.println("222");
        //경로 확인
        System.out.println(uploadPath);
        File fileUploadPath = new File(uploadPath);
        
        if (!fileUploadPath.exists()) {
            fileUploadPath.mkdirs();
        }
        
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(fileUploadPath);
        factory.setSizeThreshold(1024 * 1024);
        
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            java.util.List<FileItem> items = upload.parseRequest(request);
            Iterator<FileItem> params = items.iterator();
            
            while (params.hasNext()) {
                FileItem fileItem = (FileItem) params.next();
                
                if (fileItem.isFormField()) {
                    switch (fileItem.getFieldName()) {
                        case "greenId":
                            greenId = fileItem.getString("utf-8");
                            break;
                        case "name":
                            name = fileItem.getString("utf-8");
                            break;
                        case "author":
                            author = fileItem.getString("utf-8");
                            break;
                        case "description":
                            description = fileItem.getString("utf-8");
                            break;
                        case "category":
                            category = fileItem.getString("utf-8");
                            break;
                        case "releaseDate":
                            releaseDate = fileItem.getString("utf-8");
                            break;
                        
                        case "unitPrice":
                            unitPriceStr = fileItem.getString("utf-8");
                            break;
                        case "unitsInStock":
                            unitsInStockStr = fileItem.getString("utf-8");
                            break;
                    }
                } else {
                    filename = new File(fileItem.getName()).getName();
                    if (filename != null && !filename.isEmpty()) {
                        File file = new File(fileUploadPath, filename);
                        fileItem.write(file);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        if (unitPriceStr != null && !unitPriceStr.isEmpty()) {
            try {
                unitPrice = Integer.parseInt(unitPriceStr);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        if (unitsInStockStr != null && !unitsInStockStr.isEmpty()) {
            try {
                unitsInStock = Integer.parseInt(unitsInStockStr);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        
        GreenRepository create = GreenRepository.getInstance();
        
        Green newGreen = new Green(greenId, name, author, category, releaseDate, unitPrice, unitsInStock);
        newGreen.setDescription(description);
        newGreen.setFilename(filename);
        
        
        
        // Redirect to the green list page
        response.sendRedirect(request.getContextPath() + "/green.jsp");
    }
}