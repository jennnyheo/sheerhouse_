package com.main.sheerhouse.user.mapper;

import java.util.List;

import com.main.sheerhouse.user.domain.WishListVO;

public interface UserWishListMapper {
	
	public void insertWishList(WishListVO wish);
	
	public void deleteWishlist(WishListVO wish);
	
	public List<Integer> selectUserWishlist(String email);
}
