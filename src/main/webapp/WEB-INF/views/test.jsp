<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="test.do" method="post">
전화번호 : 
<input type="tel" name="tel" id="tel"><br>
<span id="telSpan" style="color: red;"></span>
<input type="button" value="인증번호 전송" onclick="testSms()"/><br>
<input type="text" name="number" id="number"><br>
<input type="hidden" name="confirmNumber" id="confirmNumber"/> 
<input type="submit" value="인증하기">
</form>

  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<script type="text/javascript">
	function testSms(){
		
		var tel = document.getElementById("tel").value;
		var regexp = /^[0-9]*$/
		var confirmNumber = document.getElementById("confirmNumber");
		if(tel.match(regexp) == null || tel==""){
			document.getElementById("telSpan").innerHTML="번호는 숫자만 입력 가능합니다.";
			return;
		}
		
		$.ajax({
			url: 'test.do',
			type: 'POST',
			data: {"tel": tel },
			success: function(result){
				console.log(result);
				confirmNumber.setAttribute("value", result);
				document.getElementById("telSpan").innerHTML="";
				console.log(confirmNumber);
			}
		});

	}
	
</script>

</body>
</html>