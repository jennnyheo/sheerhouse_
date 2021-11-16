package com.main.sheerhouse.commons;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class ImportAPI {
	//토큰 받는 메서드
		public static String getToken() throws Exception {
	        String api_key = "5558421064314735"; // REST API KEY
	        String api_secret_key = "fbf8ac9c8dcc78c8927d783d21135fbcd9b7d311c90080418cc43a3fd198800f7b8bcdb5d93c2a2b"; // REST API SECRET
	        
	        String params = "&imp_key=" + api_key + "&imp_secret=" + api_secret_key;
	        String header = "Bearer " + params; 
	        
			String api_url = "https://api.iamport.kr/users/getToken";
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
			
	        if(responseCode==200) { // 정상 호출
	            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	        } else {  // 에러 발생
	            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	        }
	        String inputLine;
	        StringBuffer response = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	            response.append(inputLine);
	        }
	        br.close();
	        System.out.println(response.toString());
	        
	        // Json 파서
	        JSONParser jsonParse = new JSONParser();
	        JSONObject jsonObj1 = (JSONObject) jsonParse.parse(response.toString());
	        JSONObject jsonObj2 = (JSONObject) jsonObj1.get("response");
	        String access_token = (String) jsonObj2.get("access_token");
	        System.out.println(access_token);
	        return access_token;
		}

}
