package dao;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Book;
import dto.DBUtil;  // DB 연결을 위한 유틸리티 클래스

public class MemberRepository {
	private static MemberRepository instance = new MemberRepository();

    public static MemberRepository getInstance() {
        return instance;
    }
    
    public ArrayList<Member> getAllMember() {
        ArrayList<Member> listOfMember = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM member";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Book member = new Book();
                member.setId(rs.getString("id"));
                member.setPassword(rs.getString("password"));
                member.setUser_name(rs.getString("name"));
                member.setGender(rs.getString("gender"));
                member.setBirth(rs.getString("birth"));
                member.setMail(rs.getString("mail"));
                member.setPhone(rs.getString("phone"));
                member.setAddress(rs.getString("address"));
                listOfMember.add((Member) member);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, pstmt, conn);
        }
        return listOfMember;
    }
    
    public Member getMemberById(String id) {
        Book member = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM member WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                member = new Book();
                member.setBookId(rs.getString("b_id"));
                member.setId(rs.getString("id"));
                member.setPassword(rs.getString("password"));
                member.setUser_name(rs.getString("name"));
                member.setGender(rs.getString("gender"));
                member.setBirth(rs.getString("birth"));
                member.setMail(rs.getString("mail"));
                member.setPhone(rs.getString("phone"));
                member.setAddress(rs.getString("address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, pstmt, conn);
        }
        return (Member) member;
    }
}
