<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="아이디찾기" />
<%@ include file="../common/head.jsp"%>

<div class="login-wrapper">
	<h2>아이디찾기</h2>
	<form method="post" action="dofindLoginId" id="login-form">
		<input type="text" name="name" placeholder="이름을 입력해주세요">
		<input type="text" name="email" placeholder="이메일을 입력해주세요">
		<button class="find">아이디찾기</button>
	</form>
	<div>
		<button onclick="history.back();">뒤로가기</button>
	</div>
</div>

<%@ include file="../common/foot.jsp"%>