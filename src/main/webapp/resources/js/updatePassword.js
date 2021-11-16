var usercode = "";
var x ="";
$("#searchEmail").on("change keyup paste", function(){
	var useremail = document.getElementById("searchEmail").value;
	var emailexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(useremail.match(emailexp) == null){
		document.getElementById("searchEmailMsg").innerHTML="이메일의 형식과 맞지 않습니다.";	
		clearInterval(x);
		document.getElementById("searchEmailtext").innerHTML ="";
	}else{
		document.getElementById("searchEmailMsg").innerHTML="";
	}
})

function searchEmail(){
	clearInterval(x);
	var useremail = document.getElementById("searchEmail").value;
	var emailexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(useremail.match(emailexp) == null){
	}else{
		var check = true;
		
		$.ajax({
			url: "/searchEmail.do",
			type: "GET",
			async: false,
			data: {email:useremail},
			success: function(result){
				check = result;
			}
			
		});
		if(check === "false"){
			document.getElementById("searchEmailMsg").innerHTML="존재하지 않는 이메일입니다.";				
		}else{
			document.getElementById("searchEmailMsg").innerHTML="인증번호를 전송하였습니다.";	
			
			var password = document.getElementById("searchPassword");
			password.setAttribute("type", "hidden");
			var passwordcheck = document.getElementById("searchPasswordCheck");
			passwordcheck.setAttribute("type","hidden");
			var emailcheck = document.getElementById("searchEmailCheck");
			emailcheck.setAttribute("type","text");
			emailcheck.setAttribute("value", "");
			usercode = "";
			for(var i = 0; i < 6 ; i++){
				
				usercode += Math.floor(Math.random() * 10);
			}

			$.ajax({
				url: 'sendEmail.do',
				type: 'POST',
				data: {
					email: useremail,
					code: usercode
					}
			});

			clearInterval(x);
			var time = 300;
			var min = "";
			var sec = "";
			x = setInterval(function(){
				min = parseInt(time/60);
				sec = time%60;

				document.getElementById("searchEmailText").innerHTML = "인증하기  " + min +":"+sec;
				time--;
				if(time < 0){
					clearInterval(x);
					document.getElementById("searchEmailMsg").innerHTML ="인증시간이 초과되었습니다. 다시 시도해주세요";
					document.getElementById("searchEmailText").innerHTML ="";
					emailcheck.setAttribute("type","hidden");
					emailcheck.setAttribute("value","");
				}
			}, 1000);
		}
	}
}
function searchEmailCheck(){
	
	var codeCheck = document.getElementById("searchEmailCheck").value;
	var emailcheck = document.getElementById("searchEmailCheck");
	
	if(usercode == codeCheck){
		document.getElementById("searchEmailMsg").innerHTML ="이메일 인증이 성공적으로 완료되었습니다.";
		clearInterval(x);
		document.getElementById("searchEmailText").innerHTML ="";
		emailcheck.setAttribute("type","hidden");
		var password = document.getElementById("searchPassword");
		password.setAttribute("type", "password");
		var passwordcheck = document.getElementById("searchPasswordCheck");
		passwordcheck.setAttribute("type","password");
	}else{
		clearInterval(x);
		document.getElementById("searchEmailText").innerHTML ="";
		var emailcheck = document.getElementById("searchEmailCheck");
		emailcheck.setAttribute("type","hidden");
		emailcheck.setAttribute("value","");
		document.getElementById("searchEmailMsg").innerHTML ="이메일 인증이 실패하였습니다. 다시 시도해주세요.";
		
	}

}

function passwordUpdate(){
	var joinForm = document.joinForm;
	var userEmail = document.getElementById("searchEmail").value;
	var userPassword = document.getElementById("searchPassword").value;
	var userPasswordCheck = document.getElementById("searchPasswordCheck").value;
	var emailexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var passexp = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
	if(userEmail.match(emailexp) == null){
	}else if(userPassword == "") {
		document.getElementById("searchPasswordMsg").innerHTML="비밀번호는 필수사항입니다.";
	}else if(!isPassword(userPassword)){
		document.getElementById("searchPasswordMsg").innerHTML="비밀번호는 하나 이상의 문자,숫자,특수문자를 포함해야하며 8~16자 이내여야 합니다.";
	}else if(userPassword != userPasswordCheck){
		document.getElementById("searchPasswordMsg").innerHTML="비밀번호가 맞지 않습니다.";
		var password = document.getElementById("searchPassword");
		password.setAttribute("value", "");
		var passwordcheck = document.getElementById("searchPasswordCheck");
		passwordcheck.setAttribute("value","");
	}else{
		document.getElementById("searchPasswordMsg").innerHTML="";
		document.getElementById("searchEmailMsg").innerHTML="";
		
		joinForm.submit();
	}
}

function isPassword(asValue) {
	var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

	return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}