package com.main.sheerhouse.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.admin.domain.ChartUserVO;
import com.main.sheerhouse.admin.mapper.AdminChartMapper;

@Service("userChartService")
public class AdminChartUserServiceImpl implements AdminChartUserService {

	@Autowired
	private AdminChartMapper mapper;
	
	@Override
	public List<ChartUserVO> getNewUser() {
		
//		System.out.println("[Service] getNewUser : " + inputYear + " 년도" + inputMonth + " 월의 신규유저를 검색합니다.");
//		System.out.println("받은 inputYear: " + inputYear);
//		System.out.println("받은 inputMonth: " + inputMonth);
		
		List<ChartUserVO> list = mapper.getNewUser();
		
		return list;
		
	}

}
