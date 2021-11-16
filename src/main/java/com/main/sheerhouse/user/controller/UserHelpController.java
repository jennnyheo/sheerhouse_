package com.main.sheerhouse.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.sheerhouse.admin.domain.NoticeVO;
import com.main.sheerhouse.admin.domain.TermVO;
import com.main.sheerhouse.admin.service.NoticeImpl;
import com.main.sheerhouse.admin.service.TermServiceImpl;
import com.main.sheerhouse.admin.util.PagingVO;
import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.service.UserLoginService;

@Controller
public class UserHelpController {
	@Autowired
	private UserLoginService service;
	
	@Autowired
	NoticeImpl noticeim;

	@Autowired
	private TermServiceImpl termim;
	
	
	@GetMapping("/newsroom.do")
	public String boardList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value = "result", required = false)String result) throws Exception{             

			List<NoticeVO> NoticeList = new ArrayList<NoticeVO>();
			if(result == null) {
				
				int total = noticeim.countNotice();
				if (nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "5";
				} else if (nowPage == null) {
					nowPage = "1";
				} else if (cntPerPage == null) { 
					cntPerPage = "5";
				}
				vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), result);
				model.addAttribute("paging", vo);
				model.addAttribute("Notice", noticeim.selectNoticePage(vo));
				System.out.println(noticeim.selectNoticePage(vo));
			}
			
			return "user/newsroom";
		}
	

	@GetMapping("/newsDetail.do")
	public String newsDetail(@RequestParam("notice_num")int notice_num, Model model) throws Exception{
		model.addAttribute("newsInfo",noticeim.getNotice(notice_num));
		System.out.println("확인");
		return "user/newsDetail";
	}
	

	@GetMapping("/termaccept.do")
	public String termpage(TermVO term, Model model)throws Exception{
		model.addAttribute("basic",termim.selectbasicterm(term));
		model.addAttribute("guest",termim.selectguestterm(term));
		model.addAttribute("host",termim.selecthostterm(term));
		return "user/termaccept";
	}
	
	@GetMapping("/help.do")
	public String helppage() {
		return "/user/help";
	}
	
	@GetMapping("/companyDetail.do")
	public String companypage() {
		return "/user/companyDetail";
	}

}
