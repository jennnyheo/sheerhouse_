package com.main.sheerhouse.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.admin.domain.BannerVO;
import com.main.sheerhouse.admin.mapper.AdminBannerMapper;

@Service("adminBannerServiceImpl")
public class AdminBannerServiceImpl implements AdminBannerService {

	@Autowired
	private AdminBannerMapper mapper;
	
	@Override
	public List<BannerVO> getBannerList() {
		System.out.println("service has called");
		List<BannerVO> list = mapper.getBannerList();
		return list;
	}

}
