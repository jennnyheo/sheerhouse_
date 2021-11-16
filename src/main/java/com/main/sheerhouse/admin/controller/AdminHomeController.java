package com.main.sheerhouse.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.sheerhouse.admin.service.AdminHomeService;
import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.user.domain.UserVO;


@Controller
public class AdminHomeController {
	
	@Autowired
	private AdminHomeService service;
	
	@GetMapping("/homeTable.mdo")
	public String homeTable(Model model) {
		
		List<HomeVO> homeList = new ArrayList<HomeVO>();
		homeList = service.homeListAll();
		model.addAttribute("homeList", homeList);
		return "admin/tables/homeTable";
	}
	
	@RequestMapping(value="homeCheckResult.mdo", method=RequestMethod.GET)
	@ResponseBody
	public String updateStopStatus(HomeVO vo, Model model,
			@RequestParam String homeList, @RequestParam String flag) {
			String[] home_seq = homeList.split(",");
			HomeVO homeVO = null;
			if(flag.equals("stop")) {
				for(String t : home_seq) {
					System.out.println(t);
					homeVO = new HomeVO();
					homeVO.setHome_seq(Integer.parseInt(t));
					service.updateStopStatus(homeVO);
				}

			}else {
				for(String t : home_seq) {
					System.out.println(t);
					homeVO = new HomeVO();
					homeVO.setHome_seq(Integer.parseInt(t));
					service.updateCancleStatus(homeVO);
				}
			}
			
			
	
		
		return "redirect:/homeTable.mdo";
	}

}
