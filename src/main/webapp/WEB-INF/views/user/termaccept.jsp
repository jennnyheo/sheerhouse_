<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
         <link rel="stylesheet" href="/resources/css/help.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉬어가 이용약관</title>

</head>
<body>
	<%@ include file="/WEB-INF/views/user/Header.jsp"%>
	<section>
	<div id="sub_menu">
		<ul>
		<li><a href="termaccept.do">이용약관</a>
		<li><a href="newsroom.do">뉴스룸</a>
		</ul>
	</div>
	<article>
      <div id="outter">
        <h1 class="termHeader">이용약관</h1>        
        <h2 class="termContentHeader">일반약관</h2>
        <c:forEach items="${basic}" var="basic">
			<div><h3>${basic.sub_title }</h3></div>
			<div>
				<span>${basic.content } </span>
			</div>
			<br>
		</c:forEach>
			<br>
			<h2 class="termContentHeader">고객약관</h2>
		<c:forEach items="${guest}" var="guest">
			<div><h3>${guest.sub_title }</h3></div>
			<div>
				<span>${guest.content }</span>
			</div>
			<br>
		</c:forEach>
		<br>
		<h2 class="termContentHeader">호스트약관</h2>
		<c:forEach items="${host}" var="host">
			<div><h3>${host.sub_title }</h3></div>
			<div>
				<span>${host.content }</span>
			</div>
			<br>
		</c:forEach>
		</div>
	</article>
	<div class="clear"></div>
</body>
</html>