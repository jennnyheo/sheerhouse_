package com.main.sheerhouse.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.main.sheerhouse.admin.domain.ChartHomeVO;
import com.main.sheerhouse.admin.domain.ChartPayVO;
import com.main.sheerhouse.admin.domain.ChartUserVO;
import com.main.sheerhouse.admin.service.AdminChartHomeService;
import com.main.sheerhouse.admin.service.AdminChartPayService;
import com.main.sheerhouse.admin.service.AdminChartRsvService;
import com.main.sheerhouse.admin.service.AdminChartUserService;

@Controller
public class AdminChartController {

	@Autowired
	private AdminChartUserService userChartService; //신규유저 통계
	
	@Autowired
	private AdminChartPayService payChartService; //매출 통계
	
	@Autowired
	private AdminChartRsvService rsvChartService; //예약 통계
	
	
	
	
	@GetMapping(value="/chart.mdo")
	public String chartCall(Model model)
	{
		System.out.println("[Controller] chart call");
		
		int thisYear = 2021; //조회할 연도
		int thisMonth = 10; //조회할 월

		List<ChartUserVO> list1 = userChartService.getNewUser();
		List<ChartPayVO> list2 = payChartService.totalPay();
		List<ChartPayVO> list3 = payChartService.totalPayMonth();
		List<ChartPayVO> list4 = payChartService.paidRevenue();
		List<Double> list5 = rsvChartService.result();
		List<ChartPayVO> list6 = payChartService.paidRevenueMonth();
				
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list5", list5);
		model.addAttribute("list6", list6);
		
		
		return "admin/tables/chart";
	}
	
	
	
}
