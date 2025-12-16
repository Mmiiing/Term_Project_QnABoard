<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.qaboard.dao.ChatDAO, com.qaboard.dto.ChatDTO" %>

<%
String chatMsg = request.getParameter("chatMsg");
int boardId = Integer.parseInt(request.getParameter("boardId"));
String userId = (String)session.getAttribute("userid");

ChatDAO cao = new ChatDAO();
cao.addChat(boardId, userId, chatMsg);

out.print("<script>window.history.back()</script>");
%>