<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="로그인" />
<%@ include file="../common/head.jsp"%>

<div class="login-wrapper">
	<h2>Login</h2>
	<form method="post" action="doLogin" id="login-form">
		<input type="text" name="loginId" placeholder="ID">
		<input type="password" name="loginPw" placeholder="Password">
		<input type="submit" value="Login">
	</form>
	<div class="form-btn">
		<a href="join">회원가입</a>
		|
		<a href="findLoginId">계정찾기</a>
		|
		<a href="findLoginPw">비밀번호찾기</a>
	</div>
</div>

<%@ include file="../common/foot.jsp"%>