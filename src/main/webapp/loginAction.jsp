<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.qaboard.dao.MemberDAO, com.qaboard.dto.MemberDTO" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");

    MemberDAO dao = new MemberDAO();
    MemberDTO m = dao.login(userid, password);
    if (m != null) {
        session.setAttribute("userid", m.getUserid());
        session.setAttribute("username", m.getUsername());
        out.println("<script>alert('로그인 성공'); location.href='index.jsp';</script>");
    } else {
        out.println("<script>alert('아이디 또는 비밀번호가 잘못되었습니다.'); location.href='login.jsp';</script>");
    }
%>
