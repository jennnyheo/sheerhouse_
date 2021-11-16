<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/resources/css/error-page.css" />
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지입니다.</title>
</head>
<body onload="window_go_index();">
<%@ include file="/WEB-INF/views/search/Header.jsp"%>
			    <div id="error-page">
         <div class="content">
            <h2 class="header">
               페이지에 에러가 발생했습니다.
            </h2>
            <p>
               입력하신 주소가 맞지않거나 존재하지 않는 주소입니다.
            </p>
            <p>
            	10초 뒤에 자동으로 메인페이지로 이동합니다.
            </p>
            <div class="btns">
               <a href="/index.do">메인페이지</a>
               <a href="javascript:history.back();">이전 페이지</a>
            </div>
         </div>
      </div>
   </body>
  <script>
			<script>
      function window_go_index(){
         setTimeout('go_index()',5000) 
      }

      function go_index(){
         location.href="/index.do"
      }

  </script>
  <%@ include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>