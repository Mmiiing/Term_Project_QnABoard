package com.qaboard.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.qaboard.util.*;
import com.qaboard.dto.*;

public class ChatDAO {

    // 1. 채팅 추가
    public void addChat(int postId, String userId, String message) throws SQLException {
        String sql = "INSERT INTO Chat (boardId, userId, message) VALUES (?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
        	PreparedStatement pstmt = conn.prepareStatement(sql)) {
        	pstmt.setInt(1, postId);
            pstmt.setString(2, userId);
            pstmt.setString(3, message);
            pstmt.executeUpdate();
        }
    }
    
    // 2. 해당 게시판에 채팅이 있는지 검사
    public boolean isChat(int postId) {
    	String sql = "SELECT COUNT(*) AS recordCount FROM Chat WHERE boardId = ?";
    	try (Connection conn = DBUtil.getConnection();
    		PreparedStatement ps = conn.prepareStatement(sql)){
        ps.setInt(1, postId);
        int count = 0;
        try(ResultSet rs = ps.executeQuery()){
        	if(rs.next()) {
            	count = rs.getInt("recordCount");  //채팅이 있는지 없는지 검사
        	}
        }
        if(count > 0) return true;
    	}catch(SQLException e) {}
    	return false;
    }

    // 3. 게시글별 채팅 목록 불러오기 (chatId 순)
    public List<ChatDTO> getChatList(int postId) throws SQLException {
        List<ChatDTO> list = new ArrayList<>();
        String sql = "SELECT chatId, boardId, userId, message, regdate FROM Chat WHERE boardId=? ORDER BY chatId ASC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, postId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new ChatDTO(
                        rs.getInt("boardId"),
                        rs.getInt("chatId"),
                        rs.getString("userId"),
                        rs.getString("message"),
                        rs.getTimestamp("regdate")
                    ));
                }
            }
        }
        return list;
    }
}
