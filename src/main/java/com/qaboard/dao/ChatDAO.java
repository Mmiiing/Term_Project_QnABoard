package com.qaboard.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.qaboard.util.*;
import com.qaboard.dto.*;

public class ChatDAO {

    // 1. 채팅 추가
    public void addChat(int postId, String userId, String message) throws SQLException {
    	Connection conn = DBUtil.getConnection();
        String sql = "INSERT INTO Chat (boardId, userId, message) VALUES (?, ?, ?)";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        	pstmt.setInt(1, postId);
            pstmt.setString(2, userId);
            pstmt.setString(3, message);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        }
    }
    
    // 2. 해당 게시판에 채팅이 있는지 검사
    public boolean isChat(int postId) {
    	Connection conn = DBUtil.getConnection();
        
    	try {
        String sql = "SELECT COUNT(*) AS recordCount FROM Chat WHERE boardId = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, postId);
        ResultSet rs = ps.executeQuery();

        int count = 0;
        if(rs.next()) {
            count = rs.getInt("recordCount");  //채팅이 있는지 없는지 검사
        }
        rs.close();
        ps.close();
        conn.close();
        if(count > 0) return true;
    	}catch(SQLException e) {}
    	return false;
    }

    // 3. 게시글별 채팅 목록 불러오기 (chatId 순)
    public List<ChatDTO> getChatList(int postId) throws SQLException {
    	Connection conn = DBUtil.getConnection();
        List<ChatDTO> chatList = new ArrayList<>();
        
        String sql = "SELECT chatId, boardId, userId, message, regdate FROM Chat where boardId = " + postId + " ORDER BY chatId ASC";

        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                ChatDTO chat = new ChatDTO(
                	rs.getInt("boardId"),
                    rs.getInt("chatId"),
                    rs.getString("userId"),
                    rs.getString("message"),
                    rs.getTimestamp("regdate")
                );
                rs.close();
                stmt.close();
                conn.close();
                chatList.add(chat);
            }
        } catch (SQLException e) {
            // 테이블이 없으면 빈 리스트 반환 가능
            if (e.getMessage().contains("doesn't exist")) {
                return chatList;
            } else {
                throw e;
            }
        }

        return chatList;
    }
}
