package com.qaboard.dao;

import com.qaboard.dto.BoardDTO;
import com.qaboard.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

    public boolean insert(BoardDTO b) {
        String sql = "INSERT INTO board(userid, title, content) VALUES(?, ?, ?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, b.getUserid());
            pst.setString(2, b.getTitle());
            pst.setString(3, b.getContent());
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<BoardDTO> listAll() {
        String sql = "SELECT id, userid, title, content, regdate, viewcnt FROM board ORDER BY id DESC";
        List<BoardDTO> list = new ArrayList<>();
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                BoardDTO b = new BoardDTO();
                b.setId(rs.getInt("id"));
                b.setUserid(rs.getString("userid"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("content"));
                b.setRegdate(rs.getString("regdate"));
                b.setViewcnt(rs.getInt("viewcnt"));
                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public BoardDTO findById(int id) {
        String sql = "SELECT id, userid, title, content, regdate, viewcnt FROM board WHERE id=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setInt(1, id);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    BoardDTO b = new BoardDTO();
                    b.setId(rs.getInt("id"));
                    b.setUserid(rs.getString("userid"));
                    b.setTitle(rs.getString("title"));
                    b.setContent(rs.getString("content"));
                    b.setRegdate(rs.getString("regdate"));
                    b.setViewcnt(rs.getInt("viewcnt"));
                    return b;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
