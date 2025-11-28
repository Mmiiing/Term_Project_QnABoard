<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>

<div class="container">
    <h1>로그인</h1>
    <form action="loginAction.jsp" method="post">
        <label>아이디</label>
        <input type="text" name="userid" required>

        <label>비밀번호</label>
        <input type="password" name="password" required>

        <button type="submit">로그인</button>
    </form>
</div>
