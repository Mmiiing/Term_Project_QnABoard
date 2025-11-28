<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>

<div class="container">
    <h1>회원가입</h1>
    <form action="registerAction.jsp" method="post">
        <label>아이디</label>
        <input type="text" name="userid" required>

        <label>비밀번호</label>
        <input type="password" name="password" required>

        <label>이름</label>
        <input type="text" name="username" required>

        <button type="submit">가입하기</button>
    </form>
</div>
