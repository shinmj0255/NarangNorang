<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리 -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@3.1.7/dist/full.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link rel="stylesheet" href="/resource/common.css" />
<script src="/resource/common.js" defer="defer"></script>
<title>${pageTitle }</title>
</head>
<body>
	<div class="head-menu-bar">
		<a class="px-3 ml-10 flex items-center" href="/">나랑노랑</a>
		<div class="flex-grow"></div>
		<ul class="flex mr-10">
			<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/">홈</a></li>
			<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/plan/list?boardId=1">여행기</a></li>
			<c:if test="${rq.getLoginedMemberId() == 0}">
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/login">로그인</a></li>
			</c:if>
			<c:if test="${rq.getLoginedMemberId() != 0}">
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/plan/plan">여행만들기</a></li>
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/myPage">마이페이지</a></li>
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/doLogout">로그아웃</a></li>
			</c:if>
		</ul>
	</div>