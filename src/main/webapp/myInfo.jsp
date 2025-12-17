<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.qaboard.dao.BoardDAO, com.qaboard.dto.BoardDTO" %>
<%@ page import="com.qaboard.dao.MemberDAO, com.qaboard.dto.MemberDTO" %>
<%@ page import="java.util.List" %>
<%@ include file="/header.jsp" %>
<%
String userid = (String)session.getAttribute("userid");
BoardDAO dao = new BoardDAO();
MemberDAO mao = new MemberDAO();
MemberDTO m = mao.findInfo(userid);
List<BoardDTO> list = dao.findMyBoard(userid);

if(m == null){
	out.print("<script>alert('로그인 필요')</script>");
	out.print("<script>location.href='login.jsp'</script>");
	return;
}

%>

<link rel="stylesheet" href="css/style.css">

<div class="container">
    <h1>마이페이지</h1>

    <p><strong>ID:</strong> <%=m.getUserid() %></p>
    <p><strong>이름:</strong> <%=m.getUsername() %></p>

    <br>
    <h2>내 글 목록</h2>

    <table class="table">
        <%
        int count = list.size()+1;
        for(BoardDTO b : list){ 
        count--;
        %>
        <tr onclick="location.href='boardChat.jsp?id=<%=b.getId() %>'" style="cursor:pointer;">
            <td><%=count %></td>
            <td><%=b.getTitle() %></td>
            <td><%=b.getRegdate() %></td>
        </tr>
        <%} %>
    </table>
</div>