<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.qaboard.dao.BoardDAO" %>

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
if (idStr == null) {
    out.print("<script>alert('잘못된 접근'); location.href='board.jsp';</script>");
    return;
}

int id = Integer.parseInt(idStr);

// 삭제 처리
BoardDAO dao = new BoardDAO();
boolean result = dao.delete(id, userid);

if (result) {
    out.print("<script>alert('삭제되었습니다'); location.href='board.jsp';</script>");
} else {
    out.print("<script>alert('삭제 실패 또는 권한 없음'); history.back();</script>");
}
%>
