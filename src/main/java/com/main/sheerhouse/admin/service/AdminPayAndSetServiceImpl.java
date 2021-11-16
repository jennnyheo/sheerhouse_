package com.main.sheerhouse.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.admin.domain.PayAndSetSearchVO;
import com.main.sheerhouse.admin.domain.PayAndSetVO;
import com.main.sheerhouse.admin.mapper.AdminPayAndSetMapper;

@Service
public class AdminPayAndSetServiceImpl implements AdminPayAndSetService{

	@Autowired
	private AdminPayAndSetMapper mapper;
	
	@Override
	public List<PayAndSetVO> selectList() {
		return mapper.selectList();
	}

	@Override
	public List<PayAndSetVO> selectKeywordList(PayAndSetSearchVO search) {
		return mapper.selectKeywordList(search);
	}

	@Override
	public void setCheckApply(String[] num) {
		mapper.setCheckApply(num);
	}

	@Override
	public void resCheckApply(String[] num) {
		mapper.resCheckApply(num);
	}

	@Override
	public List<PayAndSetVO> selectExcelData(String startDate, String endDate) {
		return mapper.selectExcelData(startDate, endDate);

	}
	@Override
	public int selectListCount() {
		return mapper.selectListCount();
	}
	
	@Override
	public List<PayAndSetVO> selectListPaging(){
		return mapper.selectListPaging();
	}

}
