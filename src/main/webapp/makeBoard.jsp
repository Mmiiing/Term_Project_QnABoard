<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="css/style.css">

<div class="container">
    <h1>새 글 작성하기</h1>

    <form action="makeBoardAction.jsp" method="post">
        <label>제목</label>
        <input type="text" name="title">

        <label>내용</label>
        <textarea name="content" rows="10"></textarea>

        <button type="submit">등록하기</button>
    </form>
</div>
