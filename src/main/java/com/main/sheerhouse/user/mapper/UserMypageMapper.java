package com.main.sheerhouse.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.PayInfoVO;
import com.main.sheerhouse.user.domain.ReservationInfoVO;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.domain.WishListVO;

public interface UserMypageMapper {
	public void userUpdate(UserVO user);
	
	public List<ResultVO> showWishLists(String email);
	public List<ReservationInfoVO> showReservationInfo(String email);
	public ReservationInfoVO showReservationDetail(int apply_num);
	
	public void insertComment(CommentVO comment);
	public void deleteComment(CommentVO comment);
	
	public void setStatus(String email);
	public void setHostStatus(String email);
	public List<PayInfoVO> selectPayInfo(String email);
	public List<PayInfoVO> selectKeyPayInfo(@Param("keyword") String keyword, @Param("email") String email);
	public void refundApply(@Param("apply_num") int apply_num, @Param("cancel_reason") String cancel_reason);
	public void deleteSettlement(int apply_num);
}
