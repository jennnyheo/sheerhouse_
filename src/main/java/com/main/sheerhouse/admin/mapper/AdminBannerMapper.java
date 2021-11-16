package com.main.sheerhouse.admin.mapper;

import java.util.List;

import com.main.sheerhouse.admin.domain.BannerVO;

public interface AdminBannerMapper {

	public List<BannerVO> getBannerList();
	
	//upload method
	public void insertUploadImg(BannerVO vo);
	
	public int getBannerNum();
	
	//update to "able"
	void ableBanner(String bannerNum);
	
	//update to "disable"
	void disableBanner(String bannerNum);
	
}
