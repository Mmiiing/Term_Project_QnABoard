<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.qaboard.dto.BoardDTO, com.qaboard.dao.BoardDAO" %>
<%

    BoardDTO b = new BoardDTO();
    b.setUserid("hii");
    b.setTitle("aa");
    b.setContent("ddd");

    BoardDAO dao = new BoardDAO();
    boolean ok = dao.insert(b);

    if (ok) {
        out.println("<script>alert('등록되었습니다.'); </script>");
    } else {
        out.println("<script>alert('등록 실패.'); </script>");
    }
%>