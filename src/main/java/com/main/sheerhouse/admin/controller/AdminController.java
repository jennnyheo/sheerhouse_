package com.main.sheerhouse.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.main.sheerhouse.admin.domain.ChartHomeVO;
import com.main.sheerhouse.admin.domain.NoticeVO;
import com.main.sheerhouse.admin.service.AdminChartHomeService;
import com.main.sheerhouse.admin.service.NoticeImpl;



@Controller
public class AdminController {
	
	@Autowired
	NoticeImpl noticeim;
	
	@Autowired
	private AdminChartHomeService homeChartService;//숙소 통계
	
	@GetMapping("/login.mdo")
	public String login() {
		return "admin/login";
	}
	
	@GetMapping("/index.mdo")
	public String index(NoticeVO vo, Model model) {
		List<NoticeVO> list = noticeim.selectNoticeIndex(vo);
		List<ChartHomeVO> list2 = homeChartService.getNewHome();
		model.addAttribute("noticeList", list);
		model.addAttribute("list1", list2); 
		return "admin/index";
	}
	
	@GetMapping("/notice.mdo")
	public String selectnotice(NoticeVO notice, Model model){
		List<NoticeVO> list = noticeim.selectNotice(notice);
		model.addAttribute("noticeList", list);
		return "admin/tables/notice";
	}
	
	@GetMapping("/noticeInsert.mdo")
	public String insertNoticeForm () {
		return "admin/tables/noticeInsert";
	}
	
	@PostMapping("/noticeInsert.mdo")
	public String insertNotice(NoticeVO vo) {
		noticeim.insertNotice(vo);
		return "redirect:/notice.mdo";
	}
	
	@GetMapping("/noticeUpdate.mdo")
	public String updateNoticeForm (int notice_num, Model model) {
		System.out.println(notice_num);
		NoticeVO notice = noticeim.getNotice(notice_num);
		model.addAttribute("notice", notice);

		return "admin/tables/noticeUpdate";
	}
	
	@PostMapping("/noticeUpdate.mdo")
	public String updateNotice(NoticeVO vo) {
		System.out.println("공지사항: " + vo.toString());

		noticeim.updateNotice(vo);		

		return "redirect:/notice.mdo";
	}
}
