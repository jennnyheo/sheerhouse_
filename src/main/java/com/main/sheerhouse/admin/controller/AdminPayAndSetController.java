package com.main.sheerhouse.admin.controller;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.sheerhouse.admin.domain.PayAndSetSearchVO;
import com.main.sheerhouse.admin.domain.PayAndSetVO;
import com.main.sheerhouse.admin.service.AdminPayAndSetService;
import com.main.sheerhouse.admin.util.PagingVO;
import com.main.sheerhouse.commons.ApachePOI;


@Controller
public class AdminPayAndSetController {

	@Autowired
	private AdminPayAndSetService service;
	
	@GetMapping("/payAndSetTable.mdo")
	public String paymentTable(PagingVO vo,Model model
			, @RequestParam(value = "search", required = false) PayAndSetSearchVO search){
		
		System.out.println("get 진입");
		List<PayAndSetVO> list = service.selectListPaging();
			
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		System.out.println("컨트롤러 : " + service.selectListPaging());
		return "admin/tables/payAndSetTable";
	}
	
	@PostMapping("/payAndSetTable.mdo")
	public String paymentPostTable(Model model, PayAndSetSearchVO search ) {
		System.out.println("post 진입");
		List<PayAndSetVO> selectDateList =  service.selectKeywordList(search);
		model.addAttribute("list", selectDateList);		
		model.addAttribute("search", search);
		return "admin/tables/payAndSetTable";
	}
	
	@PostMapping("/setCheckboxApply.mdo")
	public String setCheckboxApply(String applyNum_list) {
		System.out.println("진입");
		String[] apply_list = applyNum_list.split(",");
		service.setCheckApply(apply_list);
		return "redirect:/payAndSetTable.mdo";
	}
	
	@PostMapping("/resCheckboxApply.mdo")
	public String resCheckboxApply(String status_list) {
		System.out.println("진입");
		String[] list = status_list.split(",");
		service.resCheckApply(list);
		return "redirect:/payAndSetTable.mdo";
	}
	
	@GetMapping("/excelSave.mdo")
	public void excelSave(String fileName, String startDate, String endDate, HttpServletResponse response) {
		System.out.println(fileName);
		System.out.println(startDate);
		System.out.println(endDate);
		List<PayAndSetVO> excelData = service.selectExcelData(startDate, endDate);

		ApachePOI.excelDownload(response, fileName, excelData);
		
	}
	
	
}
