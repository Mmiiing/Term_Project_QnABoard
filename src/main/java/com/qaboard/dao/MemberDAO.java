package com.qaboard.dao;

import com.qaboard.dto.MemberDTO;
import com.qaboard.util.DBUtil;

import java.sql.*;

public class MemberDAO {
    // 회원가입
    public boolean register(MemberDTO m) {
        String sql = "INSERT INTO member(userid, password, username) VALUES(?, ?, ?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, m.getUserid());
            pst.setString(2, m.getPassword());
            pst.setString(3, m.getUsername());
            int r = pst.executeUpdate();
            pst.close();
            con.close();
            return r > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 로그인 체크
    public MemberDTO login(String userid, String password) {
        String sql = "SELECT userid, password, username, regdate FROM member WHERE userid=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, userid);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    String stored = rs.getString("password");
                    if (stored.equals(password)) {
                        MemberDTO m = new MemberDTO();
                        m.setUserid(rs.getString("userid"));
                        m.setPassword(stored);
                        m.setUsername(rs.getString("username"));
                        m.setRegdate(rs.getString("regdate"));
                        rs.close();
                        pst.close();
                        con.close();
                        return m;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean existsUserid(String userid) {
        String sql = "SELECT userid FROM member WHERE userid=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, userid);
            try (ResultSet rs = pst.executeQuery()) {
            	boolean isDone = rs.next();
            	rs.close();
            	pst.close();
            	con.close();
                return isDone;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return true; // assume exists on error
        }
    }
}
