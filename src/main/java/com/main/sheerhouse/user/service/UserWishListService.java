package com.main.sheerhouse.user.service;

import java.util.List;

import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.WishListVO;

public interface UserWishListService {

	public String wishlist(WishListVO wish);

	public List<Integer> selectUserWishlist(String email);

}
