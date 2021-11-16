package com.main.sheerhouse.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.main.sheerhouse.admin.domain.PayAndSetSearchVO;
import com.main.sheerhouse.admin.domain.PayAndSetVO;

public interface AdminPayAndSetMapper {
	public List<PayAndSetVO> selectList();
	public List<PayAndSetVO> selectKeywordList(PayAndSetSearchVO search);
	public void setCheckApply(@Param("array") String[] num);
	public void resCheckApply(@Param("array") String[] list);
	public List<PayAndSetVO> selectExcelData(@Param("startDate")String startDate, @Param("endDate") String endDate);
	public int selectListCount();
	public List<PayAndSetVO> selectListPaging();

}
