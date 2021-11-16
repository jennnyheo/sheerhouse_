<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/UserMypage/mypageReview.css" />
<title>과거 예약 및 리뷰 작성</title>
</head>
<body>
	<div>
	<%@ include file="/WEB-INF/views/user/Header.jsp"%>
							
					<div class="reservationDetailInfoContainer">
					 				<input class="imgUrls" type="hidden" value="${bookingDetail.url }" />
					 					<div class="slideshow-container">
													
											  <!-- Full-width images with number and caption text -->
											  <ul class="slideImagesContainer">
											  	<!-- img url append here -->
											  </ul>
											
											  <!-- Next and previous buttons -->
											  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
											  <a class="next" onclick="plusSlides(1)">&#10095;</a>
										</div>
											
											
											<div class="reservationInfoDetail">
											<h2>${bookingDetail.title}</h2>
								                	<div>
								                		<p>총 결제 금액 : ${bookingDetail.total_price}</p>
								                	</div>
								                	<div>
								                		<p>예약 일정 : ${bookingDetail.res_date}</p>
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
								               </div>
								       </div>
								       <div class="divider-middle"></div>
								 
						<div class="comments">
						
							<div class="reviewHeader">
	  							<h2>후기</h2>
	  						</div>
	  						<div class="divider-long"></div>
							<c:forEach var="comment" items="${CommentInfo}">	
							
				  					<div class="reviewsContainer"> 
				              			<div class="reviews">
						                  	<span><strong>${comment.name}</strong> 님 의 리뷰입니다.</span>
						                  	<p>평점 ${comment.score}</p>
						                  	
						                 	 <div class="review-inside-bar"></div>             
						                  
						                  		<p class="reviewContent">${comment.content}</p> 
						                  
						                	  <div class="reviewRegDate">
						                  		<fmt:formatDate value="${comment.regDate}" pattern="yyyy/MM"/>
						                  			<span>에 작성되었습니다.</span>
							                  	<c:if test="${user.name == comment.name}">
							                  			<button class="deleteReview">삭제하기</button>
							                  	</c:if>
						                  </div>
						                               
				              			</div>
				            			<div class="divider-long"></div>
				            		</div>
		            		
		            		</c:forEach>
						
					</div>
					<div class="divider-long"></div>
				<div class="reviewContainer">
<!-- 				<form> -->
					<input type="hidden" value="${user.name}" name="name" class="reviewName" />
					<input type="hidden" value="${bookingDetail.apply_num}" name="name" class="reviewApplyNum" />
						<div>
						<h2>숙소의 평점을 입력해주세요</h2>
						    	<label class="radio-inline">
							      	<input type="radio" name="optradio"  value="5" checked>5
							    </label>
							    <label class="radio-inline">
							      	<input type="radio" name="optradio" value="4">4
							    </label>
							    <label class="radio-inline">
							      	<input type="radio" name="optradio" value="3">3
							    </label>
							  	<label class="radio-inline">
							      	<input type="radio" name="optradio" value="2">2
							    </label>
							    <label class="radio-inline">
							      	<input type="radio" name="optradio" value="1">1	
							    </label>
						</div>
						<h2>숙소의 후기를 알려주세요</h2>
					<input type="hidden" value="${bookingDetail.home_seq}" name="home_seq" class="reviewHomeSeq" />
					<textarea class="reviewContent" name="content" type="text"></textarea>
					<input type="submit" class="addReview"  value="등록"/>
			<!-- 		</form> -->
				</div>
	</div>
</body>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script> -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script> 

	/* 이미지 슬라이드 용 url 선언 */
  const urls = document.querySelector(".imgUrls");

  	var url = urls.value;
  	var imgs = url.slice(1,-1);
  	var img = imgs.split(",");

  	
  	var imgContent = "";
	for(var i=0; i<img.length; i++){
		console.log(img[i]);
		imgContent += '<li class="mySlides fade" ><img src="'+ img[i]+'" alt="bookingphoto" /></li>'; 
	}
	
	/* 사진 append to ul 의 li   jquery, script delete 주의! */
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
		  

	

   
	/* 리뷰 등록 ajax */

	
	$(document).on("click", ".addReview", function(){
		
		let home_seq = $(".reviewHomeSeq").val();
		let name = $(".reviewName").val();
		let content = $(".reviewContent").val();
		let apply_num = $(".reviewApplyNum").val()
		let score = $('input[name=optradio]:checked').val();
		
		let reviewData = "<span><strong>"+ name + "</strong> 님 의 리뷰입니다.</span><div class='review-inside-bar'></div><p class='reviewContent'>"+ content+ "</p>";
		$.ajax({
			url : 'mypageReviewInsert.do',
			type : "POST",
			data: {home_seq, name : name, content: content, apply_num: apply_num, score: score},
			dataType: "text",
			success : function(result, status, xhr){ 
				if(result === "inserted"){
					console.log("added");
					alert("added!");
					$(".reviewsContainer").html(reviewData);

					}else if(result === "unInserted"){
						console.log("error");
						alert("error");

					}
				
			}, 
			error: function(xhr, status, er){
/* 				alert(er);
				alert(status); */
				alert("저장되었습니다.");
			}
		});
			console.log(url);
		
	});
	
	
	/* delte 기능  */
	
	$(document).on("click", ".deleteReview", function(){
		
	/* 	let home_seq = $(".reviewHomeSeq").val();
		let name = $(".reviewName").val();
		let content = $(".reviewContent").val(); */
		let apply_num = $(".reviewApplyNum").val() 
		
		$.ajax({
			url : "mypageReviewDelete.do",
			type : "Get",
			data: {apply_num: apply_num},
			dataType: "text",
			success : function(result){
				if(result == "delete"){
					console.log("added");
					alert("삭제되었습니다.");

					}else{
						console.log("error");
						alert("error");

				}
				
			},
			error: function(xhr, status, er){
				/* 	alert(er);
					alert(status); */
					alert("삭제되었습니다.");
			}
		}); 
		
	});
	
	
   

		 

  
  </script>
</html>