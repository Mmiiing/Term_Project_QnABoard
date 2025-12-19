<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.qaboard.dao.MemberDAO, com.qaboard.dto.MemberDTO" %>
<%@ page import="com.qaboard.dao.BoardDAO, com.qaboard.dto.BoardDTO" %>
<%@ page import="java.util.List" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");

    BoardDAO bao = new BoardDAO();
    List<BoardDTO> list = bao.listAll();
    MemberDAO dao = new MemberDAO();
    MemberDTO m = dao.login(userid, password);
    if (m != null) {
        session.setAttribute("userid", m.getUserid());
        session.setAttribute("username", m.getUsername());
        for(BoardDTO b : list){
        	String key = "viewed_board_" + b.getId();
            session.setAttribute(key, null);
        }
        out.println("<script>alert('로그인 성공'); location.href='home.jsp';</script>");
    } else {
        out.println("<script>alert('아이디 또는 비밀번호가 잘못되었습니다.'); location.href='login.jsp';</script>");
    }
%>
