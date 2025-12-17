package com.qaboard.dto;

public class MemberDTO {
    private String userid;
    private String password; // hashed
    private String username;

    // getters / setters
    public String getUserid() { return userid; }
    public void setUserid(String userid) { this.userid = userid; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
}
