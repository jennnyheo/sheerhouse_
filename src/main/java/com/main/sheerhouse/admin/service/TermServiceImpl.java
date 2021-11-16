package com.main.sheerhouse.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.admin.domain.TermVO;
import com.main.sheerhouse.admin.mapper.AdminTermsMapper;

@Service
public class TermServiceImpl implements TermService{

   @Autowired
   AdminTermsMapper mapper;
   
   @Override
   public List<TermVO> selectTerms(TermVO vo) {
      List<TermVO> list = mapper.selectTerms(vo);
      return list;
   }
   
   @Override
   public void insertTerms(TermVO vo) {
      mapper.insertTerms(vo);
   }
   
   @Override
   public List<TermVO> getTerms(int term_num) {
      return mapper.getTerms(term_num);
   }
   
   @Override
   public List<TermVO> selectguestterm(TermVO term){
      List<TermVO> list = null;
      list = mapper.selectguestterm(term);
      return list;
   }
   
   @Override
   public List<TermVO> selecthostterm(TermVO term) {
      List<TermVO> list = null;
      list = mapper.selecthostterm(term);
      return list;
   }
   
   @Override
   public List<TermVO> selectbasicterm(TermVO term) {
      List<TermVO> list = null;
      list = mapper.selectbasicterm(term);
      return list;
   }
}