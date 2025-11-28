package com.qaboard.dto;

public class MemberDTO {
    private int id;
    private String userid;
    private String password; // hashed
    private String username;
    private String regdate;

    // getters / setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getUserid() { return userid; }
    public void setUserid(String userid) { this.userid = userid; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getRegdate() { return regdate; }
    public void setRegdate(String regdate) { this.regdate = regdate; }
}
