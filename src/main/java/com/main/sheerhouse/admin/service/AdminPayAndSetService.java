package com.main.sheerhouse.admin.service;

import java.util.List;

import com.main.sheerhouse.admin.domain.PayAndSetSearchVO;
import com.main.sheerhouse.admin.domain.PayAndSetVO;

public interface AdminPayAndSetService {
	public List<PayAndSetVO> selectList();
	public List<PayAndSetVO> selectKeywordList(PayAndSetSearchVO search);
	public void setCheckApply(String[] num);
	public void resCheckApply(String[] num);
	public List<PayAndSetVO> selectExcelData(String startDate, String endDate);
	public int selectListCount();
	public List<PayAndSetVO> selectListPaging();
}
