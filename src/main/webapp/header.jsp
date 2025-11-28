<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    session = request.getSession(false);
    String loginUser = null;
    String loginName = null;
    if (session != null) {
        loginUser = (String) session.getAttribute("userid");
        loginName = (String) session.getAttribute("username");
    }
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:16px;">
    <div style="display:flex; gap:12px; align-items:center;">
        <img src="/mnt/data/AI_Q&A_ShareBoard_구상도_초안.jpg" alt="logo" style="width:64px; height:48px; object-fit:cover; border-radius:6px;">
        <div>
            <h2 style="margin:0;">AI Q&A Board</h2>
            <small style="color:#cfcfcf;">간단 QnA 게시판</small>
        </div>
    </div>
    <div style="display:flex; gap:8px; align-items:center;">
        <a href="<%=request.getContextPath()%>/index.jsp">Home</a>
        <a href="<%=request.getContextPath()%>/board.jsp">게시판</a>
        <a href="<%=request.getContextPath()%>/makeBoard.jsp">글쓰기</a>

        <% if (loginUser == null) { %>
            <a href="<%=request.getContextPath()%>/login.jsp">로그인</a>
            <a href="<%=request.getContextPath()%>/register.jsp">회원가입</a>
        <% } else { %>
            <span style="color:#ddd;">환영, <strong><%= loginName %></strong></span>
            <a href="<%=request.getContextPath()%>/myInfo.jsp">마이페이지</a>
            <a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
        <% } %>
    </div>
</div>
<hr style="border:0; border-top:1px solid #333; margin-bottom:20px;">
