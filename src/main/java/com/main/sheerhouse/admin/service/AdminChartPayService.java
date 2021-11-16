package com.main.sheerhouse.admin.service;

import java.util.List;

import com.main.sheerhouse.admin.domain.ChartPayVO;

public interface AdminChartPayService {

	List<ChartPayVO> totalPay();
	
	List<ChartPayVO> totalPayMonth();
	
	List<ChartPayVO> paidRevenue();
	
	List<ChartPayVO> paidRevenueMonth();
	
}
