package com.main.sheerhouse.admin.mapper;

import java.util.List;

import com.main.sheerhouse.host.domain.HomeVO;

public interface AdminHomeMapper {
	
	public List<HomeVO> homeListAll();

	public void updateStopStatus(HomeVO vo);

	public void updateCancleStatus(HomeVO vo);
	

}
