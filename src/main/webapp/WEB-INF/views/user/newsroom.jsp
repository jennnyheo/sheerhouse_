<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/help.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<title>뉴스룸</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/user/Header.jsp"%>
	<div id="sub_menu">
		<ul>
		<li><a href="termaccept.do">이용약관</a>
		<li><a href="newsroom.do">뉴스룸</a>
		</ul>
	</div>
	<div>
		<h2>공지사항</h2>
		<article>
<div id="outter">
	<table>
		<tr class="tableHeader">
			<td>No.</td>
			<td width="50%">제목</td>
			<td>등록일</td>	
		</tr>
		<c:forEach items="${Notice}" var="notice">
			<tr>
				<td>${notice.notice_num }</td>
				<td><a href="${path}/newsDetail.do?notice_num=${notice.notice_num}">${notice.title }</td>
				<td><fmt:formatDate value="${notice.regist_date }" pattern="yyyy.MM.dd"/> </td>
			</tr>
		</c:forEach>
	</table>
			<div style="display: block; text-align: center;">
				<c:if test="${paging.startPage != 1 }">
					<a
						href="/newsroom.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p}</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a
								href="/newsroom.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p}</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a
						href="/newsroom.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>
		</div>
	</div>
	</article>
</body>
</html>