package com.main.sheerhouse.admin.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.main.sheerhouse.admin.domain.BannerVO;

public interface UploadService {

	public void insertUploadImg(BannerVO vo);
	public int getBannerNum();
	public String uploadFile(MultipartHttpServletRequest request, int bannerNum, String url);
	
}
