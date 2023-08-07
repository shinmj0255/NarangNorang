<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="여행기" />
<%@ include file="../common/head.jsp"%>

<div class="table-box-type-1">
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성일</th>
				<th>제목</th>
				<th>작성자</th>
				<th>여행시작일</th>
				<th>추천</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="TravlePlan" items="${travlePlans }">
				<tr class="hover">
					<td>${travlePlan.id }</td>
					<td>${travlePlan.regDate.substring(2, 16) }</td>
					<td>${travlePlan.title }</a></td>
					<td>${travlePlan.writerName }</td>
					<td>${travlePlan.startDate }</td>
					<td>${travlePlan.sumReactionPoint }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%@ include file="../common/foot.jsp"%>