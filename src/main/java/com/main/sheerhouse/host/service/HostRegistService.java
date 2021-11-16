package com.main.sheerhouse.host.service;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.host.domain.HostVO;
import com.main.sheerhouse.user.domain.UserVO;

public interface HostRegistService {

	public void homeRegist(HomeVO home, String email);
	
	public void userRoleSet(UserVO user);
	
	public void hostRegist(UserVO user);
	
	public HostVO hostSelect(String email);
	
	public boolean hostCheck(String email);
	
}
