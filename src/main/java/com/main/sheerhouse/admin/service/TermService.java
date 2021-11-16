package com.main.sheerhouse.admin.service;

import java.util.List;

import com.main.sheerhouse.admin.domain.TermVO;

public interface TermService {

	public List<TermVO> selectTerms(TermVO vo);

	public void insertTerms(TermVO vo);

	public List<TermVO> getTerms(int term_num);

	public List<TermVO> selectguestterm(TermVO term);

	public List<TermVO> selecthostterm(TermVO term);

	public List<TermVO> selectbasicterm(TermVO term);

}