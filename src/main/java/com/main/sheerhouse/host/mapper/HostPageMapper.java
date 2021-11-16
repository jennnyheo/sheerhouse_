package com.main.sheerhouse.host.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.host.domain.HostReservationInfoVO;
import com.main.sheerhouse.host.domain.HostVO;
import com.main.sheerhouse.host.domain.SettlementCalcVO;
import com.main.sheerhouse.host.domain.SettlementHistotyVO;

public interface HostPageMapper {
	public void hostUpdate(HostVO host);
	
	public List<HomeVO> selectHome(HostVO host);
	public HomeVO getHome(int home_seq);
	
	public List<HostReservationInfoVO> selectResInfo(int host_seq);
	
	public List<HostReservationInfoVO> selectHisInfo(int host_seq);
	
	public void updateHostAccountUrl(@Param("path") String path, @Param("host_seq") int host_seq);
	
	public List<SettlementHistotyVO> selectSetList(@Param("keyword")String keyword, 
													@Param("host_seq") int host_seq);
	public List<SettlementCalcVO> selectSetCalc (int host_seq);
	public List<SettlementCalcVO> selectResCalc (int host_seq);
	
	public void updateHome(HomeVO home);
}
