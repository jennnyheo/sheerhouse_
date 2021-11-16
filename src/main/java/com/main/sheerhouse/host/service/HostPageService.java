package com.main.sheerhouse.host.service;

import java.util.List;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.host.domain.HostReservationInfoVO;
import com.main.sheerhouse.host.domain.HostVO;
import com.main.sheerhouse.host.domain.SettlementCalcVO;
import com.main.sheerhouse.host.domain.SettlementHistotyVO;

public interface HostPageService {
	
	public void hostUpdate(HostVO host);
	
	public List<HomeVO> selectHome(HostVO host);
	
	public List<HostReservationInfoVO> selectResInfo(int host_seq);
	
	public List<HostReservationInfoVO> selectHisInfo(int host_seq);
	
	public void updateHostAccountUrl(String path, int host_seq);
	
	public List<SettlementHistotyVO> selectSetList(String keyword, int host_seq);
	
	public SettlementCalcVO setCalc(int host_seq);
	
	public SettlementCalcVO resCalc (int host_seq);
	
	public HomeVO getHome(int home_seq);
	
	public void updateHome(HomeVO home);
}
