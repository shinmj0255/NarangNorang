<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="마이페이지" />
<%@ include file="../common/head.jsp"%>

<div class="container mx-auto">
	<section class="box">
		<div class="sidebar">
			<button>내 정보</button>
			<a href="passwordChk">회원정보수정</a>
		</div>
		<div class="box-contents">
			<tr>
				<th>가입일</th>
				<td>${rq.loginedMember.regDate }</td>
			</tr>
			<tr>
				<th>로그인 아이디</th>
				<td>${rq.loginedMember.loginId }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${rq.loginedMember.name }</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${rq.loginedMember.nickname }</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${rq.loginedMember.cellphoneNum }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${rq.loginedMember.email }</td>
			</tr>
		</div>
	</section>
</div>

<%@ include file="../common/foot.jsp"%>