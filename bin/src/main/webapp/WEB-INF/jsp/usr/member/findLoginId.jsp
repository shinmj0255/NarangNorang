<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="아이디찾기" />
<%@ include file="../common/head.jsp"%>

<div class="login-wrapper">
	<h2>아이디찾기</h2>
	<form method="post" action="doFindLoginId" id="findlogin-form">
		<input type="text" name="loginId" placeholder="아이디를 입력해주세요">
		<input type="text" name="email" placeholder="이메일을 입력해주세요">
		<button>아이디찾기</button>
	</form>
	<div class="join-form-btn">
		<a href="/usr/member/join">회원가입</a>
	</div>
</div>

<%@ include file="../common/foot.jsp"%>