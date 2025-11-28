<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.qaboard.dao.BoardDAO, com.qaboard.dto.BoardDTO, java.util.List" %>
<%@ include file="/header.jsp" %>

<div class="container">
    <h1>게시판</h1>
    <a href="makeBoard.jsp"><button>글쓰기</button></a>

    <table class="table">
        <tr><th>No</th><th>제목</th><th>작성자</th><th>날짜</th></tr>
        <%
            BoardDAO dao = new BoardDAO();
            List<BoardDTO> list = dao.listAll();
            for (BoardDTO b : list) {
        %>
        <tr onclick="location.href='boardChat.jsp?id=<%=b.getId()%>'" style="cursor:pointer;">
            <td><%=b.getId()%></td>
            <td><%=b.getTitle()%></td>
            <td><%=b.getUserid()%></td>
            <td><%=b.getRegdate()%></td>
        </tr>
        <% } %>
    </table>
</div>
