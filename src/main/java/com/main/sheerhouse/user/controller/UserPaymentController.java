package com.main.sheerhouse.user.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.sheerhouse.commons.ImportAPI;
import com.main.sheerhouse.commons.StartDateBetweenEndDate;
import com.main.sheerhouse.commons.UnixTimeToString;
import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.user.domain.ReservationVO;
import com.main.sheerhouse.user.service.UserPaymentService;

@Controller
public class UserPaymentController {

	@Autowired
	private UserPaymentService service;

	//결제 수행 메서드
	@ResponseBody
	@RequestMapping("/verifyPayment.do")
	public boolean verifyPayment(@RequestParam Map<String, String> MapParams) throws Exception{
		
		String token = ImportAPI.getToken();
		String header = "Bearer " + token;
		String params = "&merchant_uid=" + MapParams.get("merchant_uid") + "&amount=" + MapParams.get("amount");
		
		String api_url = "https://api.iamport.kr/payments/prepare";
		URL requestUrl = new URL(api_url);
		
		HttpURLConnection con = (HttpURLConnection)requestUrl.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("Authorization", header);
		con.setDoOutput(true);
		
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		
		wr.writeBytes(params);
		wr.flush();
		wr.close();
		
		int responseCode = con.getResponseCode();
		System.out.println("응답코드 : " + responseCode);
		
		BufferedReader br;
		
		if(responseCode == 200) {//정상호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		}else {//에러발생
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		}
		
		String inputLine;
		StringBuffer response = new StringBuffer();
		
		while((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		
		br.close();
		System.out.println(response.toString());
		
		//json 파서
		JSONParser jsonParse = new JSONParser();
        JSONObject jsonObj1 = (JSONObject) jsonParse.parse(response.toString());
        JSONObject jsonObj2 = (JSONObject) jsonObj1.get("response");
        String amount = jsonObj2.get("amount").toString();
		
        //응답받은 금액과 요청한 금액 검증
        if(MapParams.get("amount").equals(amount)) {
        	return true;	
        }else {
        	return false;
        }
	}
	
	
	//결제정보 예약 테이블에 insert
	@PostMapping("/insertHomePayInfo.do")
	public String paymentInfo(ReservationVO res, String title, String hostEmail, String checkin, String checkout, String home_seq) {

		List<String> date = StartDateBetweenEndDate.getStartAndEnd(checkin, checkout);
		String payTime = UnixTimeToString.getTimestampToDate(res.getPay_date());
		res.setPay_date(payTime);
		res.setRes_date(date.toString().replace(" ",""));
		service.insertHomeReservation(res, title, hostEmail);
		HomeVO home = service.selectHome(home_seq);
	    service.insertSetHistory(res);
		String[] unused = home.getUnused_date().split(",");
		for (int i = 0; i < unused.length;i++) {
			if(unused[i].equals("")) {
				continue;
			}else if(!date.contains(unused[i])) {
				date.add(unused[i]);
			}
		}
		service.updateUnusedDate(date.toString(), home_seq);
		
		return "user/mypage";
	}
}
