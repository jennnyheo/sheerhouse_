<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/hostRegulation.css" />
</head>
<body>
	<div class="regulationContainer">
      <header class="header">
        <div>
          <h2>호스트가 되기 위한 첫번째 단계입니다.</h2>
        </div>
      </header>
      <div class="clickhere" onclick="check()">
        <h2 class="clickhereTitle">여기를 클릭해주세요</h2>
      </div>
      <div class="moveToRegi">
        <a href="/"></a>
      </div>
      <div class="agree1">
        <h2 class="agreeHeader">확인해주세요</h2>
        <div class="divider"></div>
        <div>
          <div class="check1">
            <h3>호스트 등록 약관</h3>
            <textarea rows="8" cols="50" style="border: 1px solid #000000;resize: none;">일반 약관
쉬어가는 호스트에게 숙소, 체험 또는 기타 호스트 서비스를 활발한 게스트 커뮤니티와 공유하고 이를 통해 수입을 올릴 수 있는 기회를 제공합니다. 호스팅 등록의 요금, 예약 가능 날짜, 이용규칙 등의 호스팅 방식은 호스트가 결정합니다.

관리
쉬어가 플랫폼은 리스팅을 쉽게 설정하고 관리할 수 있는 도구를 제공합니다. 리스팅 페이지에는 호스트 서비스, 요금 및 청소비, 리조트 수수료, 보증금, 오프라인 수수료와 같은 기타 비용, 게스트 또는 호스팅에 적용되는 모든 규칙이나 요건에 대한 완전하고 정확한 정보가 포함되어야 합니다. (예약 가능 여부를 확인할 수 있는 달력을 포함한) 호스팅 정보와 (사진 등의) 콘텐츠를 항상 최신 상태로 정확하게 유지할 책임은 회원님에게 있습니다. 쉬어가에서는 제공하시는 호스트 서비스에 적합한 보험에 가입하실 것을 권장하며, 보장 내역 및 예외 사항을 포함한 보험 약관은 주의 깊게 검토하시는 것이 좋습니다. 숙박시설당 하나의 리스팅이 원칙이지만, 해당 숙박시설에 게스트가 머물 공간이 여럿인 경우, 단일한 숙박시설이라도 여러 개의 리스팅을 등록할 수 있습니다.

사용자와의 관계
예약 요청을 수락하거나 쉬어가 플랫폼을 통해 예약이 확정되면, 회원님은 게스트와 직접 계약을 체결하게 되는 것이며, 호스팅에 명시된 가격에 따라 호스트 서비스를 제공할 책임이 있습니다. 또한 쉬어가 서비스 수수료(및 관련 세금)를 지불하는 데 동의하시게 됩니다. 게스트와의 추가 계약에 포함되는 모든 약관, 정책 또는 조건은 본 약관, 쉬어가 정책, 호스팅 설명에 제공된 정보와 일치해야 하며, 호스팅 설명에서 잘 보이게 명시되어야 합니다.

호스트의 독립성
회원님과 쉬어가와의 관계는 독립적인 개인 또는 주체의 관계이며, 회원님은 쉬어가의 직원, 대리인, 합작 투자자 또는 파트너가 아닙니다. 단, 쉬어가는 결제 약관에 따라 결제 수금 대리인의 역할을 합니다. 쉬어가는 호스트 서비스를 지시하거나 통제하지 않으며, 회원님은 호스트 서비스를 제공할지 여부와 제공 시기, 요금과 제공 조건 등과 관련해서 호스트 본인에게 전적으로 재량권이 있다는 데 동의합니다.</textarea>
          </div>
          <label>
            <input
              class="cb-reg1-pass"
              name="accept"
              type="checkbox"
              value="pass"
              onchange="validate1()"
            />
            해당사실이 없습니다.
          </label>
          <label>
            <input
              class="cb-reg1-nonpass"
              name="accept"
              type="checkbox"
              value="nonpass"
              onchange="validate2()"
            />
            해당사실이 있습니다.
          </label>
        </div>

        <div>
          <div class="check2">
            <h3>숙소등록 약관</h3>
            <textarea rows="8" cols="50" style="border: 1px solid #000000;">호스트의 책임
회원님은 본인의 작위와 부작위에 대한 의무와 책임이 있으며, 호스트 서비스를 제공하는 데 있어 참여하도록 허용한 모든 사람의 작위와 부작위에 대해서도 책임을 집니다. 호스팅의 요금 책정과 이용규칙 및 요건에 대한 책임은 회원님에게 있습니다. 호스팅 설명에 반드시 모든 수수료와 요금이 명기되어 있어야 하며 쉬어가 플랫폼 외부에서 추가 수수료나 요금을 수금할 수 없습니다. 게스트에게 제3자 계정을 만들도록 하거나, 외부 플랫폼에 후기를 작성하게 하거나, 연락처 정보를 요청하거나, 쉬어가 플랫폼 외부에서 다른 조치를 취하도록 유도하는 등의 행위를 해서는 안됩니다.

팀 호스팅
공동 호스트와 함께, 또는 팀, 기업 및 기타 조직의 일원으로 호스팅하는 경우, 호스트 서비스 제공에 참여하는 주체와 각 개인은 본 약관에 따라 호스트로서의 책임을 집니다. 본 약관을 수락하거나 계약을 체결하는 경우, 회원님은 본인이 소속된 팀, 기업 또는 조직을 대표해 계약을 체결하고 팀, 기업 또는 조직을 기속할 권한이 있으며, 회원님이 이용하시는 각 주체는 설립된 장소의 법규에 의거 양호한 상태임을 진술하고 보증합니다. 단 책임은 회원 본인에게 있습니다.

취소 및 환불
일반적으로 게스트가 예약을 취소하면, 해당 예약에 적용되는 환불 정책에 따라 환불 금액이 결정됩니다. 쉬어가의 정상참작이 가능한 상황 정책 또는 관련 법규에 따른 정당한 이유가 있는 경우가 아닌 한, 호스트는 게스트의 예약을 취소해서는 안 됩니다. 정당한 이유 없이 게스트의 예약을 취소하면 취소 수수료와 기타 불이익이 부과될 수 있습니다.

예약 변경
게스트와 호스트가 쉬어가 플랫폼을 통해 또는 쉬어가 고객 서비스가 당사자를 대신해 직접 예약을 변경하도록 동의한 경우, 게스트와 호스트는 해당 예약에 대해 책임을 지며 예약 변경으로 인해 발생하는 추가 금액, 수수료 또는 세금을 지불하는 데 동의합니다.</textarea>
          </div>
          <label
            ><input
              class="cb-reg2-pass"
              name="accept"
              type="checkbox"
              value="pass"
              onchange="validate3()"
            />해당사실이 없습니다.</label
          >
          <label
            ><input
              class="cb-reg2-nonpass"
              name="accept"
              type="checkbox"
              value="nonpass"
              onchange="validate4()"
            />해당사실이 있습니다.</label
          >
        </div>

        <div class="companyRule">
          <h3>
            쉬어家의 정책에 의거하여 답변사항이 거짓일 경우 호스팅 자격이 취소
            될 수 있습니다.
          </h3>
          <label
            ><input
              class="cb-reg3-pass"
              type="checkbox"
              name="accept"
              value="pass"
              onchange="validate5()"
            />동의합니다.</label
          >
          <label
            ><input
              class="cb-reg3-nonpass"
              type="checkbox"
              name="accept"
              value="nonpass"
              onchange="validate6()"
            />동의하지않습니다 .</label
          >
        </div>
        <div>
          <span>모두 확인하셨다면 아래의 버튼을 클릭해주세요.</span>
        </div>
        <button class="agreeBtn" onclick="agreeBtn1()">동의합니다.</button>
        <h5 class="warnMsg"></h5>
      </div>
    </div>
</body>
<script type="text/javascript" src="/resources/js/hostRegulation.js"></script>
</html>