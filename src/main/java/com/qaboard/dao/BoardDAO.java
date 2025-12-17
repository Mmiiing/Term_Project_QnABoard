package com.qaboard.dao;

import com.qaboard.dto.BoardDTO;
import com.qaboard.util.DBUtil;
import java.sql.*;
import java.util.*;

public class BoardDAO {

    public boolean insert(BoardDTO b) {
        String sql = "INSERT INTO Board(userid, title, content) VALUES(?, ?, ?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, b.getUserid());
            pst.setString(2, b.getTitle());
            pst.setString(3, b.getContent());
            boolean isDone = pst.executeUpdate() > 0;
            return isDone;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<BoardDTO> listAll() {
        String sql = "SELECT id, userid, title, content, regdate, viewcnt FROM Board ORDER BY id DESC";
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
    
    public boolean delete(int id, String userid) {
        String sql = "DELETE FROM Board WHERE id=? AND userid=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, id);
            pst.setString(2, userid);

            return pst.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    
    public boolean update(BoardDTO b) {
        String sql = "UPDATE Board SET title=?, content=? WHERE id=? AND userid=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, b.getTitle());
            pst.setString(2, b.getContent());
            pst.setInt(3, b.getId());
            pst.setString(4, b.getUserid());

            return pst.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    
    public List<BoardDTO> findMyBoard(String userid){
    	String sql = "SELECT id, userid, title, content, regdate, viewcnt FROM Board WHERE userid = ? ORDER BY id DESC";
    	List<BoardDTO> list = new ArrayList<>();
    	try(Connection con = DBUtil.getConnection();
    		PreparedStatement pst = con.prepareStatement(sql)){
    		pst.setString(1, userid);
    		try(ResultSet rs = pst.executeQuery()){
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
    	}
    }catch(SQLException e) {
    	e.printStackTrace();
    }
    return list;
    }
    
    public void increaseView(int id) {
    	String sql = "UPDATE Board SET viewcnt = viewcnt + 1 WHERE id=?";
    	try(Connection con = DBUtil.getConnection();
    		PreparedStatement pst = con.prepareStatement(sql)){
    		pst.setInt(1, id);
    		pst.executeUpdate();
    	}catch(SQLException e) {
    		e.printStackTrace();
    	}
    }

    public BoardDTO findById(int id) {
        String sql = "SELECT id, userid, title, content, regdate, viewcnt FROM Board WHERE id=?";
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
        return null; //예의주시
    }
}
