package com.main.sheerhouse.host.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.host.domain.HostVO;
import com.main.sheerhouse.host.mapper.HostRegistMapper;
import com.main.sheerhouse.user.domain.UserVO;

@Service
public class HostRegistServiceImpl implements HostRegistService{

	@Autowired
	private HostRegistMapper mapper;
	
	@Override
	public void homeRegist(HomeVO home, String email) {
		mapper.homeRegist(home, email);
		System.out.println("숙소등록");
		
	}

	@Override
	public boolean hostCheck(String email) {
		boolean result = false;
		String check = mapper.hostCheck(email);
		
		if(check != null) {
			result = true;
		}
		System.out.println("체크완료");
		return result;
	}

	@Override
	public void userRoleSet(UserVO user) {
		mapper.userRoleSet(user);
		System.out.println("유저 등급 변경");
	}

	@Override
	public void hostRegist(UserVO user) {
		mapper.hostRegist(user);
		System.out.println("호스트 등록");
	}

	@Override
	public HostVO hostSelect(String email) {
		HostVO host = mapper.hostSelect(email);
		System.out.println("호스트 검색");
		return host;
	}


}
