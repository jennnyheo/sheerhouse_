package com.main.sheerhouse.host.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.host.domain.HostReservationInfoVO;
import com.main.sheerhouse.host.domain.HostVO;
import com.main.sheerhouse.host.domain.SettlementCalcVO;
import com.main.sheerhouse.host.domain.SettlementHistotyVO;
import com.main.sheerhouse.host.mapper.HostPageMapper;

@Service
public class HostPageServiceImpl implements HostPageService{

	@Autowired
	private HostPageMapper mapper;

	@Override
	public void hostUpdate(HostVO host) {

		mapper.hostUpdate(host);
	}

	@Override
	public List<HomeVO> selectHome(HostVO host) {
		List<HomeVO> homeList = mapper.selectHome(host);

		return homeList;
	}

	@Override
	public List<HostReservationInfoVO> selectResInfo(int host_seq) {

		return mapper.selectResInfo(host_seq);
	}

	@Override
	public List<HostReservationInfoVO> selectHisInfo(int host_seq) {

		return mapper.selectHisInfo(host_seq);
	}

	@Override
	public void updateHostAccountUrl(String path, int host_seq) {
		mapper.updateHostAccountUrl(path, host_seq);
	}

	@Override
	public List<SettlementHistotyVO> selectSetList(String keyword, int host_seq) {
		return mapper.selectSetList(keyword, host_seq);
	}

	@Override
	public SettlementCalcVO setCalc(int host_seq) {
		SimpleDateFormat sdf = new SimpleDateFormat( "yy-MM-dd" , Locale.KOREA );
		
		SettlementCalcVO cal = new SettlementCalcVO();	
		List<SettlementCalcVO> setList = mapper.selectSetCalc(host_seq);
		int totalPrice = 0;
		int setPrice = 0;
		int unsetPrice = 0;
		
		String[][] chart = {{"Month", "수입", "예약률"},{"1월","0","0.0"},{"2월","0","0.0"},{"3월","0","0.0"}
						    ,{"4월","0","0.0"},{"5월","0","0.0"},{"6월","0","0.0"}
							,{"7월","0","0.0"},{"8월","0","0.0"},{"9월","0","0.0"}
							,{"10월","0","0.0"},{"11월","0","0.0"},{"12월","0","0.0"}};
		if(setList.isEmpty()) {
			System.out.println("setList없음");
			cal.setChartData(chart);
			return cal;
		}
		
		for (SettlementCalcVO set: setList) {
			totalPrice += set.getSet_price();
			
			if(set.getStatus().equals("true")) {//정산완료
				setPrice += set.getSet_price();
				String date = sdf.format(new Date(set.getUpdate_date().getTime()));
				String[] pay = date.split("-");
				switch (pay[1]) {
				case "01": 
					int p1 = Integer.parseInt(chart[1][1]); 
					chart[1][1] = String.valueOf( p1 += set.getSet_price());	
					break;
				case "02":
					int p2 = Integer.parseInt(chart[2][1]); 
					chart[2][1] = String.valueOf( p2 += set.getSet_price());	
					break;
				case "03":
					int p3 = Integer.parseInt(chart[3][1]); 
					chart[3][1] = String.valueOf( p3 += set.getSet_price());	
					break;
				case "04":
					int p4 = Integer.parseInt(chart[4][1]); 
					chart[4][1] = String.valueOf( p4 += set.getSet_price());	
					break;
				case "05":
					int p5 = Integer.parseInt(chart[5][1]); 
					chart[5][1] = String.valueOf( p5 += set.getSet_price());	
					break;
				case "06":
					int p6 = Integer.parseInt(chart[6][1]); 
					chart[6][1] = String.valueOf( p6 += set.getSet_price());	
					break;
				case "07":
					int p7 = Integer.parseInt(chart[7][1]); 
					chart[7][1] = String.valueOf( p7 += set.getSet_price());	
					break;
				case "08":
					int p8 = Integer.parseInt(chart[8][1]); 
					chart[8][1] = String.valueOf( p8 += set.getSet_price());	
					break;
				case "09":
					int p9 = Integer.parseInt(chart[9][1]); 
					chart[9][1] = String.valueOf( p9 += set.getSet_price());	
					break;
				case "10":
					int p10 = Integer.parseInt(chart[10][1]); 
					chart[10][1] = String.valueOf( p10 += set.getSet_price());	
					break;
				case "11":
					int p11 = Integer.parseInt(chart[11][1]); 
					chart[11][1] = String.valueOf( p11 += set.getSet_price());	
					break;
				default:
					int p12 = Integer.parseInt(chart[12][1]); 
					chart[12][1] = String.valueOf( p12 += set.getSet_price());	
					break;
				}
			}else {//정산 안된것..
				unsetPrice += set.getSet_price();
			}
			
			
			// 해당 월의 정산금액 = status true, update_date의 월 추출, 배열에 저장 
			// 해당 월의 예약완료율 = res_status paid, res_date의 마지막 날짜 월 추출, 배열에 저장

			cal.setTotal_price(totalPrice);
			cal.setSet_price(setPrice);
			cal.setUnset_price(unsetPrice);

			cal.setChartData(chart);
			System.out.println("서비스 set: "+ cal.toString());
		}
		return cal;
	}

	@Override
	public SettlementCalcVO resCalc(int host_seq) {
		DecimalFormat frmt = new DecimalFormat();
		SettlementCalcVO cal = new SettlementCalcVO();
		List<SettlementCalcVO> resList = mapper.selectResCalc(host_seq);
		System.out.println("resList: " + resList.toString());
		int resTotalCount = 0;
		int resPaidCount = 0;
		int resFailedCount = 0; 
		int[] rPaidCount = new int[12];
		int[] rFailedCount = new int[12];
		String[][] chart = {{"1월","0","0.0"},{"2월","0","0.0"},{"3월","0","0.0"}
		,{"4월","0","0.0"},{"5월","0","0.0"},{"6월","0","0.0"}
		,{"7월","0","0.0"},{"8월","0","0.0"},{"9월","0","0.0"}
		,{"10월","0","0.0"},{"11월","0","0.0"},{"12월","0","0.0"}};
		if(resList.isEmpty()) {
			cal.setChartData(chart);
			return cal;
		}
		for (SettlementCalcVO res: resList) {
			resTotalCount +=1;
		if(res.getRes_status().equals("paid")) {//결제 완료
			resPaidCount+=1;
			String[] pRes = res.getRes_date().split(",");
			String[] rD = pRes[pRes.length-1].split("-");

			switch (rD[1]) {
			case "01":
				rPaidCount[0] = rPaidCount[0] +=1;break;
			case "02":
				rPaidCount[1] = rPaidCount[1] +=1;break;
			case "03":
				rPaidCount[2] = rPaidCount[2] +=1;break;
			case "04":
				rPaidCount[3] = rPaidCount[3] +=1;break;
			case "05":
				rPaidCount[4] = rPaidCount[4] +=1;break;
			case "06":
				rPaidCount[5] = rPaidCount[5] +=1;break;
			case "07":
				rPaidCount[6] = rPaidCount[6] +=1;break;
			case "08":
				rPaidCount[7] = rPaidCount[7] +=1;break;
			case "09":
				rPaidCount[8] = rPaidCount[8] +=1;break;
			case "10":
				rPaidCount[9] = rPaidCount[9] +=1;break;
			case "11":
				rPaidCount[10] = rPaidCount[10] +=1;break;
			default:
				rPaidCount[11] = rPaidCount[11] +=1;break;
			}
		}else { //결제 취소
			resFailedCount+=1;
			String[] fRes = res.getRes_date().split(",");
			String[] fD = fRes[fRes.length-1].split("-");

			switch (fD[1]) {
			case "01":
				rFailedCount[0] = rFailedCount[0] += 1; break;
			case "02":rFailedCount[1] = rFailedCount[1] += 1;break;
			case "03":rFailedCount[2] = rFailedCount[2] += 1;break;
			case "04":rFailedCount[3] = rFailedCount[3] += 1;break;
			case "05":rFailedCount[4] = rFailedCount[4] += 1;break;
			case "06":rFailedCount[5] = rFailedCount[5] += 1;break;
			case "07":rFailedCount[6] = rFailedCount[6] += 1;break;
			case "08":rFailedCount[7] = rFailedCount[7] += 1;break;
			case "09":rFailedCount[8] = rFailedCount[8] += 1;break;
			case "10":rFailedCount[9] = rFailedCount[9] += 1;break;
			case "11":rFailedCount[10] = rFailedCount[10] += 1;break;
			default:rFailedCount[11] = rFailedCount[11] += 1;break;
			}
		}
		cal.setRes_total_count(resTotalCount);
		
		
		frmt.setMaximumFractionDigits(2);
		double p_per = (double)resPaidCount/(double)resTotalCount*100.0;
		double f_per = (double)resFailedCount/(double)resTotalCount*100.0;

		cal.setRes_paid_per(Double.parseDouble(frmt.format(p_per)));
		cal.setRes_failed_per(Double.parseDouble(frmt.format(f_per)));


		//완료한 횟수 / 전체 횟수 * 100
		for (int i = 0; i < 12; i++) {
			int count = rPaidCount[i] + rFailedCount[i];
			if(rPaidCount[i] == 0 &&rFailedCount[i]==0) {
				continue;
			}
			chart[i][2] = frmt.format((double)rPaidCount[i] / (double)count * 100.0);
			
		}
			cal.setChartData(chart);
			System.out.println("서비스 res: "+ cal.toString());

		}
		return cal;
	}

	@Override
	public HomeVO getHome(int home_seq) {
		
		return mapper.getHome(home_seq);
	}

	@Override
	public void updateHome(HomeVO home) {
		mapper.updateHome(home);
	}
	
	
	
	
}