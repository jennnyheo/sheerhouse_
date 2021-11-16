package com.main.sheerhouse.user.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.SearchVO;
import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.service.UserSearchService;
import com.main.sheerhouse.user.service.UserWishListService;

//searchResult CONTROLLER
@Controller
public class SearchResultController {
	
	@Autowired
	private UserSearchService service;
	
	@Autowired
	private UserWishListService wishService;
	
	@GetMapping("/searchResult.do")
	public String searchResult(Model model, @RequestParam("searchLocation") String location, @RequestParam("searchCheckin") String checkin, 
			@RequestParam("searchCheckout") String checkout, @RequestParam("searchMaxPeople") String people, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		UserVO user = (UserVO)session.getAttribute("user");
		
		if(user != null) {
			model.addAttribute("wishlist", wishService.selectUserWishlist(user.getEmail()));
			System.out.println(wishService.selectUserWishlist(user.getEmail()).toString());	

		}

		SearchVO search = new SearchVO();
		search.setLocation(location);
		search.setCheckin(checkin);
		search.setCheckout(checkout);
		search.setPeople(people);
		
		model.addAttribute("search", search);
		model.addAttribute("resultList", service.searchResultList(search));
		
		return "search/searchResult";
	}
	
	@RequestMapping("/searchResultDetail.do")
	public String resultDatail(Model model, @RequestParam("home_seq") String home_seq, @RequestParam(value="searchLocation", required = false) String location, @RequestParam(value="searchCheckin", required = false) String checkin, 
			@RequestParam(value="searchCheckout", required = false) String checkout, @RequestParam(value="searchMaxPeople", required = false) String people, HttpServletRequest request) {
		HttpSession session = request.getSession(); 
		SearchVO search = new SearchVO();
		search.setLocation(location);
		search.setCheckin(checkin);
		search.setCheckout(checkout);
		search.setPeople(people);
		
		System.out.println(search.toString());
		
		UserVO user = (UserVO)session.getAttribute("user");
		if(user != null) {
			model.addAttribute("wishlist", wishService.selectUserWishlist(user.getEmail()));

		}
		
		List<HomeVO> home = new ArrayList<HomeVO>();
		home.add(service.searchDetailList(home_seq));
		System.out.println(home.toString());
		List<CommentVO> comments = service.getCommentList(home_seq);
		model.addAttribute("DetailInfo", home);
		model.addAttribute("hostEmail", service.searchHostEmail(home_seq));
		model.addAttribute("CommentInfo", comments);
		model.addAttribute("commentCnt", comments.size());
		model.addAttribute("hostEmail", service.searchHostEmail(home_seq));
		model.addAttribute("search", search);
		return "search/searchResultDetail";
	}
}