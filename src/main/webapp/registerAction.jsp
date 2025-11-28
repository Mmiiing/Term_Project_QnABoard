<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.qaboard.dao.MemberDAO, com.qaboard.dto.MemberDTO" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    String username = request.getParameter("username");

    MemberDAO dao = new MemberDAO();
    
    if (dao.existsUserid(userid)) {
        out.println("<script>alert('이미 존재하는 아이디입니다.'); location.href='register.jsp';</script>");
        return;
    }

    com.qaboard.dto.MemberDTO m = new MemberDTO();
    m.setUserid(userid);
    m.setPassword(password);
    m.setUsername(username);

    boolean ok = dao.register(m);
    if (ok) {
        out.println("<script>alert('회원가입 완료. 로그인 해주세요.'); location.href='login.jsp';</script>");
    } else {
        out.println("<script>alert('오류 발생. 다시 시도하세요.'); history.back();</script>");
    }
%>
