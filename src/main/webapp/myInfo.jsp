<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="css/style.css">

<div class="container">
    <h1>마이페이지</h1>

    <p><strong>ID:</strong> DB에서 가져와야함</p>
    <p><strong>이메일:</strong> DB에서 가져와야함</p>

    <br>
    <h2>내 글 목록</h2>

    <table class="table">
        <tr>
            <th>No</th>
            <th>제목</th>
            <th>날짜</th>
        </tr>
        <tr onclick="location.href='boardChat.jsp?id=1'" style="cursor:pointer;">
            <td>1</td>
            <td>AI 질문이 있습니다!</td>
            <td>2025-11-22</td>
        </tr>
    </table>
</div>