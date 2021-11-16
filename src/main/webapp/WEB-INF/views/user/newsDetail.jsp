<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/help.css" />
<title>뉴스룸 정보입니다.</title>
</head>
<body>
<%@ include file="/WEB-INF/views/user/Header.jsp"%>
<h1>${newInfo.title }</h1>
<hr>
 	<div id="sub_menu">
		<ul>
		<li><a href="termaccept.do">이용약관</a>
		<li><a href="newsroom.do">뉴스룸</a>
		<li><a href="companyDetail.do">회사 정보</a>
		<li><a href="help.do">도움말</a>
		</ul>
	</div>
	<div class="newInfoDetailContainer">
		<div>
			<ul>
				<li>글번호 :  ${newsInfo.notice_num }</li>
				<li>제목 : ${newsInfo.title } </li>
				
				<li>작성일 : ${newsInfo.regist_date } </li>
			</ul>
			<div class="newInfoDetailContent">
				<span>본문</span>
				
				<p>${newsInfo.content }</p>
			</div>
		</div>
		<button onclick='location.href="newsroom.do"'>목록으로</button>
	</div>
</body>
</html>