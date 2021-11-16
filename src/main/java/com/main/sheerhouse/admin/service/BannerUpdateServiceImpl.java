package com.main.sheerhouse.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.admin.mapper.AdminBannerMapper;

@Service("updateService")
public class BannerUpdateServiceImpl implements BannerUpdateService {

	@Autowired
	private AdminBannerMapper mapper;
	
	@Override
	public void ableBanner(String bannerNum) {
		System.out.println("[Service] 가지고온 배너 번호를 공개로 만들어주기.");
		mapper.ableBanner(bannerNum);
	}

	@Override
	public void disableBanner(String bannerNum) {
		System.out.println("[Service] 가지고 온 배너 번호를 비공개로 만들어주기.");
		mapper.disableBanner(bannerNum);
	}

}
