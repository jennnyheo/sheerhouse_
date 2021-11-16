package com.main.sheerhouse.user.service;

import javax.servlet.http.HttpServletResponse;

import com.main.sheerhouse.user.domain.UserVO;

public interface UserLoginService {

	public boolean emailCheck(String email);
	public int getUserStatus(String email);
	public void updateStatus(String email);
	public void insertUser(UserVO user);
	public boolean passwordCheck(UserVO user);
	public boolean passwordUpdate(UserVO user);
	
	public UserVO selectUserInfo(UserVO user);
	public void logout(HttpServletResponse response) throws Exception;
	public void updateHostStatus(String email);
}
