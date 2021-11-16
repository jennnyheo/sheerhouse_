var usercode = "";
var x ="";
$("#email").on("change keyup paste", function(){
	var useremail = document.getElementById("email").value;
	var emailexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(useremail.match(emailexp) == null){
		document.getElementById("emailMsg").innerHTML="이메일의 형식과 맞지 않습니다.";	
		clearInterval(x);
		document.getElementById("emailtext").innerHTML ="";
		emailcheck.setAttribute("type","hidden");
		emailcheck.setAttribute("value","");
	}else{
		document.getElementById("emailSend").innerHTML="인증번호 전송";
		document.getElementById("emailMsg").innerHTML="";	
	}
})

	function emailsend(){
		var useremail = document.getElementById("email").value;
		
		var emailexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(useremail.match(emailexp) == null){
		}else{
			var check = false;
			$.ajax({
				url: "/searchEmail.do",
				type: "GET",
				async: false,
				data: {email:useremail},
				success: function(result){
					check = result;

				}
				
			});
			if(check === "true"){
				document.getElementById("emailMsg").innerHTML="이미 존재하는 이메일 입니다.";
				document.getElementById("emailSend").innerHTML="";
			}else{
				document.getElementById("emailTextMsg").innerHTML = "";
				
				document.getElementById("emailMsg").innerHTML="인증번호를 전송하였습니다.";	
				var password = document.getElementById("password");
				password.setAttribute("type", "hidden");
				var passwordcheck = document.getElementById("passwordcheck");
				passwordcheck.setAttribute("type","hidden");
				var emailcheck = document.getElementById("emailcheck");
				emailcheck.setAttribute("type","text");
				emailcheck.setAttribute("value", "");
				usercode = "";
				for(var i = 0; i < 6 ; i++){
			
					usercode += Math.floor(Math.random() * 10);
				}//for end

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

					document.getElementById("emailtext").innerHTML = "인증하기  " + min +":"+sec;
					time--;
					if(time < 0){
						clearInterval(x);
						document.getElementById("emailTextMsg").innerHTML = "인증시간이 초과되었습니다. 다시 시도해주세요";
						document.getElementById("emailMsg").innerHTML="";
						document.getElementById("emailtext").innerHTML ="";
						emailcheck.setAttribute("type","hidden");
						emailcheck.setAttribute("value","");
					}//if end
				}, 1000);//x end
			}// else else end
		}//else end
}//function end
function emailCheck(){
	
	var codeCheck = document.getElementById("emailcheck").value;
	var e_check = document.getElementById("e_check");
	if(usercode == codeCheck){
		document.getElementById("emailMsg").innerHTML="이메일 인증이 성공적으로 완료되었습니다.";
		e_check.setAttribute("value", "check");
		document.getElementById("emailSend").innerHTML="";
		clearInterval(x);
		document.getElementById("emailtext").innerHTML ="";
		emailcheck.setAttribute("type","hidden");
		var password = document.getElementById("password");
		password.setAttribute("type", "password");
		var passwordcheck = document.getElementById("passwordcheck");
		passwordcheck.setAttribute("type","password");
	}else{
		document.getElementById("emailMsg").innerHTML="이메일 인증에 실패하였습니다. 다시 시도해주세요";
		e_check.setAttribute("value", "");
		clearInterval(x);
		document.getElementById("emailtext").innerHTML ="";
		emailcheck.setAttribute("type","hidden");
		emailcheck.setAttribute("value","");
		var password = document.getElementById("password");
		password.setAttribute("type", "password");
	}

}

/* agree btn */
const removeAgreeBtn = document.querySelector(".removeAgree");
const agreeCheck = document.querySelector(".agreeCheck");

function removeAgree(){
	console.log("hihi");
	document.querySelector(".agree").style.display = "none";
}




function agreeBtn(){
	const showAgreeForm = document.querySelector(".agree");
	showAgreeForm.style.display = "block";
	console.log("clicked");
}

function emailLogin(){
	var emailexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var passexp = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
	var loginForm = document.loginForm;
	var userEmail = loginForm.email.value;
	var userPassword = loginForm.password.value;
	var userPasswordCheck = loginForm.passwordcheck.value;
	var userPasswordCheckType = loginForm.passwordcheck.type;
	
	var agreeCheck = document.querySelector(".agreeCheck")
	
	var check = true;
	
	if(userEmail.match(emailexp) == null){
	}else if(userPassword == "") {
		document.getElementById("passwordMsg").innerHTML="비밀번호는 필수사항입니다.";
	}else if(!isPassword(userPassword)){
		document.getElementById("passwordMsg").innerHTML="비밀번호는 하나 이상의 문자,숫자,특수문자를 포함해야하며 8~16자 이내여야 합니다.";
	}else if(userPasswordCheckType == "hidden"){
		function eventKeyup(userPassword){
			$("#passwordCheck").val(userPassword);
		}
		document.querySelector(".agreeCheck").style.display = "block";
		loginForm.submit();
/*		if(agreeCheck.checked){
				console.log("checked");
				document.querySelector(".agree").style.display = "none";
				document.getElementById("passwordMsg").innerHTML="";
				document.getElementById("emailMsg").innerHTML="";
				
				loginForm.submit();
		}*/
	}else if(userPassword != userPasswordCheck){
		document.getElementById("passwordMsg").innerHTML="비밀번호가 맞지 않습니다.";
		var password = document.getElementById("password");
		password.setAttribute("value", "");
		var passwordcheck = document.getElementById("passwordcheck");
		passwordcheck.setAttribute("value","");
	
	}else{
				document.getElementById("passwordMsg").innerHTML="";
				document.getElementById("emailMsg").innerHTML="";
				
				loginForm.submit();
/*		document.querySelector(".agreeCheck").style.display = "block";
			if(agreeCheck.checked){
				console.log("checked");
				document.querySelector(".agree").style.display = "none";
				document.getElementById("passwordMsg").innerHTML="";
				document.getElementById("emailMsg").innerHTML="";
				
				loginForm.submit();
		}*/
	}
	
}	
function isPassword(asValue) {
	var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

	return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}


