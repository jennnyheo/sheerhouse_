package com.main.sheerhouse.commons;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Component
@PropertySource("classpath:mybatis/config/database.properties")
public class CoolSmsAPI {
	
	@Value("${sms.apiKey}")
	private String api_key;
	@Value("${sms.apiSecret}")
	private String api_secret;
	
	public void certifiedSMS(String tel, String confirmNumber) {

		System.out.println(api_key);
		System.out.println(api_secret);
		Message coolsms = new Message(api_key, api_secret);
		HashMap<String,String> params = new HashMap<String,String>();
		
		params.put("to", tel);
		params.put("from", "01076026663");
		params.put("type", "SMS");
		params.put("text", "[sheerhose] 인증번호 : " + confirmNumber);
		params.put("app_version", "test app 1.2");
		
		try {
			JSONObject obj = (JSONObject)coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			e.printStackTrace();
		}
	}

}
