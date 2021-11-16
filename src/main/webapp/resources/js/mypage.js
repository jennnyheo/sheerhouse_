/**
 * 
 */

function showMore(data) {
  const tabContent = document.querySelectorAll(".tabContent");
/*  const detailContainer = document.querySelector(".detailContainer");*/
  for (i = 0; i < tabContent.length; i++) {	
    tabContent[i].style.display = "none";
  }
  const tabs = document.getElementsByClassName(".tabs");
  for (i = 0; i < tabs.length; i++) {
    tabs[i].className = tabs[i].className.replace("active", "");
  }
  const dataType = data.getAttribute("data-mypage-type");
  document.querySelector("#" + dataType).style.display = "block";
}

function bookingInfo(bookingSeq) {
  const popUrl = bookingSeq + ".html";
  const tempUrl = "tempURL.html";
  const popOption =
    "top=20, left=20, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no";
  window.open(tempUrl, popOption);
}
/**
 * 
 */