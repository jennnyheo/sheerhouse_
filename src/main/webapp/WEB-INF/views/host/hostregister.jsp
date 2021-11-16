<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/hostStyle.css" />

<style type="text/css">
	#att_zone{
		width: 400px;
		min-height: 250px;
		padding:10px;
		margin-top: 10px;
		margin-bottom: 10px;
		border:1px solid gray;
	}
	#att_zone:empty:before{
		content: attr(data-placeholder);
		color: #999;
		font-family: 10px;
	}
	
	.spanMsg{
		font-size: 12px;
		color: red;
		align-content: center;
	}
</style>
<title>호스트등록하기</title>
</head>
 <body>
    <div class="property-container">
      <section class="property-header">
        <div>
          <h2>게스트에게</h2>
          <h2>숙소를 자세히 설명해주세요</h2>
        </div>
      </section>
      <form action="homeRegist.host" method="post" class="hostForm" id="registForm">
      	<input type="hidden" id="typeValue" name="type"/>
        <div class="propertyContent-container">
          <section class="property property-type">
            <div class="propertyInput-container">
              <h2>숙소타입</h2>
              	<span class="spanMsg" id="titleSpan"></span>
                <button
                  onclick="propertySelect(event);typeSet('아파트');"
                  name="propertyType"
                  class="propertyApartment"
                  id="propertyApartment"
                  type="button"
                  value="아파트"
                  role="radio"
                >
                  아파트
                </button>
                <button
                  onclick="propertySelect(event);typeSet('주택');"
                  name="propertyType"
                  class="propertyHouse"
                  id="propertyHouse"
                  type="button"
                  value="주택"
                  role="radio"
                >
                  주택
                </button>
                <button
                  onclick="propertySelect(event);typeSet('별채');"
                  class="propertySpecialHouse"
                  id="propertySpecialHouse"
                  name="propertyType"
                  type="button"
                  value="별채"
                  role="radio"
                >
                  별채
                </button>
                <button
                  onclick="propertySelect(event);typeSet('B&B');"
                  name="propertyType"
                  class="propertyBB"
                  id="propertyBB"
                  type="button"
                  value="B&B"
                  role="radio"
                >
                  B&B
                </button>
                <button
                  onclick="propertySelect(event);typeSet('독특한 숙소');"
                  class="propertyUnique"
                  id="propertyUnique"
                  name="propertyType"
                  type="button"
                  value="독특한 숙소"
                  role="radio"
                >
                  독특한 숙소
                </button>
                <button
                  onclick="propertySelect(event);typeSet('부티크 호텔');"
                  class="propertyHotel"
                  id="propertyHotel"
                  name="propertyType"
                  type="button"
                  value="부티크 호텔"
                  role="radio"
                >
                  부티크 호텔
                </button>
                
              <div class="arrow-container">
                <div class="right-arrow" onclick="proTypeArrow()">
                  <img onClick="relayout();"
                    src="/resources/Images/icons/right-arrow.png"
                    alt="right-arrow"
                  />
                </div>
              </div>
            </div>
          </section>
          <section class="property property-location" id="location">
            <div>
              <h2>숙소위치</h2>
              <div class="locationInputContainer" >
                <input
                  name="address"
                  class="locationInput"
                  type="text"
                  placeholder="주소찾기를 이용해주세요."
                  readonly="readonly"
    			  id="locationText"
                />
              
                <!-- 
                <input
                  name="propertyLocation"
                  class="locationInput"
                  type="hidden"
                  placeholder="상세주소를 입력해주세요."
    			  id="detailLocationText"
                />
                 
                <span id="locationMsg" class="spanMsg" style="color:red;font-size: 11px;"></span>-->
                <input class="locationInputBtn" type="button" value="주소찾기" onClick="searchAddress();"/>
                <span class="spanMsg" id="locationSpan" style="margin-top: 10px;"></span>
                
              	<div id="addressLayer"></div>
              </div>
              <div id="map" class="locationInfo"  ></div>
              <div class="arrow-container">
                <div class="left-arrow" onclick="proLocationLeftArrow()">
                  <img src="/resources/Images/icons/right-arrow.png" alt="left-arrow" />
                </div>
                <div class="right-arrow" onclick="proLocationRightArrow()">
                  <img
                    src="/resources/Images/icons/right-arrow.png"
                    alt="right-arrow"
                  />
                </div>
              </div>
            </div>
          </section>
          <section class="property property-images" >
           	<div>
           		<h2>숙소 사진 등록</h2>
           		<span style="align-content: center; color:navy; font-size: 12px;margin-bottom: 20px;">사진 등록은 최대 3장까지 가능합니다.</span>
              	<input type="hidden" id="imgCheck" value="0">
              	<div id="imagePreview">
              		<input type="file" name="file" id="btnAtt" multiple="multiple" accept="img/*" style="display: none;"/>
              		<input type="button" value="사진등록" onclick=document.all.btnAtt.click();>
              		<span class="spanMsg" id="imgSpan" style="margin-top: 10px;"></span>
              		
              		<div id="att_zone" data-placeholder="등록버튼 및 드래그로 추가 가능합니다."></div>
              	</div>
              <div class="arrow-container">
                <div class="left-arrow" onclick="proImagesLeftArrow()">
                  <img src="/resources/Images/icons/right-arrow.png" alt="left-arrow" />
                </div>
                <div class="right-arrow" onclick="imgSet();proImagesRightArrow();">
                  <img
                    src="/resources/Images/icons/right-arrow.png"
                    alt="right-arrow"
                  />
                </div>
              </div>
            
            </div>
          </section>
          <section class="property property-maxPeo">
            <div>
              <div class="maxPeoNum">
                <h2>최대 수용인원</h2>
                <span class="spanMsg" id="headSpan" style="margin-top: 10px;"></span>
                <div>
                  <input
                    class="addBtn"
                    type="button"
                    onclick="increaseNum()"
                    value="+"
                  />
                  <input
                    type="text"
                    value="0"
                    name="headcount"
                    class="maxPeopleInput"
                    id="headCount"
                  />
                  <input
                    class="minusBtn"
                    type="button"
                    onclick="decreaseNum()"
                    value="-"
                  />
                </div>
              </div>
              <div class="arrow-container">
                <div class="left-arrow" onclick="proMaxPeoLeftArrow()">
                  <img src="/resources/Images/icons/right-arrow.png" alt="left-arrow" />
                </div>
                <div class="right-arrow" onclick="proMaxPeoRightArrow()">
                  <img
                    src="/resources/Images/icons/right-arrow.png"
                    alt="right-arrow"
                  />
                </div>
              </div>
            </div>
          </section>
          <section class="property property-price">
            <div>
              <h2>요금</h2>
              <span class="spanMsg" id="priceSpan" style="margin-bottom: 10px;" ></span>
              <input
                name="price"
                type="text"
                placeholder="요금을 입력해주세요"
                id="price";
              />
              <div class="arrow-container">
                <div class="left-arrow" onclick="proPriceLeftArrow()">
                  <img src="/resources/Images/icons/right-arrow.png" alt="left-arrow" />
                </div>
                <div class="right-arrow" onclick="proPriceRightArrow()">
                  <img
                    src="/resources/Images/icons/right-arrow.png"
                    alt="right-arrow"
                  />
                </div>
              </div>
            </div>
          </section>
          <section class="property property-name">
            <div>
              <h2>숙소이름</h2>
              <span class="spanMsg" id="titleSpaan" style="margin-bottom: 10px;"></span>
              <input id="title"
                name="title"
                type="text"
                placeholder="숙소이름을 입력해주세요"
              />
              <div class="arrow-container">
                <div class="left-arrow" onclick="proNameLeftArrow()">
                  <img src="/resources/Images/icons/right-arrow.png" alt="left-arrow" />
                </div>
                <div class="right-arrow" onclick="proNameRightArrow()">
                  <img
                    src="/resources/Images/icons/right-arrow.png"
                    alt="right-arrow"
                  />
                </div>
              </div>
            </div>
          </section>
          <section class="property property-description">
            <div>
              <h2>숙소설명</h2>
              <span>게스트에게 최대한 자세히 설명해주세요</span>
              <span>
                숙소위치의 장점, 장애인 시설, 화재시설등의 편의시설을 강조하면
                더 좋아요!
              </span>
              <span class="spanMsg" id="infoSpan" style="margin-top: 10px;"></span>
              <textarea name="info" id="info"></textarea>
              <div class="arrow-container">
                <div class="left-arrow" onclick="proDescLeftArrow()">
                  <img src="/resources/Images/icons/right-arrow.png" alt="left-arrow" />
                </div>
              </div>
            </div>
            <input 
              class="hostSubmit"
              type="button"
              value="모두 작성했습니다."
              onclick="submitBtn();"
            />
          </section>
        </div>
      </form>
    </div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f48e658b16980f769e8e1860af3df72f&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src=/resources/js/host.js></script>
<script type="text/javascript">
function typeSet(value){
	var type = document.getElementById("typeValue");
	type.setAttribute("value", value);
}

</script>
<script type="text/javascript">
var container = document.getElementById("map");
var options = {
  center: new kakao.maps.LatLng(37.570999, 126.992651),
  level: 5
};
var map = new kakao.maps.Map(container, options);
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
var geocoder = new kakao.maps.services.Geocoder();
var marker = new kakao.maps.Marker({
    map: map
});
function relayout(){
	  
	
	if($("#location").css("display") == "none"){
		setTimeout(function(){ map.relayout(); }, 0);
	}

	
}

var layer = document.getElementById("addressLayer");
function searchAddress(){
	new daum.Postcode({
		oncomplete: function(data){
			var addr = data.address;
			
			document.getElementById("locationText").value = addr;
			
			geocoder.addressSearch(data.address, function(result, status) {
			//document.getElementById("locationMsg").innerHTML="상세주소까지 다 입력하셨나요? 게스트에게 정확한 주소를 알려줘야 합니다."
			//document.getElementById("detailLocationText").setAttribute("type","text");
					if (status === daum.maps.services.Status.OK) {

                    var coords = new daum.maps.LatLng(result[0].y, result[0].x);
                    marker.setMap(null);
                    marker = new daum.maps.Marker({
                        position: coords,
                        map: map
                    });
                    map.relayout();
                    map.setCenter(coords);
                    marker.setPosition(coords)
                }
            });
		}
	}).open();
	
}
</script>
<script type="text/javascript">
var fileCnt = 0;
var imgForm = new FormData();
		/* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
		  imageView = function imageView(att_zone, btn){
		    var attZone = document.getElementById(att_zone);
		    var btnAtt = document.getElementById(btn)
		    var sel_files = [];
		    
		    // 이미지와 체크 박스를 감싸고 있는 div 속성
		    var div_style = 'display:inline-block;position:relative;'
		                  + 'width: 260px;height:200px;margin:5px;border:1px solid gray;z-index:1';
		    // 미리보기 이미지 속성
		    var img_style = 'width:100%;height:100%;z-index:none';
		    // 이미지안에 표시되는 체크박스의 속성 
		    var chk_style = 'width:30px;height:30px;position:absolute;font-size:20px;'
		                  + 'right:0px;bottom:0px;z-index:999;background-color:transparent;color:#f00';
		  
		    
		    btnAtt.onchange = function(e){
		      var files = e.target.files;
		      var fileArr = Array.prototype.slice.call(files)
				fileCnt += fileArr.length;
		      	if(fileCnt < 4){
		      	for(f of fileArr){
		        	imgForm.append("file", f);

		      		imageLoader(f);
		     	 }
		      	}else{
		      		alert("사진등록은 최대 3장까지 가능합니다");
		      		fileCnt -= fileArr.length;
		      		return;
		      	} 
		    }  
		    
		  
		    // 탐색기에서 드래그앤 드롭 사용
		    attZone.addEventListener('dragenter', function(e){
		      e.preventDefault();
		      e.stopPropagation();
		    }, false)
		    
		    attZone.addEventListener('dragover', function(e){
		      e.preventDefault();
		      e.stopPropagation();
		      
		    }, false)
		  
		    attZone.addEventListener('drop', function(e){
		      var files = {};
		      e.preventDefault();
		      e.stopPropagation();
		      var dt = e.dataTransfer;
		      files = dt.files;
		      fileCnt += files.length;
		      if(fileCnt < 4){
		      	for(f of files){
		      		//imgArr.push(f);
		      		//console.log(imgArr);
		        	imgForm.append("file", f);
		      		imageLoader(f);
		      	}
		      }else{
		    	  alert("사진등록은 최대 3장까지 가능합니다");
		    	  fileCnt -= files.length;
		    	  return;
		      }
		    }, false)
		   
		    imageLoader = function(file){
		      sel_files.push(file);
		      var reader = new FileReader();
		      reader.onload = function(ee){
		    	  
		        let img = document.createElement('img')
		        img.setAttribute('style', img_style)
		     	  img.src = ee.target.result;
		        attZone.appendChild(makeDiv(img, file));
		     	      
		     	}
		      
		      reader.readAsDataURL(file);
		    }
		    
		    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
		    makeDiv = function(img, file){
		      var div = document.createElement('div')
		      div.setAttribute('style', div_style)
		      
		      var btn = document.createElement('input')
		      btn.setAttribute('type', 'button')
		      btn.setAttribute('value', 'x')
		      btn.setAttribute('delFile', file.name);
		      btn.setAttribute('style', chk_style);
		      btn.onclick = function(ev){
		        var ele = ev.srcElement;
		        var delFile = ele.getAttribute('delFile');

		        for(var i=0 ;i<sel_files.length; i++){
		          if(delFile== sel_files[i].name){
		            sel_files.splice(i, 1);  
		            //imgArr.splice(i,1);
		          }
		        }
		        
		        dt = new DataTransfer();
		        for(f in sel_files) {
		          var file = sel_files[f];
		          dt.items.add(file);
		        }
		        btnAtt.files = dt.files;
		        var p = ele.parentNode;
		        attZone.removeChild(p);
		        imgForm.delete(delFile);
		        fileCnt-= 1;
		        
		      }
		      div.appendChild(img)
		      div.appendChild(btn)
		      return div
		    }
		}('att_zone', 'btnAtt')
		
		function imgSet(){
			if(fileCnt !=0){
				document.getElementById("imgCheck").setAttribute("value", "1");
			}else{
				document.getElementById("imgCheck").setAttribute("value", "0");
			}
		}

	  function submitBtn(e){
		  	
			  var title = document.getElementById("title").value;
			
			  var info = document.getElementById("info").value;
			  console.log(info);
			  if(info === ""){
				console.log("진입");
				document.getElementById("infoSpan").innerHTML="숙소설명은 필수 입력사항입니다.";
				return;
			  }
			  
			  $.ajax({
				 url: "/fileSend.host?title="+title ,
				 enctype: 'multipart/form-data',
				 type:"POST",
				 data: imgForm,
				 async: false,
			  	 processData: false,
			  	 contentType: false
			  });
			  document.getElementById("infoSpan").innerHTML="";
			  document.getElementById("registForm").submit();
		 
	  }
</script>
  </body>
</html>