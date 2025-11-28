package com.qaboard.dao;

import com.qaboard.dto.MemberDTO;
import com.qaboard.util.DBUtil;

import java.sql.*;
import java.security.MessageDigest;

public class MemberDAO {

    // SHA-256 해시 (간단)
    private String sha256(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] b = md.digest(input.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder();
            for (byte x : b) {
                String hex = Integer.toHexString(0xff & x);
                if (hex.length() == 1) sb.append('0');
                sb.append(hex);
            }
            return sb.toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // 회원가입
    public boolean register(MemberDTO m) {
        String sql = "INSERT INTO member(userid, password, username) VALUES(?, ?, ?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, m.getUserid());
            pst.setString(2, sha256(m.getPassword()));
            pst.setString(3, m.getUsername());
            int r = pst.executeUpdate();
            return r > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 로그인 체크
    public MemberDTO login(String userid, String password) {
        String sql = "SELECT id, userid, password, username, regdate FROM member WHERE userid=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, userid);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    String stored = rs.getString("password");
                    if (stored.equals(sha256(password))) {
                        MemberDTO m = new MemberDTO();
                        m.setId(rs.getInt("id"));
                        m.setUserid(rs.getString("userid"));
                        m.setPassword(stored);
                        m.setUsername(rs.getString("username"));
                        m.setRegdate(rs.getString("regdate"));
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
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return true; // assume exists on error
        }
    }
}
