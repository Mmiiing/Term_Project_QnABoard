<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.qaboard.dao.BoardDAO, com.qaboard.dto.BoardDTO" %>
<%@ include file="/header.jsp" %>

<%
    String idStr = request.getParameter("id");
    if (idStr == null) { response.sendRedirect("board.jsp"); return; }
    int id = Integer.parseInt(idStr);
    BoardDAO dao = new BoardDAO();
    BoardDTO b = dao.findById(id);
    if (b == null) { response.sendRedirect("board.jsp"); return; }
%>

<div class="container">
    <h1>글 수정</h1>
    <form action="updateBoardAction.jsp" method="post">
        <input type="hidden" name="id" value="<%=b.getId()%>">
        <label>제목</label>
        <input type="text" name="title" value="<%=b.getTitle()%>">
        <label>내용</label>
        <textarea name="content" rows="10"><%=b.getContent()%></textarea>
        <button type="submit">수정 저장</button>
    </form>
</div>
