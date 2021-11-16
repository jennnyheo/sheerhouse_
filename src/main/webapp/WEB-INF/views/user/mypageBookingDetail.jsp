<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>얘약정보 입니다.</title>
<link rel="stylesheet" href="/resources/css/UserMypage/mypageShowDetail.css" />
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
	<nav>
		<div>
			<a href="index.do"><img src="https://sheerhouse2.s3.ap-northeast-2.amazonaws.com/Setting/Logo/logo%20ver1.png"  alt="banner"/></a>
		</div>
		<div>
			<ul class="menus">
	            <c:if test="${user.email == null}">
	              <li class="loginBtn" onclick="loginnbtnClicked()">로그인 / 회원가입</li>
	            </c:if>
	            
            	<c:if test="${user.email != null}">
              		<li><c:out value=" ${user.name}" />님 반갑습니다.</li>
              		<li><a href="logout.do">로그아웃</a></li>
              		<li><a href="mypage.do">마이페이지</a></li>
              </c:if>

          </ul>
		</div>
	</nav>

	<div class="reservationDetailInfoContainer">
			 						<input class="imgUrls" type="hidden" value="${bookingDetail.url }" />
			 						<div class="slideshow-container">
											
									  <!-- Full-width images with number and caption text -->
									  <ul class="slideImagesContainer">
									  </ul>
									
									  <!-- Next and previous buttons -->
									  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
									  <a class="next" onclick="plusSlides(1)">&#10095;</a>
									</div>
									
									
									<div class="reservationInfoDetail">
										<div class="header">
											<h2>
												${bookingDetail.email }님의 예약정보입니다.
											</h2>
										</div>
											<h2 class="title">${bookingDetail.title}</h2>
						                	<div>
						                		<p>총 결제 금액 : ${bookingDetail.total_price}</p>
						                	</div>
						                	<div>
						                		<p>예약 일정 ${bookingDetail.res_date}</p>
						                	</div>
						                	<div>
						                			<p>숙소 정보: ${bookingDetail.info}</p>
						                			<p>예약 인원: ${bookingDetail.headcount}</p>
						                			<p>호스트 : ${bookingDetail.host_info}</p>
						                			<p class="addressInfo">주소 : ${bookingDetail.address}</p>
						                	</div>
						                	<div class="divider"></div>
						                	<div>
						                		<span>숙소의 규칙을 확인해주세요</span>
						                		<p>${bookingDetail.rule}</p>
						                	</div>
						                	<div class="divider"></div>
						                	<div class=sendEmailContainer id="emailForm">
						                		<h2 class="title">호스트에게 연락하기</h2>
						                		<input class="userEmail" name="from_name" type="hidden" value="${bookingDetail.email }" />
						                		<input class="hostEmail" name="to_name" type="hidden" value="${hostEmail}"/>
						                		<textarea class="emailMsg" name="message"></textarea>	
						                		<button id="sendBtn" class="sendBtn">전송</button>		
						                	</div>
						               </div>
									<br>
									
             </div>
</body>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript">
  emailjs.init('user_8L5c4LFE9HWH4sCJlabRv')
</script>
<script> 
	const hostEmail = document.querySelector(".hostEmail");
	const userEmail = document.querySelector(".userEmail");
	const emailMsg = document.querySelector(".emailMsg");
  const urls = document.querySelector(".imgUrls");
  /* 	console.log(urls.value); */
  	var url = urls.value;
  	var imgs = url.slice(1,-1);
  	var img = imgs.split(",");
  /* 	console.log(img); */

  	
  /* 	for(var j=0; j<urls.length; j++){
  		var url = urls[j].value;
  		console.log(url);
  		var imgs = url.slice(1,-1);
  		var img = imgs.split(", ");
  		console.log(img[j]);
  		imgArr.push(img[j]);		
  	} */
  	
  	var imgContent = "";
	for(var i=0; i<img.length; i++){
		console.log(img[i]);
		imgContent += '<li class="mySlides fade" ><img src="'+ img[i]+'" alt="bookingphoto" /></li>'; 
	}
	
	$(".slideImagesContainer").append(imgContent);
  
  
  
  var slideIndex = 1;
  showSlides(slideIndex);

  // Next/previous controls
  function plusSlides(n) {
    showSlides(slideIndex += n);
  }

  // Thumbnail image controls
  function currentSlide(n) {
    showSlides(slideIndex = n);
  }

  function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");

    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[slideIndex-1].style.display = "block";

  }
  $(document).on("click", ".sendBtn", function(){
	  console.log(emailMsg.value);
	     emailjs.send("service_0935jim","template_crq0xtz",{
	    	   from_name: userEmail.value,
	    	   message: emailMsg.value,
	    	   host_email: hostEmail.value,
	    	   }).then(function(response){
	    		   console.log('SUCCESS!', response.status, response.text);
	    		   alert('Sent!');
	    	   }, function(error){
	    	 console.log('FAILED...', error);
	    	 alert(JSON.stringify(err));
	     });
  	});


/*   const btn = document.getElementById('sendBtn');

  document.getElementById('emailForm')
   .addEventListener('submit', function(event) {
     event.preventDefault();

     btn.value = 'Sending...';

     const serviceID = 'service_6ozvn88';
     const templateID = 'template_crq0xtz';

     emailjs.send("service_0935jim","template_crq0xtz",{
  	   from_name: userEmail.value,
  	   message: emailMsg.value,
  	   host_email: hostEmail.value,
  	   });
  }); */
  
   

   

		 

  
  </script>
</html>