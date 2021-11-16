package com.main.sheerhouse.admin.service;

import java.util.List;

import com.main.sheerhouse.host.domain.HomeVO;



public interface AdminHomeService {
	
	public List<HomeVO> homeListAll();

	void updateStopStatus(HomeVO vo);

	void updateCancleStatus(HomeVO vo);

}
