function showMore(data) {
  const tabContent = document.querySelectorAll(".tabContent");
  for (var i = 0; i < tabContent.length; i++) {
    tabContent[i].style.display = "none";
  }
  const tabs = document.getElementsByClassName(".tabs");
  for (i = 0; i < tabs.length; i++) {
    tabs[i].className = tabs[i].className.replace("active", "");
  }
  const dataType = data.getAttribute("data-myhostpage-type");
  console.log(dataType);
  document.querySelector("#" + dataType).style.display = "block";
}

function addmoreAccomodation() {
  const confirmModal = document.querySelector(".modal1");
  document.body.style.backgroundColor = "RGBA(18,10,11,0.52)";
  confirmModal.style.display = "block";
}

function exitModal1() {
  const confirmModal = document.querySelector(".modal1");
  document.body.style.backgroundColor = "#ffffff";
  confirmModal.style.display = "none";
}

function movetoReg() {
  document.body.style.backgroundColor = "#ffffff";
  window.location.href = "hostRegulation.host";
}
/**
 * 
 */