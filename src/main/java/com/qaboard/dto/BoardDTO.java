package com.qaboard.dto;

public class BoardDTO {
    private int id;
    private String userid;
    private String title;
    private String content;
    private String regdate;
    private int viewcnt;

    // getters / setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getUserid() { return userid; }
    public void setUserid(String userid) { this.userid = userid; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public String getRegdate() { return regdate; }
    public void setRegdate(String regdate) { this.regdate = regdate; }
    public int getViewcnt() { return viewcnt; }
    public void setViewcnt(int viewcnt) { this.viewcnt = viewcnt; }
}
