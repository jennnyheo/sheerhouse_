<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 전용 페이지 입니다.</title>
<link rel="stylesheet" href="resources/css/hostpage.css" />
<style>
.resForm {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.res-modal {
  display: none;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.4);
  position: absolute;
  left: 0;
  top: 0;
  z-index: 5;
}
.divider-res {
  width: 50%;
  border-bottom: 1px solid #d65f5f;
  margin: 0 auto;
  margin-top: 1rem;
  margin-bottom: 1rem;
}
.res-modalContent {
  margin: 130px auto;
  width: 450px;
  height: 450px;
  background-color: #eeeeee;
  border-radius: 0.6rem;
  box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
  animation-name: modalopen;
  animation-duration: 0.5s;
}
.resHeader {
  text-align: center;
  color: #6f1313;
  font-size: 20px;
}

.emailForm {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.email-modal {
  display: none;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.4);
  position: absolute;
  left: 0;
  top: 0;
  z-index: 5;
}
.divider-email {
  width: 50%;
  border-bottom: 1px solid #d65f5f;
  margin: 0 auto;
  margin-top: 1rem;
  margin-bottom: 1rem;
}
.email-modalContent {
  margin: 130px auto;
  width: 450px;
  background-color: #eeeeee;
  border-radius: 0.6rem;
  box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
  animation-name: modalopen;
  animation-duration: 0.5s;
}
.emailHeader {
  text-align: center;
  color: #6f1313;
  font-size: 20px;
}

.admin-emailForm {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.admin-email-modal {
  display: none;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.4);
  position: absolute;
  left: 0;
  top: 0;
  z-index: 5;
}
.admin-divider-email {
  width: 50%;
  border-bottom: 1px solid #d65f5f;
  margin: 0 auto;
  margin-top: 1rem;
  margin-bottom: 1rem;
}
.admin-email-modalContent {
  margin: 130px auto;
  width: 450px;
  height: 400px;
  background-color: #eeeeee;
  border-radius: 0.6rem;
  box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
  animation-name: modalopen;
  animation-duration: 0.5s;
}
.admin-emailHeader {
  text-align: center;
  color: #6f1313;
  font-size: 20px;
}
</style>

<script type="text/javascript">
function imgSetting(url){
	var imgs = url.slice(1,-1);
	var img = imgs.split(",");
	console.log(img);
	return img[0];
}

</script>
</head>
<body>
    <div>
    	<%@ include file="/WEB-INF/views/host/Header.jsp"%>
<!--       <div class="navContainer">
        <div class="logoContainer">
          <a href="/index.do"
            ><h2>쉬어家</h2>
            <span>sheerhouse</span></a
          >
        </div>
      </div> -->
      <div class="myhostHeader">
        <h2>호스트페이지</h2>
        <p>호스트 전용 페이지 입니다.</p>
      </div>
      <div class="divider-host"></div>
      <div class="myhostGreeting">
        <h3>안녕하세요 host ${host.name}님</h3>
      </div>
      <div class="myhostSelect">
        <ul class="myhostlists">
          <li
            onclick="showMore(this)"
            class="tabs"
            id="accomodation"
            data-myhostpage-type="hostDetail"
          >
            등록된 숙소
          </li>
          <li
            onclick="showMore(this)"
            class="tabs"
            id="reservation"
            data-myhostpage-type="reservationDetail"
          >
            게스트 예약
          </li>
          <li
            onclick="showMore(this)"
            class="tabs"
            id="history"
            data-myhostpage-type="historyDetail"
          >
            히스토리
          </li>
          <li
            onclick="showMore(this)"
            class="tabs"
            id="hostInfo"
            data-myhostpage-type="hostinfoDetail"
          >
            호스트 정보
          </li>
          <li
            onclick="showMore(this)"
            class="tabs"
            id="payment"  
            data-myhostpage-type="paymentDetail"
          >
            정산 내역
          </li>
        </ul>
      </div>
      <div class="detailContainer">
        <section id="hostDetail" class="hostDetail tabContent" data-myhostpage-type="accomodation">
            <h3>등록된 숙소 현황입니다.</h3>
            <div class="addmore">
                <button onclick="addmoreAccomodation()">숙소 등록 하기</button>
            </div>
            <ol class="hostingLists"> 
            <c:forEach var="home" items="${homeList}">  
              <li class="hostingList">
                <div>
                    <div class="accomodationImage">
                      <img src="" id="${home.title}" alt="hostingphoto" />
                      <script>
                      document.getElementById("${home.title}").src=imgSetting("${home.url}")</script>
                    </div>
                    <div class="accomodationTexts">
                        <a href="searchResultDetail.do?home_seq=${home.home_seq }" target='_blank'>
                            <div class="accomodationContent">
                            <h2>${home.title}</h2>
                            <div>
                            <c:choose>
                            	<c:when test="${home.status == 'on' }">
                            		<span>정상운영</span>
                            	</c:when>
                            	<c:when test="${home.status == 'off' }">
                            		<span>운영중지</span>
                            	</c:when>
                            	<c:when test="${home.status == 'stop' }">
                            		<span>운영정지</span>
                            	</c:when>
                            </c:choose>
                            <span>${home.info }</span>
                            </div>
                            </div>
                        </a>
                        <div class="hostingInfoBtn">
                          <a href="hostDateSetting.host?home_seq=${home.home_seq}" target='_blank'><input type="button" value="숙소 정보 수정"></a>
                        </div>
                    </div>
                </div>
                </li>
                
          	</c:forEach>
            </ol>
        
        </section>
        <!-- reservationDetail section -->
        <section id="reservationDetail" class="reservationDetail tabContent" data-myhostpage-type="reservation">
            <h3>예약 정보입니다.</h3>
            <div>
            <ul class="reservationLists">
            	<c:forEach var="res" items="${resInfo}">
            		<input type="hidden" id="${res.apply_num }title" value="${res.title }"/>
              	  	<input type="hidden" id="${res.apply_num }useremail" value="${res.email }"/>
              	  	<input type="hidden" id="${res.apply_num }res_date" value="${res.res_date }"/>
                	<input type="hidden" id="${res.apply_num }total_price" value="${res.total_price }"/>
                	<input type="hidden" id="${res.apply_num }headcount" value="${res.headcount}"/>
                	<input type="hidden" id="${res.apply_num }pay_status" value="${res.pay_status }"/>
                	<input type="hidden" id="${res.apply_num }pay_date" value="${res.pay_date }"/>
                	<input type="hidden" id="${res.apply_num }cancel_reason" value="${res.cancel_reason }"/>
              <li>
                <a href="searchResultDetail.do?home_seq=${res.home_seq }">
                  <div>
                    <img src="" id="${res.home_seq}" alt="bookingphoto" />
                      <script>
                      document.getElementById("${res.home_seq}").src=imgSetting("${res.url}")</script>
                  </div>
                  <div>
                    <div class="reaservation-userInfo">
                        <h4>예약자: ${res.email }</h4>
                        <h4>예약 일자: ${res.res_date }</h4>
                        <c:choose>
                        	<c:when test="${res.pay_status == 'paid'}">
                        		<h4>결제 상태: 완료</h4>
                        	</c:when>
                        	<c:when test="${res.pay_status == 'failed'}">
                        		<h4>결제 상태: 취소</h4>
                        	</c:when>
                        </c:choose>
                     </div> 
                      <div class="reservationContent">
                        <h3>${res.title }</h3>
                        <span>${res.info }</span>
                      </div>
                  </div>
                </a>
                   <div class="moreInfoBtn">
                      <input type="button" value="더 많은 정보" onclick="resInfo('${res.apply_num}')" />
                      <input type="button" value="게스트에게 메일 보내기"  onclick="emailModalOpen('${res.apply_num}')"/>
                  </div>
              </li>
              </c:forEach>
            </ul>
          </div>
        </section>
        <section id="historyDetail" class="historyDetail tabContent"data-myhostpage-type="history">
        <h3>히스토리 - 게스트들의 지난 예약내역을 확인할 수 있습니다.</h3>
            <div>
            <ul class="reservationLists">
            	<c:forEach var="his" items="${hisInfo}">
            		<input type="hidden" id="${his.apply_num }title" value="${his.title }"/>
              	  	<input type="hidden" id="${his.apply_num }useremail" value="${his.email }"/>
              	  	<input type="hidden" id="${his.apply_num }res_date" value="${his.res_date }"/>
                	<input type="hidden" id="${his.apply_num }total_price" value="${his.total_price }"/>
                	<input type="hidden" id="${his.apply_num }headcount" value="${his.headcount}"/>
                	<input type="hidden" id="${his.apply_num }pay_status" value="${his.pay_status }"/>
                	<input type="hidden" id="${his.apply_num }pay_date" value="${his.pay_date }"/>
                	<input type="hidden" id="${his.apply_num }cancel_reason" value="${his.cancel_reason }"/>
              <li>
                <a href="searchResultDetail.do?home_seq=${his.home_seq }">
                  <div>
                    <img src=" " id="his${his.home_seq}" alt="bookingphoto" />
                      <script>
                      document.getElementById("his${his.home_seq}").src=imgSetting("${his.url}")</script>
                  </div>
                  <div>
                    <div class="reaservation-userInfo">
                        <h4>예약자: ${his.email }</h4>
                        <h4>예약 일자: ${his.res_date }</h4>
                        <c:choose>
                        	<c:when test="${his.pay_status == 'paid'}">
                        		<h4>결제 상태: 완료</h4>
                        	</c:when>
                        	<c:when test="${his.pay_status == 'failed'}">
                        		<h4>결제 상태: 취소</h4>
                        	</c:when>
                        </c:choose>
                     </div>
                      <div class="reservationContent">
                        <h3>${his.title }</h3>
                        <span>${his.info }</span>
                      </div>
                  
                  </div>

                </a>
                  <div class="moreInfoBtn">
                      <input type="button" value="더 많은 정보" onclick="resInfo('${his.apply_num}')" />
                  </div>
              </li>
              </c:forEach>

            </ul>
          </div>
        </section>
        <section id="hostinfoDetail" class="hostinfoDetail tabContent"data-myhostpage-type="hostInfo">
          <h3>게스트와 소통할 수 있는 정보를 입력, 수정할 수 있어요!</h3>
            <div>
            <input type="hidden" id="smsResult" value="false"/>
            <input type="hidden" id="beforePhone" value="${host.phone }"/>
            <form action="hostUpdate.host" method="post" class="myHostInfoForm" name="hostUpdateForm">
              <label for="name">이름</label>
              <input type="text" id="name" name="name" value="${host.name}" />
              <label for="email">연락 이메일</label>
              <input type="text" id="email" name="email" value="${host.email}" readonly/>
              <label for="phone">연락 전화번호</label>
              <input type="text" id="phone" name="phone" value="${host.phone}" placeholder=" '-'를 포함하여 전화번호를 입력해주세요" />
              <span id="telSpan" style="align-content: center; font-size: 12px; color: red;"></span>
              <input type="button" id="smsSendBtn" value="인증번호 발송" onclick="smsConfirm()"/>
              <input type="hidden" id="smsCheckBtn" value="인증하기" onclick="smsCheck()"/>
              <input type="hidden" id="confirmNumber" name="confirmNumber" placeholder="인증번호를 입력해주세요"/>
              <input type="hidden" id="confirmNumberCheck" name="confirmNumberCheck"/>
             <div class="introductionInputs">
             	 <label for="introduction">소개</label>
              	 <textarea id="introduction" name="host_info" style="resize: none;">${host.host_info}</textarea> 
			  <span id="submitSpan" style="align-content: center; font-size: 12px; color: red;"></span>
             </div>
              <input class="submitBtn" type="button" value="수정 / 반영하기" onclick="updateHostInfo()"/>
            </form>
          </div>
        </section>
        <section id="paymentDetail" class="paymentDetail tabContent" data-myhostpage-type="payment">
        		<input type="hidden" id="chart" value="${setCalc.chartArray}"/>
        		<h3>통장사본 등록 / 변경</h3>
        		<c:choose>
        			<c:when test="${host.account_url == ''}">
        				<span>등록된 통장사본이 없습니다. 정산을 받으려면 통장사본을 등록해주세요.</span><br>
        			</c:when>
        			<c:otherwise>
        				<span>이미 등록된 통장사본이 존재합니다.</span><br>
        			</c:otherwise>
                </c:choose>
               		 <input type="file" id="file" accept="image/*"/>
                     <div class="moreInfoBtn">
                      <input type="button" id="uploadBtn" value="등록" onclick="uploadImg()"/>
                     </div>
                <h3>정산 내역 조회</h3>
					<div class="stats">
							<div class="stat">
		                		<span>총 정산 금액: ${setCalc.total_price}원</span>
		                		<span>정산 완료 금액: ${setCalc.set_price }원</span>
		               		 	<span>정산 예정 금액: ${setCalc.unset_price}원</span>
		                	</div>
		                	<div class="resStat">
		                		<span>총 예약횟수: ${setCalc.res_total_count}회</span>
		                		<span>예약 완료율:${setCalc.res_paid_per}%</span>
		                		<span>예약 취소율:${setCalc.res_failed_per}%</span>
		                	</div>
					</div>
					<div class="charts">
							<div>
								<span>수입차트</span>
								<div id="chart_div_bar" ></div>
							</div>
							<div>
								<span>예약율 차트</span>
								<div id="chart_div_line" ></div>
							</div>
					</div>
                <span>정산내역</span>
                <div>
                <span>조회: </span>
				<select id="status_keyword" name="status_keyword" >
   					<option value="all" selected="selected">전체</option>
   					<option value="true">완료</option>
   					<option value="false">미완료</option>
				</select>
				<input type="button" id="setBtn" value="검색" onclick="statusSearch()"/>
				</div>
				<div id="setList">
                    <c:forEach var="set" items="${setList}">
							<h2>${set.title}</h2>
							<span>결제금액: ${set.price}원</span>
							<span>결제날짜: ${set.pay_date}</span>
							<c:choose>
								<c:when test="${set.status == true}">
									<span>정산된 금액: ${set.set_price }원</span>
									<span>정산완료</span>
									<span>정산일시: ${set.update_date}</span>
								</c:when>
								<c:otherwise>
									<span>정산예정 금액: ${set.set_price }원</span>
									<span>정산예정</span>
								</c:otherwise>
							</c:choose>							
					</c:forEach>
				</div>
				<div class="moreInfoBtn">
                      <input type="button" id="sendAdminEmail" value="관리자에게 메일 보내기" onclick="sendAdminModal()"/>
                     </div>
       		 </section>
         
        <!-- alert modal section -->
        <div class="modal1">
          <div class="modal1-container">
            <div class="modal1-img">
              <img src="https://sheerhouse2.s3.ap-northeast-2.amazonaws.com/Setting/Icons/close.png" alt="X" onclick="exitModal1()">
            </div>
            <span>호스트 등록 화면으로 이동하시겠습니까?</span>
            <button class="moveToRegiBtn" onclick="movetoReg()">이동하기</button>
          </div>
        </div>
      </div>
      <div class="res-modal" >
       	<div class="res-modalContent">
      		<h3 class="resHeader">게스트 예약 정보</h3>
           		<div class="divider-res"></div>
                	<form class="resForm" action="#" method="post" name="payForm">
						<span>숙소 이름 : <input type="text" name="title" id="title" value="" readonly/></span>
						<span>게스트 이메일 : <input type="text" name="useremail" id="useremail" readonly/></span>
						<span>예약 날짜 : <input type="text" id="res_date" name="res_date" readonly></span>
						<span>결제 금액 : <input type="text" id="total_price" name="total_price" readonly></span>
						<span>게스트 인원 : <input type="text" id="headcount" name="headcount" readonly></span>
						<span>결제 상태 : <input type="text" id="pay_status" name="pay_status" readonly></span>
						<span>결제 날짜 : <input type="text" id="pay_date" name="pay_date" readonly></span>
						<span id="cancelMsg"></span>
						<textarea id="cancel_reason" style="display: none; resize: none;" readonly cols="30"></textarea>
						<input type="button" value="닫기" onclick="resInfoClose()"/>
					</form>
         </div>
   	  </div>
   	  <div class="email-modal" >
       	<div class="email-modalContent">
      		<h3 class="emailHeader">게스트에게 이메일 보내기</h3>
           		<div class="divider-email"></div>
                	<form class="emailForm" action="#" method="post">
						<span>호스트 이메일 : <input type="text" id="host_email" value="${host.email}" readonly/></span>
						<span>게스트 이메일 : <input type="text" id="user_email" readonly/></span>
						<input type="hidden" id="e_title" />
						<span>보낼 내용</span>
						<textarea id="message" style="resize: none;" cols="50" rows="15"></textarea>
						<span id="emailMsg" style="align-content: center; font-size: 12px; color: red;"></span>
						<input type="button" value="전송하기" onclick="emailSend()"/>
						<input type="button" value="닫기" onclick="emailSendClose()"/>
					</form>
         </div>
   	  </div>
   	  <div class="admin-email-modal" >
       	<div class="admin-email-modalContent">
      		<h3 class="admin-emailHeader">관리자에게 이메일 보내기</h3>
           		<div class="admin-divider-email"></div>
                	<form class="admin-emailForm" action="#" method="post">
						<span>관리자 이메일 : <input type="text" id="admin_email" value="sheerhouse25@gmail.com" readonly/></span>
						<span>호스트 이메일 : <input type="text" id="admin_host_email" value ="${host.email }" readonly/></span>
						<input type="hidden" id="admin_e_title" />
						<span>보낼 내용</span>
						<textarea id="admin_message" style="resize: none;" cols="50" rows="15" placeholder="문의사항을 상세히 적어주세요"></textarea>
						<span id="admin_emailMsg" style="align-content: center; font-size: 12px; color: red;"></span>
						<input type="button" value="전송하기" onclick="adminEmailSend()"/>
						<input type="button" value="닫기" onclick="emailSendClose()"/>
					</form>
         </div>
   	  </div>
</body>
<script src="resources/js/hostpage.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.4.1/dist/email.min.js"></script>
<script type="text/javascript">
	emailjs.init('user_uCSqkvJln6DKsZNHVEhr5');
</script>
<script type="text/javascript">
var resmodal = document.querySelector(".res-modal");

function resInfo(apply_num){

	var title = document.getElementById(apply_num+"title").value;
	var email = document.getElementById(apply_num+"useremail").value;
	var res_date = document.getElementById(apply_num+"res_date").value;
	var total_price = document.getElementById(apply_num+"total_price").value;
	var headcount = document.getElementById(apply_num+"headcount").value;
	var pay_status = document.getElementById(apply_num+"pay_status").value;
	var pay_date = document.getElementById(apply_num+"pay_date").value;
	var cancel_reason = document.getElementById(apply_num+"cancel_reason").value;
	
	document.getElementById("title").setAttribute("value",title);
	document.getElementById("useremail").setAttribute("value",email);
	document.getElementById("res_date").setAttribute("value",res_date);
	document.getElementById("total_price").setAttribute("value",total_price);
	document.getElementById("headcount").setAttribute("value",headcount);
	document.getElementById("pay_status").setAttribute("value",pay_status);
	document.getElementById("pay_date").setAttribute("value",pay_date);
	
	if(pay_status == "paid"){
		document.getElementById("pay_status").setAttribute("value","완료");
	}else{
		document.getElementById("pay_status").setAttribute("value","취소");
	}
	
	if(pay_status == "paid"){
		document.getElementById("cancelMsg").innerHTML="";
		document.getElementById("cancel_reason").style.display="none";
	}else{
		document.getElementById("cancelMsg").innerHTML="취소 사유: ";
		document.getElementById("cancel_reason").value=cancel_reason;
		document.getElementById("cancel_reason").style.display="block";
	}
	
	 resmodal.style.display = "block";
}

function resInfoClose(){
	 resmodal.style.display = "none";
}

var confirmNumberCheck = document.getElementById("confirmNumberCheck");
var confirmNumber = document.getElementById("confirmNumber");
var sendBtn = document.getElementById("smsSendBtn");
var checkBtn = document.getElementById("smsCheckBtn");
var beforePhone = document.getElementById("beforePhone").value;
var smsResult = document.getElementById("smsResult");
var phone = document.getElementById("phone");
function smsConfirm(){
		var tel = phone.value;
		var regexp = /^\d{3}-\d{3,4}-\d{4}$/
		if(tel.match(regexp) == null || tel==""){
			document.getElementById("telSpan").innerHTML=" '-'를 포함하여 전화번호를 입력해주세요";
			return;
		}
		
		$.ajax({
			url: 'hostSms.host',
			type: 'POST',
			data: {"tel": tel },
			success: function(result){
				console.log(result);
				sendBtn.setAttribute("type","hidden");
				checkBtn.setAttribute("type","button");
				confirmNumber.setAttribute("type", "text");
				confirmNumberCheck.setAttribute("value", result);
				document.getElementById("telSpan").innerHTML="인증번호가 발송되었습니다.";
				console.log(confirmNumber);
			}
		});

	}

function smsCheck(){
	var confirmNum = confirmNumber.value;
	var confirmCheck = confirmNumberCheck.value;
	
	if(confirmNum == confirmCheck){
		document.getElementById("telSpan").innerHTML="인증이 성공적으로 완료되었습니다.";
		confirmNumber.setAttribute("type", "hidden");
		smsResult.setAttribute("value","true");
	}else{
		document.getElementById("telSpan").innerHTML="인증이 실패하였습니다. 다시시도해주세요.";
		confirmNumber.setAttribute("type", "hidden");
		smsResult.setAttribute("value","false");
	}
	checkBtn.setAttribute("type", "hidden");
	sendBtn.setAttribute("type","button");
	
	
}

function updateHostInfo(){
	var result = smsResult.value;
	
	if(phone.value != beforePhone && result =="false"){
		document.getElementById("submitSpan").innerHTML="전화번호 변경시 인증은 필수입니다.";
		return;
	}
	document.hostUpdateForm.submit();
	
}

var emailmodal = document.querySelector(".email-modal");
function emailModalOpen(apply_num){
	document.getElementById("emailMsg").innerHTML="";
	document.getElementById("message").value="";
	var user_email = document.getElementById(apply_num+"useremail").value;
	var title = document.getElementById(apply_num+"title").value;
	document.getElementById("user_email").setAttribute("value", user_email);
	document.getElementById("e_title").setAttribute("value", title);
	emailmodal.style.display = "block";
}
/*
<div class="admin-email-modal" >
	<div class="admin-email-modalContent">
		<h3 class="admin-emailHeader">관리자에게 이메일 보내기</h3>
   		<div class="admin-divider-email"></div>
        	<form class="admin-emailForm" action="#" method="post">
				<span>관리자 이메일 : <input type="text" id="admin_email" value="sheerhouse25@gmail.com" readonly/></span>
				<span>호스트 이메일 : <input type="text" id="admin_host_email" value ="${host.email }" readonly/></span>
				<input type="hidden" id="admin_e_title" />
				<span>보낼 내용</span>
				<textarea id="admin_message" style="resize: none;" cols="50" rows="15" placeholder="문의사항을 상세히 적어주세요"></textarea>
				<span id="admin_emailMsg" style="align-content: center; font-size: 12px; color: red;"></span>
				<input type="button" value="전송하기" onclick="emailSend()"/>
				<input type="button" value="닫기" onclick="emailSendClose()"/>
			</form>
 </div>
 </div>
*/
var adminEmailModal = document.querySelector(".admin-email-modal");
function sendAdminModal(){
	document.getElementById("admin_message").value="";
	adminEmailModal.style.display = "block";
	
	
}

function emailSend(){
	var h_title = document.getElementById("e_title").value;
	var u_email = document.getElementById("user_email").value;
	var h_message = document.getElementById("message").value;
	var h_email = document.getElementById("host_email").value;

	if(h_message == ""){
		document.getElementById("emailMsg").innerHTML="보낼 내용은 필수입니다.";
		return;
	}
	
	 emailjs.send("service_avx135c","template_7gw19yk",{
  	   user_email: u_email,
  	   message: h_message,
  	   host_email: h_email,
  	   title: h_title,
  	   }).then(function(response){
  		   alert('전송이 완료되었습니다.');
  		   emailmodal.style.display = "none";
  	   }, function(error){
  	 alert(JSON.stringify(error));
   });
	
}

function adminEmailSend(){
	var h_email = document.getElementById("admin_host_email").value;
	var h_message = document.getElementById("admin_message").value;
	
	console.log(h_email);
	console.log(h_message);
	
	emailjs.send("service_avx135c","template_0h52ruh",{
	  	   host_email: h_email,
	  	   message: h_message,
	  	   }).then(function(response){
	  		   alert('전송이 완료되었습니다.');
	  		 adminEmailModal.style.display = "none";
	  	   }, function(error){
	  	 alert(JSON.stringify(error));
	   });
	
	
}

function emailSendClose(){
	 emailmodal.style.display = "none";
	 adminEmailModal.style.display = "none";
}

function uploadImg(){
	var file = document.getElementById('file');
	var filedata = new FormData(); 
	if (!file.value){
		alert("전송할 파일을 첨부해주세요.");
		return;
	}  
	
	filedata.set("img",file.files[0]);
	
	 $.ajax({
		 url: "uploadHostAccount.host",
		 enctype: 'multipart/form-data',
		 type:"POST",
		 data: filedata,
		 async: false,
	  	 processData: false,
	  	 contentType: false,
	  	 success: function(result){
	  		 console.log(result);
	  		 alert("성공적으로 업로드 되었습니다.");
	  	 }
	  });
}

function statusSearch(){

	var key = document.getElementById("status_keyword").value;
	var div = document.getElementById("setList");
	console.log(key);
	var html="";
	$.ajax({
		url: 'searchSetKeyword.host',
		type: 'GET',
		dataType: 'json',
		data: {"keyword" : key},
		success: function(result){
			$(div).empty();
			var size = result.length;
			for(var i =0; i < size; i++ ){
				html+= "<h2>"+result[i].title+"</h2>";
				html+= "<span>결제금액: " +result[i].price+ "</span>";
				html+= "<span>결제날짜: " +result[i].pay_date+ "</span>";
				if(result[i].status == true){
					html+="<span>정산된 금액: "+ result[i].set_price +"원</span>";
					html+="<span>정산완료</span>";
					html+="<span>정산일시: "+ result[i].update_date+"</span>";
				}else{
					html+="<span>정산예정 금액: "+result[i].set_price+"원</span>";
					html+="<span>정산예정</span>";
				}
			}

			div.innerHTML=html;
		}
	});
	
}


</script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    function replaceAll(str, searchStr, replaceStr) {

     return str.split(searchStr).join(replaceStr);
    }
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);
      var chartdate = [];
      var str= document.getElementById("chart").value;
      str = replaceAll(str, '[', "");
      str = replaceAll(str, ']', "");
      str = replaceAll(str, " ", "");
      chartdate = str.split(",");
      console.log(chartdate);
      function drawVisualization() {
        var data = google.visualization.arrayToDataTable([
			[chartdate[0],chartdate[1]],
			[chartdate[3],Number(chartdate[4])],
			[chartdate[6],Number(chartdate[7])],
			[chartdate[9],Number(chartdate[10])],
			[chartdate[12],Number(chartdate[13])],
			[chartdate[15],Number(chartdate[16])],
			[chartdate[18],Number(chartdate[19])],
			[chartdate[21],Number(chartdate[22])],
			[chartdate[24],Number(chartdate[25])],
			[chartdate[27],Number(chartdate[28])],
			[chartdate[30],Number(chartdate[31])],
			[chartdate[33],Number(chartdate[34])],
			[chartdate[36],Number(chartdate[37])]
       ]);

        var options = {
          title : '수입 확인',
          vAxis: {title: '수입'},
          hAxis: {title: 'Month'},
          seriesType: 'bars',
          //isStacked: 'absolute'
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div_bar'));
        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript">
    function replaceAll(str, searchStr, replaceStr) {

     return str.split(searchStr).join(replaceStr);
    }
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);
      var chartdate = [];
      var str= document.getElementById("chart").value;
      str = replaceAll(str, '[', "");
      str = replaceAll(str, ']', "");
      str = replaceAll(str, " ", "");
      chartdate = str.split(",");
      console.log(chartdate);
      function drawVisualization() {
        var data = google.visualization.arrayToDataTable([
			[chartdate[0],chartdate[2]],
			[chartdate[3],Number(chartdate[5])],
			[chartdate[6],Number(chartdate[8])],
			[chartdate[9],Number(chartdate[11])],
			[chartdate[12],Number(chartdate[14])],
			[chartdate[15],Number(chartdate[17])],
			[chartdate[18],Number(chartdate[20])],
			[chartdate[21],Number(chartdate[23])],
			[chartdate[24],Number(chartdate[26])],
			[chartdate[27],Number(chartdate[29])],
			[chartdate[30],Number(chartdate[32])],
			[chartdate[33],Number(chartdate[35])],
			[chartdate[36],Number(chartdate[38])]
       ]);

        var options = {
          title : '예약율 확인',
          vAxis: {title: '예약율', maxValue:100},
          hAxis: {title: 'Month'},
          seriesType: 'line',
          //isStacked: 'absolute'
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div_line'));
        chart.draw(data, options);
      }
    </script>
</html> 