<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GPT API 테스트</title>
</head>
<body>
<h2>GPT 테스트</h2>
<form action="gptTest" method="post">
    <input type="text" name="prompt" placeholder="질문을 입력하세요" style="width:300px;">
    <button type="submit">전송</button>
</form>

<hr>

<% 
    String result = (String) request.getAttribute("result");
    if(result != null) {
%>
    <h3>GPT 응답:</h3>
    <div><%= result %></div>
<%
    }
%>

</body>
</html>
