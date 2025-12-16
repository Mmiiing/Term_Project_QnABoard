<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.qaboard.dao.BoardDAO, com.qaboard.dto.BoardDTO" %>
<%@ page import="com.qaboard.dao.ChatDAO, com.qaboard.dto.ChatDTO" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/chatStyle.css">
<script>
function update(){
	document.form.chatMsg.value = "";
	window.location.reload()
}
</script>
</head>
</html>
<body>
<%
    String idStr = request.getParameter("id");
    if (idStr == null) {
        out.println("<script>alert('잘못된 접근'); location.href='board.jsp';</script>");
        return;
    }
    int id = Integer.parseInt(idStr);
    BoardDAO dao = new BoardDAO();
    BoardDTO b = dao.findById(id);
    if (b == null) {
        out.println("<script>alert('존재하지 않는 글입니다.'); location.href='board.jsp';</script>");
        return;
    }
%>

<div class="container">
    <h1><%= b.getTitle() %></h1>
    <p style="color:#aaa;">작성자: <%= b.getUserid()%> · <%= b.getRegdate() %></p>
    <div style="margin-top:20px; padding:12px; background:#222; border-radius:8px; white-space:pre-wrap;">
        <%= b.getContent() %>
    </div>

    <div style="margin-top:14px;">
        <a href="reviseBoard.jsp?id=<%=b.getId()%>"><button>수정</button></a>
        <a href="board.jsp"><button>목록</button></a>
    </div>
	
    <h3 style="margin-top:24px;">댓글(간단)</h3>
    <div class="chat-box">
        <!-- 댓글은 별도 테이블/기능으로 확장 가능 (현재는 시연용 정적 메시지) -->
        <!-- 채팅 목록 영역 -->
        <div class="chat-msg"> 
        	<table>
        	<%
        	ChatDAO cao = new ChatDAO();
        	
        	if(cao.isChat(b.getId())){
        		List<ChatDTO> chatList = cao.getChatList(b.getId());
        		for(ChatDTO c:chatList){
                	%>
                		<tr><td><strong><%=c.getUserId()%> : <%=c.getMessage()%></strong></td></tr>
                	<%}}
        	else{
        	%><tr><td><strong>채팅 없음</strong></td></tr><%}%>
        	</table>
        </div>
        <!-- 채팅 입력 영역 -->
        <div class="chat-input">
        	<form action="chatAction.jsp" method="post" onclick=update()>
        		<input type="text" name="chatMsg" placeholder="메시지 입력"/>
        		<input type="hidden" name="boardId" value="<%=b.getId()%>"/>
        		<input type="submit" value="전송"/>
        	</form>
        </div>
    </div>
</div>
</body>