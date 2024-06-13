package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Green;
import dto.DBUtil;  // DB 연결을 위한 유틸리티 클래스

public class GreenRepository {

    private static GreenRepository instance = new GreenRepository();

    public static GreenRepository getInstance() {
        return instance;
    }

    // 특정 채소를 가져오는 메서드
    public ArrayList<Green> getAllGreen() {
        ArrayList<Green> listOfGreen = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM green";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
            	Green green = new Green();
                green.setGreenId(rs.getString("g_id"));
                green.setName(rs.getString("g_name"));
                green.setAuthor(rs.getString("g_author"));
                green.setDescription(rs.getString("g_description"));
                green.setCategory(rs.getString("g_category"));
                green.setUnitsInStock(rs.getInt("g_unitsInStock"));
                green.setReleaseDate(rs.getString("g_releaseDate")); 
                green.setUnitPrice(rs.getInt("g_unitPrice"));
                green.setFilename(rs.getString("g_filename"));
                listOfGreen.add(green);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, pstmt, conn);
        }
        return listOfGreen;
    }

    // 특정 책을 ID로 가져오는 메서드
    public Green getGreenById(String greenId) {
    	Green green = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM green WHERE g_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, greenId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	
                green = new Green();
                green.setGreenId(rs.getString("g_id"));
                green.setName(rs.getString("g_name"));
                green.setAuthor(rs.getString("g_author"));
                green.setDescription(rs.getString("g_description"));
                green.setCategory(rs.getString("g_category"));
                green.setUnitsInStock(rs.getInt("g_unitsInStock"));
                green.setReleaseDate(rs.getString("g_releaseDate"));
                green.setUnitPrice(rs.getInt("g_unitPrice"));
                green.setFilename(rs.getString("g_filename"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, pstmt, conn);
        }
        return green;
    }
}