<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.qaboard.dao.BoardDAO" %>
<%@ page import="com.qaboard.dto.BoardDTO" %>

<%
request.setCharacterEncoding("UTF-8");

// 로그인 체크
String userid = (String) session.getAttribute("userid");
if (userid == null) {
    response.sendRedirect("login.jsp");
    return;
}

// 파라미터 받기
String idStr = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

if (idStr == null || title == null || content == null ||
    title.trim().isEmpty() || content.trim().isEmpty()) {
    out.print("<script>alert('입력값 오류'); history.back();</script>");
    return;
}

int id = Integer.parseInt(idStr);

// DTO 생성
BoardDTO b = new BoardDTO();
b.setId(id);
b.setUserid(userid);
b.setTitle(title);
b.setContent(content);

// DB 업데이트
BoardDAO dao = new BoardDAO();
boolean result = dao.update(b);

if (result) {
    response.sendRedirect("boardChat.jsp?id=" + id);
} else {
    out.print("<script>alert('수정 실패'); history.back();</script>");
}
%>
