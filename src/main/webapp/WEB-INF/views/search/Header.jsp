<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchPage Header</title>
		<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="/resources/css/header.css" />
  		<meta name="google-signin-scope" content="profile email">
   		<meta name="google-signin-client_id" content="704009539267-6g73vgvh8j2u16gfps9r01t0srqldprf.apps.googleusercontent.com">
    	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

		<script type="text/javascript" src="/resources/js/emailLogin.js"></script>
    	<script type="text/javascript" src="/resources/js/updatePassword.js"></script>

</head>
<body>
      <div class="navContainer">
	        <div class="logoContainer">
	          <a href="/index.do">
	           	<img src="https://sheerhouse2.s3.ap-northeast-2.amazonaws.com/Setting/Logo/logo%20ver1.png" alt="logo" />
	           </a>
	        </div>
	        <form class="searchContainer" action="searchResult.do" method="get">
	        <div>
	          <div class="searchbar-small">
	            <button class="locationBtn" type="button">
	              <div>
	          			<span>위치</span>
	               		 <input class="searchLocation" name="searchLocation" type="text" placeholder="${search.location}" />
	              </div>
	            </button>
	
	            <button class="dateBtn" type="button">
		              <div>
		              	<span>가는 날짜</span>
		              		<input name="searchCheckin" class="CheckinDate" id="CheckinDate" type="date" aria-required="true"  value="${search.checkin}"/>        	
		              </div>
	            </button>
	            <button class="dateBtn" type="button">
		              <div>
		              	<span>오는 날짜</span>
		              		<input name="searchCheckout" class="CheckoutDate" id="CheckoutDate" type="date" aria-required="true"  value="${search.checkout}"/>
              	
		              </div>
	            </button>
	
	            <button class="peopleBtn" type="button">
		              <div>
		              	<span>인원</span>
		              	 <input name="searchMaxPeo" class="peopleNumInfo" onclick=search() type="button" value="${search.people }" />	
                <div class="peopleBtnContainer">
	                <div>
	                  <span class="peopleBtnHeader"> 성인 </span>
	                  <input
	                  class="addBtns"
	                  type="button"
	                  onclick="peopleIncre()"
	                  value="+"
	                />
	                  <input
	                  type="text"
	                  value="0"
	                  name="searchMaxPeople"
	                  class="peopleBtnNumInput"
	                />
	                  <input
	                  class="addBtns"
	                  type="button"
	                  onclick="peopleDecre()"
	                  value="-"
	                />
	                </div>
              </div>
	            </button>
	         <div class="search">
            <button type="submit">
              <img src="/resources/Images/icons/search-white.png" alt="search" />
            </button>
           </div>
	        </div>
	        </div>
	        </form>
        <nav class="menuContainer">
          <ul class="menus">
	            <c:if test="${user.email == null}">
	              <li class="loginBtn" onclick="loginnbtnClicked()">로그인 / 회원가입</li>
	            </c:if>
	            
            <c:if test="${user.email != null}">
             	<c:if test="${user.name != null}">
             		<%--  <li><c:out value=" ${user.name}" />님 반갑습니다.</li> --%>
              		 <li><a href="logout.do">로그아웃</a></li>
              	</c:if>
              
              <c:if test="${user.name == null}">
              		<li><c:out value=" ${user.email}" />님 반갑습니다.</li>
              		<li><a href="logout.do">로그아웃</a></li>
              </c:if>
              
              <li><a href="mypage.do">마이페이지</a></li>
              <li><a href="hostPage.host">호스트 등록하기</a></li>
            
            </c:if>
          
          </ul>
        </nav>
      </div>
      
      
      <div class="join-modal">
				<div class="join-modalContent">
					<div onclick="joinExitbtnClicked()" class="join-exitBtn"><img src="/resources/Images/icons/close.png" alt="cancel" /></div>
					<h3 class="joinHeader">비밀번호 변경</h3>
					<div class="divider"></div>
					<form class="joinForm" action="passwordUpdate.do" method="post" name="joinForm">
							<input type="text" name="email" id="searchEmail" placeholder="이메일을 입력해주세요" />
							<span id="searchEmailMsg" class="spanMsg"></span>
							<span onClick="searchEmail();" class="movoToJoin">인증번호 받기</span>
							<input type="hidden" name="emailcheck" id="searchEmailCheck"  placeholder="인증번호를 입력해주세요" />

							<span id="searchEmailTextMsg" class="spanMsg"></span>
            				<span class="movoToJoin" id="searchEmailText" onClick="searchEmailCheck();"></span>
							<input type="hidden" name="password" id="searchPassword" placeholder="변경할 비밀번호를 입력해주세요" />
							<input type="hidden" name="passwordcheck" id="searchPasswordCheck" placeholder="변경할 비밀번호를 다시 입력해주세요" />
							<span id="searchPasswordMsg" class="spanMsg"></span>
							<input class="joinSubmit" type="button" onClick="passwordUpdate();" value="비밀번호 변경하기"/>

					</form>
				</div>
			</div>
      </div>
      	
	<div class="login-modal" >
      	<div class="login-modalContent">
		        <div class="login-exitBtn" onclick="loginExitbtnClicked()">
		        	<img src="/resources/Images/icons/close.png" alt="cancel" />
		        </div>
		        <h3 class="loginHeader">로그인</h3>
		        
		        
		        <div class="divider"></div>
		        <form class="loginForm" action="userLoginHeader.do" name="loginForm" method="post">
		            <input type="text" name="email" id="email" placeholder="이메일을 입력해주세요" />
		            <span onclick="emailsend();" class="authMsg">인증번호 받기</span>
		            <input type="hidden" name="emailcheck" id="emailcheck" class="emailcheck" placeholder="인증번호를 입력해주세요" />
		            <span class="movoToJoin" id="emailtext" onClick="emailCheck();"></span>
		            <input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요" />
		            <input type="hidden" name="passwordcheck" id="passwordcheck" placeholder="비밀번호를 다시 입력해주세요" />
		            <input class="loginSubmit" type="button" onClick="emailLogin();" value="로그인 하기"/>
		            <span onclick="moveTojoinPage()" class="movoToJoin">비밀번호 찾기</span>
		        </form>
		          <div class="divider bottom-margin"></div>
		          
		          <div class="alterLoginContainer">
		          
				          	<div class="login facebookLogin" onclick="fnFbCustomLogin();" >
				             	 <a href="javascript:void(0)" >
				               		 <div class="loginAltercontent">
				                    	<div class="alterJoinIcon">
				                    		<img src="/resources/Images/icons/facebook.png" alt="facebook login"/>
				                    	</div>
				                   		 <span>페이스북으로 로그인하기</span>
				                	</div>
				            	  </a>
				          	</div>
				          	
				          	<div class="login googleLogin" id="googleClick">
					           <a href="#" >
					               <div class="g-signin2 googleSource"  data-onsuccess="onSignIn"></div>
<!-- 					               <div class="goodleLogin"  data-onsuccess="onSignIn">
					               		<img src="/resources/Images/icons/google.png" alt="facebook login"/>
					               </div> -->
					               <span>구글로 로그인하기</span>
					            </a>
				          	</div>
				
				 
					         <div class="login kakaoLogin" onclick="kakaoLogin();">
					            <a href="javascript:void(0)">
						              <div class="altercontent">
						            		 <div class="alterLoginIcon">
						              				<img src="/resources/Images/icons/kakao-talk.png"  alt="kakaotalk login"/>
						              		 </div>
						             			 	<span>카카오톡으로 로그인하기</span>
						              </div>
					          	</a>
					        </div>
		         </div>
    	</div>
    </div>
      </div> <!-- 시작 태그 missing  -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
 <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>



<script>

/*const joinnbtn = document.querySelector(".joinBtn");*/
const loginbtn = document.querySelector(".loginBtn");
const joinExitBtn = document.querySelector(".join-exitBtn");
const joinModal = document.querySelector(".join-modal");
const loginExitBtn = document.querySelector(".login-exitBtn");
const loginModal = document.querySelector(".login-modal");
const checkInDate = document.querySelector(".CheckinDate");
const checkOutDate = document.querySelector(".CheckoutDate");
const movoToJoin = document.querySelector(".movoToJoin");


// joinModal

function joginBtnClicked() {
  joinModal.style.display = "block";
}

function joinExitbtnClicked() {
  joinModal.style.display = "none";
}

function joinoutsideClick(e) {
  if (e.target == joinModal) {
    joinModal.style.display = "none";
  }
}

// login modal

function loginnbtnClicked() {
  loginModal.style.display = "block";
}

function loginExitbtnClicked() {
  loginModal.style.display = "none";
}

function loginoutsideClick(e) {
  if (e.target == loginModal) {
    loginModal.style.display = "none";
  }
}

//move to Join

function moveTojoinPage() {
  loginModal.style.display = "none";
  joinModal.style.display = "block";
}

//기존 로그인 상태를 가져오기 위해 Facebook에 대한 호출
function statusChangeCallback(res){
	statusChangeCallback(response);
}

function fnFbCustomLogin(){
	FB.login(function(response) {
		if (response.status === 'connected') {
			FB.api('/me', 'post', {fields: 'name,email'}, function(r) {
				var useremail = r.email;
				var username = r.name;
				$.ajax({
					url: 'facebookUserInfo.do',
					type: 'POST',
					async: false,
					data : {
						email: useremail,
						name: username
					},
					success: function(result){
						location.href="index.do";
					}
				});
			});
			
		}else{
			colsole.log("페이스북 로그인 실패");
		} 
	}, {scope: 'public_profile,email'});
}

window.fbAsyncInit = function() {
	FB.init({
		appId      : '1300945983708086', // 내 앱 ID를 입력한다.
		cookie     : true,
		xfbml      : true,
		version    : 'v10.0'
	});
	FB.AppEvents.logPageView();   
};
</script>
<script>
      function onSignIn(googleUser) {
    	 
    	var profile = googleUser.getBasicProfile();
        var username = profile.getName();
        var useremail = profile.getEmail();

        $("#googleClick").click(function(){
  		  $.ajax({
  			  url: 'googleUserInfo.do',
  			  type: 'POST',
			  async: false,
  			  data:{ email: useremail,
					name: username
				},
				success: function(result){
					location.href="index.do";
				}
  			});


  	  });
    }
    </script> 
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('f6cac299feab96616592fa86fe86f09e'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
			var useremail = response.kakao_account.email;
			var username = response.properties.nickname;

			$.ajax({
				url: 'kakaoUserInfo.do',
				type: 'POST',
				data : {
					email: useremail,
					name: username
				},
				success: function(result){
					location.href="index.do";
				},
				beforeSend:function(){
			        $('.wrap-loading').removeClass('display-none');
			    }
			    ,complete:function(){
			        $('.wrap-loading').addClass('display-none');
			    }

			});
          },
          fail: function (error) {
          },
        })
      },
      fail: function (error) {
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
</body>
</html>