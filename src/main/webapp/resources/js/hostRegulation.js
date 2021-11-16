function check() {
  const checkhere = document.querySelector(".clickhere");
  const agree1 = document.querySelector(".agree1");
  agree1.style.display = "block";
}

function agreeBtn1() {
  const agree1 = document.querySelector(".agree1");
  const cbReg1Pass = document.querySelector(".cb-reg1-nonpass");
  const cbReg2Pass = document.querySelector(".cb-reg2-nonpass");
  const cbReg3Pass = document.querySelector(".cb-reg3-nonpass");
  const warnMsg = document.querySelector(".warnMsg");
  if (cbReg1Pass.checked || cbReg2Pass.checked) {
    warnMsg.innerHTML = "죄송합니다. 호스트 자격에 충족하지 못했습니다. ";
  } else if (cbReg3Pass.checked) {
    warnMsg.innerHTML = "동의하지 않으시면 가입이 불가합니다. ";
  } else {
    agree1.style.display = "none";
    const clickhereTitle = document.querySelector(".clickhereTitle");
    clickhereTitle.innerHTML = "확인되었습니다.";
    const clickhere = document.querySelector(".clickhere");
    clickhere.removeAttribute("onclick");

    const moveToRegBtn = document.querySelector(".moveToRegi a");
    moveToRegBtn.href = "register.host"; //주소 값 변경 하기
    moveToRegBtn.style.backgroundColor = "#d65f5f";
    moveToRegBtn.innerText = "호스트 등록하러 가기";
  }
}

function validate1() {
  const cbReg1Pass = document.querySelector(".cb-reg1-pass");
  const cbReg2Pass = document.querySelector(".cb-reg1-nonpass");
  if (cbReg1Pass.checked === true) {
    cbReg2Pass.disabled = true;
  } else if (cbReg1Pass.checked === false) {
    cbReg2Pass.disabled = false;
  }
}

function validate2() {
  const cbReg1Pass = document.querySelector(".cb-reg1-pass");
  const cbReg2Pass = document.querySelector(".cb-reg1-nonpass");

  if (cbReg2Pass.checked === true) {
    cbReg1Pass.disabled = true;
  } else if (cbReg2Pass.checked === false) {
    cbReg1Pass.disabled = false;
  }
}

function validate3() {
  const cbReg1Pass = document.querySelector(".cb-reg2-pass");
  const cbReg2Pass = document.querySelector(".cb-reg2-nonpass");
  if (cbReg1Pass.checked === true) {
    cbReg2Pass.disabled = true;
  } else if (cbReg1Pass.checked === false) {
    cbReg2Pass.disabled = false;
  }
}

function validate4() {
  const cbReg1Pass = document.querySelector(".cb-reg2-pass");
  const cbReg2Pass = document.querySelector(".cb-reg2-nonpass");

  if (cbReg2Pass.checked === true) {
    cbReg1Pass.disabled = true;
  } else if (cbReg2Pass.checked === false) {
    cbReg1Pass.disabled = false;
  }
}

function validate5() {
  const cbReg1Pass = document.querySelector(".cb-reg3-pass");
  const cbReg2Pass = document.querySelector(".cb-reg3-nonpass");
  if (cbReg1Pass.checked === true) {
    cbReg2Pass.disabled = true;
  } else if (cbReg1Pass.checked === false) {
    cbReg2Pass.disabled = false;
  }
}

function validate6() {
  const cbReg1Pass = document.querySelector(".cb-reg3-pass");
  const cbReg2Pass = document.querySelector(".cb-reg3-nonpass");

  if (cbReg2Pass.checked === true) {
    cbReg1Pass.disabled = true;
  } else if (cbReg2Pass.checked === false) {
    cbReg1Pass.disabled = false;
  }
}
/**
 * 
 */