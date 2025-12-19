<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    session.setAttribute("userid", null);
	session.setAttribute("username", null);
    response.sendRedirect("home.jsp");
%>