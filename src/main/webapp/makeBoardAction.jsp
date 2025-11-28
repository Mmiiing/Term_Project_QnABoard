<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.qaboard.dto.BoardDTO, com.qaboard.dao.BoardDAO" %>
<%
    request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    String userid = (String) session.getAttribute("userid");
    if (userid == null) {
        out.println("<script>alert('로그인 후 작성하세요.'); location.href='login.jsp';</script>");
        return;
    }

    BoardDTO b = new BoardDTO();
    b.setUserid(userid);
    b.setTitle(title);
    b.setContent(content);

    BoardDAO dao = new BoardDAO();
    boolean ok = dao.insert(b);

    if (ok) {
        out.println("<script>alert('등록되었습니다.'); location.href='board.jsp';</script>");
    } else {
        out.println("<script>alert('등록 실패.'); history.back();</script>");
    }
%>
