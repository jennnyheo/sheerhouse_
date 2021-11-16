package com.main.sheerhouse.admin.mapper;

import java.util.List;

import com.main.sheerhouse.admin.domain.ChartHomeVO;
import com.main.sheerhouse.admin.domain.ChartPayVO;
import com.main.sheerhouse.admin.domain.ChartUserVO;

public interface AdminChartMapper {
	
	List<ChartUserVO> getNewUser();
	
	List<ChartPayVO> totalPay();
	
	List<ChartPayVO> totalPayMonth();
	
	List<ChartPayVO> paidRevenue();
	
	List<ChartPayVO> paidRevenueMonth();
	
	int cntRsvAll();
	
	int cntRsvSuccess();
	
	int cntRsvFailed();
	
	int cntRsvStay();
	
	List<ChartHomeVO> getNewHome();

}
