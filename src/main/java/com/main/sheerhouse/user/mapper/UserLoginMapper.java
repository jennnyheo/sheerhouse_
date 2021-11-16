package com.main.sheerhouse.user.mapper;

import com.main.sheerhouse.user.domain.UserVO;


public interface UserLoginMapper {


	public UserVO emailCheck(String email);

	public void insertUser(UserVO user);

	public String passwordCheck(UserVO user);
	
	public int passwordUpdate(UserVO user);
	
	public UserVO selectUserInfo(UserVO user);
	
	public int getUserStatus(String email);
	
	public void updateStatus(String email);
	public void updateHostStatus(String email);
}