package com.qaboard.dto;

import java.sql.Timestamp;

public class ChatDTO {
    private int chatId;
    private int boardId;
    private String userId;
    private String message;
    private Timestamp regdate;

    public ChatDTO(int chatId, int boardId, String userId, String message, Timestamp regdate) {
        this.chatId = chatId;
        this.boardId = boardId;
        this.userId = userId;
        this.message = message;
        this.regdate = regdate;
    }

    // getter & setter
    public int getChatId() {
        return chatId;
    }

    public void setChatId(int chatId) {
        this.chatId = chatId;
    }
    
    public int getBoardId() {
    	return boardId;
    }
    
    public void setBoardId(int boardId) {
    	this.boardId = boardId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getRegdate() {
        return regdate;
    }

    public void setRegdate(Timestamp regdate) {
        this.regdate = regdate;
    }

    @Override
    public String toString() {
        return "[" + chatId + "] " + userId + ": " + message + " (" + regdate + ")";
    }
}
