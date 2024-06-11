package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Book;
import dto.DBUtil;  // DB 연결을 위한 유틸리티 클래스

public class BookRepository {

    private static BookRepository instance = new BookRepository();

    public static BookRepository getInstance() {
        return instance;
    }

    // 모든 책을 가져오는 메서드
    public ArrayList<Book> getAllBooks() {
        ArrayList<Book> listOfBooks = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM book";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getString("b_id"));
                book.setName(rs.getString("b_name"));
                book.setAuthor(rs.getString("b_author"));
                book.setDescription(rs.getString("b_description"));
                book.setPublisher(rs.getString("b_publisher"));
                book.setCategory(rs.getString("b_category"));
                book.setUnitsInStock(rs.getInt("b_unitsInStock"));
                book.setReleaseDate(rs.getString("b_releaseDate"));
                book.setCondition(rs.getString("b_condition"));
                book.setUnitPrice(rs.getInt("b_unitPrice"));
                book.setFilename(rs.getString("b_filename"));
                listOfBooks.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, pstmt, conn);
        }
        return listOfBooks;
    }

    // 특정 책을 ID로 가져오는 메서드
    public Book getBookById(String bookId) {
        Book book = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM book WHERE b_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bookId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                book = new Book();
                book.setBookId(rs.getString("b_id"));
                book.setName(rs.getString("b_name"));
                book.setAuthor(rs.getString("b_author"));
                book.setDescription(rs.getString("b_description"));
                book.setPublisher(rs.getString("b_publisher"));
                book.setCategory(rs.getString("b_category"));
                book.setUnitsInStock(rs.getInt("b_unitsInStock"));
                book.setReleaseDate(rs.getString("b_releaseDate"));
                book.setCondition(rs.getString("b_condition"));
                book.setUnitPrice(rs.getInt("b_unitPrice"));
                book.setFilename(rs.getString("b_filename"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, pstmt, conn);
        }
        return book;
    }
}