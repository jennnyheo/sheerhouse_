package com.main.sheerhouse.host.mapper;

import org.apache.ibatis.annotations.Param;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.host.domain.HostVO;
import com.main.sheerhouse.user.domain.UserVO;

public interface HostRegistMapper {
	
	public void homeRegist(@Param("homes")HomeVO home, @Param("email") String email);
	
	public void userRoleSet(UserVO user);
	
	public void hostRegist(UserVO user);
	
	public HostVO hostSelect(String email);
	
	public String hostCheck(String email);
}
