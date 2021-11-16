package com.main.sheerhouse.admin.mapper;

import java.util.List;

import com.main.sheerhouse.admin.domain.TermVO;

public interface AdminTermsMapper {

   public List<TermVO> selectTerms(TermVO vo);
   
   public void insertTerms(TermVO vo);
   
   public List<TermVO> getTerms(int term_num);

   public List<TermVO> selectguestterm(TermVO guestterm);

   public List<TermVO> selecthostterm(TermVO hostterm);

   public List<TermVO> selectbasicterm(TermVO basicterm);
}