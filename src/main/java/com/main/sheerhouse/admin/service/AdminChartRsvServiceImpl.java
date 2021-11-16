package com.main.sheerhouse.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.admin.mapper.AdminChartMapper;

@Service("rsvChartService")
public class AdminChartRsvServiceImpl implements AdminChartRsvService {

	@Autowired
	private AdminChartMapper mapper;
	
	@Override
	public int cntRsvAll() {
		System.out.println("[Service] cntRsvAll : 전체 예약수를 카운트로 조회합니다.");
		int all = mapper.cntRsvAll();
		System.out.println("[Service] 검색된 결과: " + all);
		return all;
	}

	@Override
	public int cntRsvSuccess() {
		System.out.println("[Service] cntRsvSuccess : paid 된 예약을 카운트로 조회합니다.");
		int paid = mapper.cntRsvSuccess();
		System.out.println("[Service] 검색된 결과 : " + paid);
		return paid;
	}

	@Override
	public int cntRsvFailed() {
		System.out.println("[Service] cntRsvFailed : Failed 된 예약을 카운트로 조회합니다.");
		int failed = mapper.cntRsvSuccess();
		System.out.println("[Service] 검색된 결과 : " + failed);
		return failed;
	}
	
	
	@Override
	public int cntRsvStay() {
		System.out.println("[Service] cntRsvStay : Stay 된 예약을 카운트로 조회합니다.");
		int stay = mapper.cntRsvStay();
		System.out.println("[Service] 검색된 결과 : " + stay);
		return stay;
	}
	
	
	public List<Double> result()
	{
		System.out.println("[Serivce] all, paid, stay ,failed 된 예약수를 조회합니다.");
		
		List<Double> result = new ArrayList<Double>();
		
		double all = (double) mapper.cntRsvAll();
		int paid = mapper.cntRsvSuccess();
		int failed = mapper.cntRsvFailed();
		int stay = mapper.cntRsvStay();
		
		System.out.println("-----------------------------");
		System.out.println("[Service] 조회된 값은" + all + " " + paid + " "+ stay + " " + failed);
		System.out.println("-----------------------------");
		
		double positive = (double)(paid/all)*100;
		double negative = (double)((failed + stay)/all)*100;
		
		System.out.println("[Serivce] 예약 성공비율: " + positive);
		System.out.println("[Serivce] 예약 실패비율: " + negative);
		
		result.add(positive);
		result.add(negative);
		
		System.out.println("[Service] result To string: " + result.toString());
		
		return result;
	}

}
