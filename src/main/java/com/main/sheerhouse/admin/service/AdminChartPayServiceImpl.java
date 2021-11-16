package com.main.sheerhouse.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.admin.domain.ChartPayVO;
import com.main.sheerhouse.admin.mapper.AdminChartMapper;


@Service("payChartService")
public class AdminChartPayServiceImpl implements AdminChartPayService {

	@Autowired
	private AdminChartMapper mapper;
	
	@Override
	public List<ChartPayVO> totalPay() {
		System.out.println("[Service] totalPay :전체 결제내역(정가)를 조회합니다.");
		System.out.println("조회 테이블:reservation / apply_num, total_price 조회");
		
		List<ChartPayVO> list = mapper.totalPay();
		
		return list;
	}

	@Override
	public List<ChartPayVO> totalPayMonth() {
		System.out.println("[Service] totalPay : 월별 결제내역(정가)를 조회합니다.");
		System.out.println("조회 테이블: reservation / apply_num, pay_date, total_price 조회");
		
		List<ChartPayVO> list = mapper.totalPayMonth();
		
		return list;
	}

	@Override
	public List<ChartPayVO> paidRevenue() {
		System.out.println("[Service] paidRevenue : 예약 테이블 paid 컬럼 + 결제 테이블 true 컬럼에 해당하는 값을 조회합니다.");
		System.out.println("조회 테이블: reservation + settelment_history / total_price, apply_num");
		
		List<ChartPayVO> list = mapper.paidRevenue();
		List<ChartPayVO> actualList = mapper.paidRevenue();
		
		for (int i = 0; i < list.size(); i++)
		{
			
			int sales = list.get(i).getTotal_price();
			int revenue = (int) (sales * 0.15);
			
			System.out.println("sales: " + sales);
			System.out.println("revenues: " + revenue);
			
			list.get(i).setTotal_price(revenue);
		}
		
		System.out.println("[Serivce] Acutal List: " + list.toString());
		
		return list;
	}

	@Override
	public List<ChartPayVO> paidRevenueMonth() {
		
		List<ChartPayVO> list = mapper.paidRevenueMonth();
		
		for (int i = 0; i < list.size(); i++)
		{
			
			int sales = list.get(i).getTotal_price();
			int revenue = (int) (sales * 0.15);
			
			System.out.println("sales: " + sales);
			System.out.println("revenues: " + revenue);
			
			list.get(i).setTotal_price(revenue);
		}
		
		return list;
	}

}
