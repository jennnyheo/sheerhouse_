package com.main.sheerhouse.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.sheerhouse.user.domain.WishListVO;
import com.main.sheerhouse.user.service.UserWishListService;

@Controller
public class UserAddWishListController {
	
	@Autowired
	UserWishListService service;
	
	
	@ResponseBody
	@GetMapping("search/wishlist.do")
	public String addToWishList(WishListVO wish) {
		String result = service.wishlist(wish) ;
		return result;	
	}

}
