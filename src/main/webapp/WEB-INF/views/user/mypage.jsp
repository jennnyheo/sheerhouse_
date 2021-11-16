<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<script type="text/javascript" src="/resources/js/mypage.js"></script>
<link rel="stylesheet" href="/resources/css/mypageStyle.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/css/splide.min.css">
</head>
<body>

 <div class="mypageContainer">
 <%@ include file="/WEB-INF/views/user/Header.jsp"%>
<!--       <div class="navContainer">
        <div class="logoContainer">
          <a href="/"
            ><h2>쉬어家</h2>
            <span>sheerhouse</span></a
          >
        </div>
      </div> -->
      <div class="mypageHeader">
        <h2>마이페이지</h2>
      </div>
      <div class="mypageGreeting">
        <h3>안녕하세요 ${user.name}님</h3>
        <p></p>
      </div>
       <div class="divider-greeting"></div>
      <div class="mypageSelect">
        <ul class="mypagelists">
          <li onclick="showMore(this)" class="tabs" id="myBooking" data-mypage-type="bookingDetail">
            나의 예약
          </li>
          <li onclick="showMore(this)" class="tabs" id="myWishList" data-mypage-type="wishListDetail">
            나의 위시리스트
          </li>
          <li onclick="showMore(this)" class="tabs" id="myHistory" data-mypage-type="historyDetail">
            나의 히스토리
          </li>
          <li onclick="showMore(this)" class="tabs" id="myInfo" data-mypage-type="infoDetail">
            개인정보
          </li>
          <li onclick="showMore(this)" class="tabs" id="myPayment" data-mypage-type="paymentDetail">
            결제정보
          </li>
        </ul>
      </div>
      <div class="detailContainer">
        <section id="bookingDetail" class="bookingDetail tabContent" data-mypage-type="booking">
        <h3>예약된 내용입니다.</h3>
            <ol class="bookingLists">
		            <c:forEach var="reservationlist" items="${reservationlist}">	
		            	<c:set var="today" value="<%=new java.util.Date()%>"/>
		           		<fmt:parseDate var="starDate" value="${fn:split(reservationlist.res_date, ',')[0]}" pattern="yyyy-MM-dd"/>
		            	<c:if test="${starDate > today }">
		
				              <li class="bookingList">
				                <div>	
					                    <div class="accomodationImage">
					                  	<input  class="imageUrl" type="hidden" value="${reservationlist.url}" />
					                    </div>
					                    <div class="accomodationTexts">
					                            <div class="accomodationContent">
					                      		<a href="searchResultDetail.do?home_seq=${reservationlist.home_seq}&title=${reservationlist.title}" target="_blank">
					                            	<h2>${reservationlist.title}</h2>
					                        	</a>
					                            	<span> 결제 금액 : ${reservationlist.total_price}</span>
					                            	<div class="reservationDateInfo">
					                            		<span>기간 : </span>
					                            		<input type="text" class="reservationDates" value="${reservationlist.res_date}" readonly/>	
					                            	</div>
					                            	
					                            	<span> 예약 인원 : ${reservationlist.headcount}</span>
					                            		
					                            </div>
					                             <div class="bookingInfo">
					                         		 <!-- button onclick="bookingInfo('{booking.seq}')">예약상세</button> -->
					                         		 <input  class="fullImageUrl" type="hidden" value="${reservationlist.url}" />
					                      			<a href="mypageBookingInfo.do?home_seq=${reservationlist.home_seq}&apply_num=${reservationlist.apply_num}" target="_blank">
					                         		  		<button class="bookingInfoBtn">예약상세</button>
					                         		 </a>
					                      		 </div>
					                      </div>
					                      <div>
					                      	<input class="reservationState" type="button" value="${reservationlist.pay_status }" /> 
					                      	<input type="hidden" class="reservationCancel" type="button" value="${reservationlist.cancel_reason }" /> 
					                      </div>                    
					                </div>
				                </li>
		                </c:if>
		             </c:forEach>
            </ol>           
        </section>
        

        <!-- wishlist section -->
       
		        <section id="wishListDetail" class="wishListDetail tabContent" data-mypage-type="wishList">
		          <div>
		          <h3>회원님의 위시리스트에 담겨있어요!</h3>
		            <ul class="wishLists"> 
		             <c:forEach var="wishList" items="${wishList}" >
				              <li>
				                  <div>
				                    <img src="https://sheerhouse2.s3.ap-northeast-2.amazonaws.com/home/minor0175%40naver.com/%EC%A3%BC%ED%83%9D%EA%B0%80%EC%9D%98%20%EA%B0%80%EC%A0%95%EC%A7%91/zip3.jpg" alt="bookingphoto" />
				                  </div>
				                  <div class="wishListContent">
				                    	<a href="searchResultDetail.do?home_seq=${wishList.home_seq}&title=${wishList.title}" target="_blank">
				                    		<h2>${wishList.title}</h2>
				                    	</a>
				                    	<span>가격 : ${wishList.price}</span>	
				                    	<span>${wishList.info}</span>
				                  </div>
				                 	<div class="wishIcon">
				                    	<span class="entypo-heart wishlist ${wishList.home_seq}" id="${wishList.home_seq}" active="false" style="color: rgb(229,87,99);"></span> 
				                    </div>
				                <div class="divider"></div>
				              </li>
		                </c:forEach>
		            </ul>
		          </div>
		        </section>
		        

		       
        <section id="historyDetail" class="historyDetail tabContent" data-mypage-type="history">
        	<ol class="historyLists">
		            <c:forEach var="reservationlist" items="${reservationlist}">	
		            	<c:set var="today" value="<%=new java.util.Date()%>"/>
		           		<fmt:parseDate var="starDate" value="${fn:split(reservationlist.res_date, ',')[0]}" pattern="yyyy-MM-dd"/>
		            	<c:if test="${starDate < today }">
		
				              <li class="historyList">
				                <div>	
					                    <div class="historyImage">
					                    <input  class="imageUrls" type="hidden" value="${reservationlist.url}" />
					              <!--         <img src="/resources/Images/place/place2.jpg" alt="bookingphoto" /> -->
					                    </div>
					                    <div class="historyTexts">
					                            <div class="historyContent">
					                      		<a href="searchResultDetail.do?home_seq=${reservationlist.home_seq}&title=${reservationlist.title}" target="_blank">
					                            	<h2>${reservationlist.title}</h2>
					                        	</a>
					                            	<span> 결제 금액 : ${reservationlist.total_price}</span>
					                            	<div class="reservationDateInfo">
					                            		<span>기간 : </span>	
					                            		<input type="text" class="reservationDates" value="${reservationlist.res_date}" readonly/>	
					                            	</div>
					                            	
					                            	<span> 예약 인원 : ${reservationlist.headcount}</span>
					                            		
					                            </div>
					                             <div class="bookingInfo">
					                         		 <!-- button onclick="bookingInfo('{booking.seq}')">예약상세</button> -->
					                         		<c:choose>
					                      		<c:when test="${reservationlist.pay_status == 'failed'}">
					                      		<button class="historyInfoBtn" style="background-color: gray;">예약상세 / 리뷰작성</button>
					                     		</c:when>
					                     		<c:otherwise>
					                     			<input  class="fullImageUrl" type="hidden" value="${reservationlist.url}" />
					                      			<a href="mypageReview.do?home_seq=${reservationlist.home_seq}&apply_num=${reservationlist.apply_num}" target="_blank">
					                         		  		<button class="historyInfoBtn">예약상세 / 리뷰작성</button>
					                         		 </a>
					                     		</c:otherwise>
					                     	</c:choose>
					                      		 </div>
					                      </div>
					                      <div>
					                      	<%-- <input class="reservationState" type="button" value="${reservationlist.res_status }" />  --%>
					                      	<c:choose>
					                      		<c:when test="${reservationlist.pay_status == 'failed'}">
					                      			<input class="reservationState complete" type="button" value="취소" /> 
					                      			<input type="hidden" class="reservationCancel" type="button" value="${reservationlist.cancel_reason }" /> 
					                     		</c:when>
					                     		<c:otherwise>
					                     			<input class="reservationState complete" type="button" value="완료" /> 
					                      			<input type="hidden" class="reservationCancel" type="button" value="${reservationlist.cancel_reason }" /> 
					                     		</c:otherwise>
					                     	</c:choose>
					                      </div>                    
					                </div>
				                </li>
		                </c:if>
		             </c:forEach>
            </ol>           
        
        </section>
        
        
        <!--------------------------------- 개인정보 -------------------------------- -->
        
        
        
        <section id="infoDetail" class="infoDetail tabContent" data-mypage-type="privateInfo">
          <div>
             <form action="updateUser.do" method="post" class="myInfoForm" name="myInfoForm">
              <label for="name">이름</label>
              <input type="text" name="name" id="myname" value="${user.name}" />
              <label for="password">현재 비밀번호</label>
              <input type="password" name="password" id="mypassword" />
              <label for="emailla">이메일</label>
              <input type="text" name="email" id="myemail" value="${user.email}"  readonly/>
              <!-- ------------ -전화번호 ------------->
              
              <div class="phoneCheck">
	              <label for="phone">전화번호</label>
	              	<input type="hidden" id="smsResult" value="false">
	              	<input type="hidden" id="beforePhone" value="${user.phone }"/>
              		<input type="text" name="phone" id="phone" value="${user.phone}" />
              		<button class="smsVerification" type="button" id="smsSendBtn" onclick="sendSms()">SMS인증</button>
              		<input type="hidden" id="smsNumConfirm" placeholder="인증번호 입력" style="align-content: center;"/>
              		<input class="smsVerification" type="hidden" id="smsNumCheckBtn" value="인증번호 확인" onclick="checkSms()"/>
              		<input type="hidden" id="smsNumConfirmCheck"/>
			        <p id="smsMsg" style="text-align: center; font-size: 12px; color:red"></p>      
              </div>

              
                <!-- ------------ -전화번호 ------------->
              <label for="birthday">생년월일</label>
              <input type="date" id="birthday" name="birthday" value="${user.birthday}" />

              <input class="submitBtn" type="button" value="수정 / 반영하기" onclick="userInfoSubmit()"/>
            </form>
             <p id="submitMsg" style="text-align: center; font-size: 12px; color:red"></p>  
            <div class="divider-bottom"></div>
            <div>
            	<form action="userRoleSet.do" method="get" name="setRoleForm">
            	<div class="removeUser">
            		<button type="button" id="roleBtn" onclick="setRole()">휴면처리</button>
            	</div>
            	</form>
            </div>
          </div>
        </section>
        <section id="paymentDetail" class="paymentDetail tabContent" data-mypage-type="payment">
        	<div class="paymentDetilContainer">
        			<div>
        				<select id="status_keyword" name="status_keyword" >
   							<option value="all" selected="selected">전체</option>
   							<option value="paid">결제완료</option>
   							<option value="stay">환불대기</option>
   							<option value="failed">취소</option>
						</select>
						<input type="button" id="setBtn" value="검색" onclick="statusSearch()"/>     		
        			</div>
        			<div id="payDiv">
        				<c:forEach var="pay" items="${payList}">
        				<ul>
        					<li>숙소이름: ${pay.title }</li>
        					<li>호스트이메일: ${pay.host_email}</li>
        					<li>결제금액: ${pay.total_price}원</li>
        					<li>예약일: ${pay.res_date }</li>
        					<li>결제일시: ${pay.pay_date}</li>
        					<c:choose>
        						<c:when test="${pay.pay_status == 'paid'}">
        							<li><span id="${pay.apply_num }">결제상태: 완료</span></li>
        						</c:when>
        						<c:when test="${pay.pay_status == 'failed'}">
        							<li><span>결제상태: 취소</span></li>
        						</c:when>
        						<c:otherwise>
        							<li><span>결제상태: 환불대기</span></li>
        						</c:otherwise>
        					</c:choose>
        					<li><p id="${pay.apply_num}cancelP" style="display: none;">환불사유</p></li>
        					<li><textarea id="${pay.apply_num}cancel_reason" rows="1" cols="40" style="resize: none; display: none;"></textarea>
        					<li><input id="${pay.apply_num}refundBtn" type="button" name="refundBtn" value="환불신청" onclick="refundApply('${pay.apply_num}','${pay.res_date }','${pay.pay_status}')"/></li>
        					<li><input id="${pay.apply_num}refundSendBtn" type="hidden" name="refundSendBtn" value="환불신청" onclick="refundSend('${pay.apply_num}')"/></li>        				
        				</ul>
        				</c:forEach>
        			</div>
        	</div>
        
        </section>
    </div>
   </div>
  </body>
  <script type="text/javascript">
  function statusSearch(){
		
		var key = document.getElementById("status_keyword").value;
		var div = document.getElementById("payDiv");
		console.log(key);
		var html = "";
		 
		$.ajax({
			url: 'searchSetKeyword.do',
			type: 'GET',
			dataType: 'json',
			data: {"keyword" : key},
			success: function(result){
				$(div).empty();
				var size = result.length;
				console.log(result);
				console.log(size);
			if(div .innerHTML == 'undefined'){
				console.log("jojo");
			}
				for(var i =0; i < size; i++ ){
					html+= "<ul>";
					html+= "<li>숙소이름: "+result[i].title+"</li>";
					html+= "<li>호스트이메일: "+result[i].host_email+"</li>";
					html+= "<li>결제금액: "+result[i].total_price+"</li>";
					html+= "<li>예약일: "+result[i].res_date+"</li>";
					html+= "<li>결제일시: "+result[i].pay_date+"</li>";
		
					if(result[i].pay_status == 'paid'){
						console.log(result[i].apply_num);
						
						html+= "<li><span id="+"\'"+result[i].apply_num+"\'"+">결제상태: 완료</span></li>";
						
					}else if(result[i].pay_status =='failed'){
						html+= "<li>결제상태: 취소</li>";
					}else{
						html+= "<li>결제상태: 환불대기</li>";
					}
					html+="<li><p id=\'"+ result[i].apply_num +"cancelP\' style=\"display: none;\">환불사유</p></li>";
					html+="<li><textarea id=\'"+ result[i].apply_num +"cancel_reason\' rows=\"1\" cols=\"40\" style=\"resize: none; display: none;\"></textarea>";
					html+="<li><input id=\'"+ result[i].apply_num +"refundBtn\' type=\"button\" name=\"refundBtn\" value=\"환불신청\" onclick=\"refundApply(\'"+result[i].apply_num +"\',\'"+result[i].res_date+"\',\'"+result[i].pay_status+"\')\"/></li>";
					html+="<li><input id=\'"+ result[i].apply_num +"refundSendBtn\' type=\"hidden\" name=\"refundSendBtn\" value=\"환불신청\" onclick=\"refundSend(\'"+result[i].apply_num+"\')\"/></li>";
					html+="</ul>";
					
				}
				div.innerHTML=html;
			}
		});
	
		
	}
  
  
  
  	function refundApply(apply_num, res_date, pay_status){
  		console.log(pay_status);
  		if(pay_status == 'stay'){
  			alert("환불 대기상태인 결제입니다.");
  			return;
  		}else if(pay_status =='failed'){
  			alert("취소된 결제입니다.");
  			return;
  		}
  		//당일포함 7일전
  	 	var date = res_date.split(",");
  		
  	 	var checkin = new Date(date[0]);
  	 	
  	 	var ref_date = new Date(checkin.setDate(checkin.getDate()-7));
  	 	ref_date = ref_date.toISOString().split("T");
  	 
  	 	var today = new Date(); //체크인
  	 	var ref = new Date(ref_date[0]); //기준일
  	
  	 	//현재 날짜 > 기준일
  	 	var result = today > ref;
  	 	console.log(result);
  	 	
  	 	if(result){
  	 		alert("예약일로부터 7일 이내인경우 환불이 불가능합니다.");
  	 		return;
  	 	}
  	 	
  	 	var cancelP = document.getElementById(apply_num+"cancelP").style;
  	 	cancelP.display="block";
  	 	var cancel_reason = document.getElementById(apply_num+"cancel_reason").style;
  	 	cancel_reason.display="block";
  	 	document.getElementById(apply_num+"refundBtn").setAttribute("type", "hidden");
  	 	document.getElementById(apply_num+"refundSendBtn").setAttribute("type", "button");
  	}
  	
  	function refundSend(apply_num){
  	 	
		var con = confirm("정말 환불하시곘습니까?");
  	 	
  	 	if(con){
  	 		//document.getElementById(apply_num).innerHTML='결제상태: 환불대기';
  	 		var cancelP = document.getElementById(apply_num+"cancelP").style;
  	  	 	cancelP.display="none";
  	  		var cancel_reason_text = document.getElementById(apply_num+"cancel_reason");
  	 		cancel_reason_text.style.display="none";
  	 		
  	 		var cancel_reason = cancel_reason_text.value;
  	 		console.log("환불사유" +cancel_reason);
  	 		
  	 		$.ajax({
  	 			url: 'refundApply.do',
  	 			type: 'POST',
  	 			data:{
  	 				"apply_num": apply_num,
  	 				"cancel_reason": cancel_reason
  	 			},
  	 			success: function(){
  	 				alert("환불처리 되었습니다.");
					location.href="mypage.do";
  	 			}
  	 		});
  	 	}
  	}
  </script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
  <script>
    const urls = document.querySelectorAll(".imageUrl");
    const historyurls = document.querySelectorAll(".imageUrls");
    
	/* 나의 예약 썸네일 지정  */
	
 	const thumNail = document.querySelectorAll(".accomodationImage");
	/* thumNail.innerHTML = '<img src="'+img[0]+'" alt="bookingphoto" />'; */
	var imgArr = [];
	
	for(var j=0; j<urls.length; j++){
		var url = urls[j].value;
		var imgs = url.slice(1,-1);
		var img = imgs.split(",");
		/* console.log(img[j]); */
		imgArr.push(img[j]);
	}
	
	 for(var i=0; i < thumNail.length; i++){
		 	thumNail[i].innerHTML = '<img src="'+ imgArr[i]+'" alt="bookingphoto" />'; 
		 	
	}
	 
	 
	 
	 
	 /* 나의 히스토리 썸네일 지정 */
	 
	 const historythumNail = document.querySelectorAll(".historyImage");
		/* thumNail.innerHTML = '<img src="'+img[0]+'" alt="bookingphoto" />'; */
		var historyimgArr = [];
		for(var j=0; j<historyurls.length; j++){
			var historyurl = historyurls[j].value;
			var historyimgs = historyurl.slice(1,-1);
			var historyimg = historyimgs.split(", ");
			/* console.log(img[j]); */
			historyimgArr.push(historyimg[j]);
			
			
		}
		
		 for(var i=0; i < historythumNail.length; i++){
			 historythumNail[i].innerHTML = '<img src="'+ historyimgArr[i]+'" alt="bookingphoto" />'; 
			 	
		} 
		
	
	
	
/* 	$(document).on("click", ".reservationInfoExit", function(){
		$(".reservationDetailInfoContainer").css({'display': 'none'});
	})
	
	$(document).on("click", ".bookingInfoBtn", function(){
		$(".reservationDetailInfoContainer").css({'display': 'block'});
		var title = '<h2>{title}</h2>'
		$(".reservationInfoDetail").append(title);
		
		
	}) */
	
	
	
  
  /* 예약확정, 취소 버튼 기능입니다. res_status 값을 받아옵니다. */
  
  	const reservationStates = document.querySelectorAll(".reservationState");
  	for(var i=0; i< [...reservationStates].length; i++){
  		if(reservationStates[i].value === 'paid'){
  			reservationStates[i].value =  "예약확정";
  			console.log([...reservationStates].length);
  		}else if(reservationStates[i].value === 'failed'){
  			const cancelReason = document.querySelector(".reservationCancel");
  			reservationStates[i].value =  "취소";
  			reservationStates[i].style.backgroundColor = '#d65f5f';
  			reservationStates[i].addEventListener("click", function(){
  				alert(cancelReason.value);
  			});
  			
  		}else if(reservationStates[i].value === 'stay'){
  			reservationStates[i].value =  "환불대기 중";
  			reservationStates[i].style.backgroundColor = 'grey';
  			
  		}
  	}
  	
  	var imgContent = "";
	for(var i=0; i<img.length; i++){
		console.log(img[i]);
		imgContent += '<li class="mySlides fade" ><img src="'+ img[i]+'" alt="bookingphoto" /></li>'; 
	}
	
	$(".slideImagesContainer").append(imgContent);
  	
	const reservStarDate = document.querySelectorAll(".reservationDates");
	const spanDate = document.querySelectorAll(".reservationDate");
	var resContent = "";
	
	for(var num=0; num< [...reservStarDate].length; num++){
		var dates = reservStarDate[num].value;
		var date = dates.split(",");
		var nights = date.length;
		
		var strCheckin = date[0];
  		var strCheckout = date[date.length -1];
  		
		var arr1 = strCheckin.split('-');
		var arr2 = strCheckout.split('-');
		
		
		var checkin = new Date(arr1[0], arr1[1], arr1[2]);
		var checkout = new Date(arr2[0], arr2[1], arr2[2]);
				
		var diff = checkout - checkin;
		var currentDay = 24 * 60 * 60 * 1000;
		
		let result = parseInt(diff/currentDay);
		
		resContent = result + '박' + nights + '일';
		reservStarDate[num].value = resContent;
		console.log(resContent);
		
	}
	
/* 
		var stayingDates = []; */
	</script>
	<script>
		var confirmNumberCheck = document.getElementById("smsNumConfirmCheck");
		var confirmNumber = document.getElementById("smsNumConfirm");
		
		var checkBtn = document.getElementById("smsNumCheckBtn");
		var beforePhone = document.getElementById("beforePhone").value;
		var smsResult = document.getElementById("smsResult");
		var phone = document.getElementById("phone");
		function sendSms(){
			
			var tel = phone.value;
				var regexp = /^\d{3}-\d{3,4}-\d{4}$/
				if(tel.match(regexp) == null || tel==""){
					document.getElementById("smsMsg").innerHTML=" '-'를 포함하여 전화번호를 입력해주세요";
					return;
				}
				
				$.ajax({
					url: 'sendSms.do',
					type: 'POST',
					data: {"tel": tel },
					success: function(result){
						//인증버튼 보임
						checkBtn.setAttribute("type","button");
						//인증번호 작성 텍스트 보임
						confirmNumber.setAttribute("type", "text");
						//인증번호 저장
						confirmNumberCheck.setAttribute("value", result);
						document.getElementById("smsMsg").innerHTML="인증번호가 발송되었습니다.";
						console.log(confirmNumberCheck.value);
					}
				});
			}
		function checkSms(){
			console.log("진입");
			var confirmNum = confirmNumber.value;
			var confirmCheck = confirmNumberCheck.value;
			
			if(confirmNum == confirmCheck){
				document.getElementById("smsMsg").innerHTML="인증이 성공적으로 완료되었습니다.";
				//
				confirmNumber.setAttribute("type", "hidden");
				smsResult.setAttribute("value","true");
			}else{
				document.getElementById("smsMsg").innerHTML="인증이 실패하였습니다. 다시시도해주세요.";
				confirmNumber.setAttribute("type", "hidden");
				smsResult.setAttribute("value","false");
			}
			checkBtn.setAttribute("type", "hidden");
		}
  	function userInfoSubmit(){
  		var result = smsResult.value;
  		
  		if(phone.value != beforePhone && result =="false"){
  			document.getElementById("submitMsg").innerHTML="전화번호 변경시 인증은 필수입니다.";
  			return;
  		}
  		document.myInfoForm.submit();
  	}
  	function setRole(){
  		var result = confirm("계정을 휴면처리 하시겠습니까?");
  		console.log(result);
  		if(result == false) return;
  		
  		alert("휴면처리 되었습니다. 언제든 다시 쉬어가를 찾아주세요.");
  		document.setRoleForm.submit();
  	}
  	
  	</script>
</html>