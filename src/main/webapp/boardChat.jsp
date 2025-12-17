<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.qaboard.dao.BoardDAO, com.qaboard.dto.BoardDTO" %>
<%@ page import="com.qaboard.dao.ChatDAO, com.qaboard.dto.ChatDTO" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/chatStyle.css">
<script>
function sendChat() {
    const msg = document.getElementById("chatMsg").value;
    const boardId = document.getElementById("boardId").value;

    fetch("chatAction.jsp", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: "chatMsg=" + msg + "&boardId=" + boardId
    })
    .then(() => {
        document.getElementById("chatMsg").value = "";
        loadChat();
    });
}

function loadChat() {
    const boardId = document.getElementById("boardId").value;
    fetch("chatList.jsp?boardId=" + boardId)
        .then(res => res.text())
        .then(html => {
            document.getElementById("chatArea").innerHTML = html;
        });
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
    
    String key = "viewed_board_" + id;
    if(session.getAttribute(key) == null){
        dao.increaseView(id);	//세션 당 1회 조회수(로그인/비로그인 관계X) 증가
        session.setAttribute(key, true);
    }
    
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
    	<%
    	String userid = (String)session.getAttribute("userid");
    	if(b.getUserid().equals(userid)) {%>
        <a href="reviseBoard.jsp?id=<%=b.getId()%>"><button>Edit</button></a>
        <a href="deleteBoardAction.jsp?id=<%=b.getId()%>" onclick="return confirm('정말 게시글을 삭제하시겠습니까?');"
        ><button>Delete</button></a>
        <%} %>
    </div>
	
    <h3 style="margin-top:24px;">Chat</h3>
    <div class="chat-box">
        <!-- 채팅 입력 영역 -->
        <div id="chatArea"></div>
		<%if(session.getAttribute("userid") == null) {%>
		<p>로그인 후 채팅 사용 가능</p>
		<%} else{ %>
		<input type="hidden" id="boardId" value=<%=b.getId()%>>
		<input type="text" id="chatMsg">
		<button onclick="sendChat()">전송</button>
		<%} %>
		<script>
		loadChat(); // 최초 로딩
		</script>

    	</div>
</body>