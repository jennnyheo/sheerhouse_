package com.main.sheerhouse.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.admin.domain.ChartHomeVO;
import com.main.sheerhouse.admin.mapper.AdminChartMapper;

@Service
public class AdminChartHomeServiceImpl implements AdminChartHomeService {
	
	@Autowired
	private AdminChartMapper mapper;
	
	@Override
	public List<ChartHomeVO> getNewHome(){
		
		List<ChartHomeVO> list = mapper.getNewHome();
		
		return list;
	}

}
