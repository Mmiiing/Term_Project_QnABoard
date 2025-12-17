<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.qaboard.dao.ChatDAO, com.qaboard.dto.ChatDTO" %>

<%
int boardId = Integer.parseInt(request.getParameter("boardId"));
ChatDAO dao = new ChatDAO();
List<ChatDTO> list = dao.getChatList(boardId);

for(ChatDTO c : list){
%>
    <div>
        <b><%=c.getUserId()%></b> : <%=c.getMessage()%>
        <small>(<%=c.getRegdate()%>)</small>
    </div>
<%
}
%>
