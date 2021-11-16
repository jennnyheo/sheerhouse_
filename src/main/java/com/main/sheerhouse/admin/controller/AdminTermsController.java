package com.main.sheerhouse.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.main.sheerhouse.admin.domain.NoticeVO;
import com.main.sheerhouse.admin.domain.TermVO;
import com.main.sheerhouse.admin.service.TermService;

@Controller
public class AdminTermsController {
   
   @Autowired
   TermService service;
   
   @GetMapping("/terms.mdo")
   public String selectTerms(TermVO vo, Model model){
      List<TermVO> list = service.selectTerms(vo);
      System.out.println(list.toString());
      model.addAttribute("termsList", list);
      return "admin/tables/terms";
   }
   
   @GetMapping("/termsInsert.mdo")
   public String insertTermsForm () {
      return "admin/tables/termsInsert";
   }
   
   @PostMapping("/termsInsert.mdo")
   public String insertTerms(TermVO vo) {
      service.insertTerms(vo);
      return "redirect:/terms.mdo";
   }
   
   @GetMapping("/termsDetails.mdo")
   public String termsDetails (int term_num, Model model) {
      System.out.println(term_num);
      List<TermVO> vo = service.getTerms(term_num);
      model.addAttribute("terms", vo);
      return "admin/tables/termsDetails";
   }

}