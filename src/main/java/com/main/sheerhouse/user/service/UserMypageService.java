package com.main.sheerhouse.user.service;

import java.util.List;

import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.PayInfoVO;
import com.main.sheerhouse.user.domain.ReservationInfoVO;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.UserVO;

public interface UserMypageService {
	
	public void userUpdate(UserVO user);
	public boolean passwordCheck(UserVO user);
	public UserVO selectUserInfo(UserVO user);
	
	public List<ResultVO> showWishLists(String email);
	public List<ReservationInfoVO> showReservationInfo(String email);
	
	public ReservationInfoVO reservationDetail(int apply_num);
	
	public String insertComment(CommentVO comment);
	public String deleteComment(CommentVO comment);

	public void setStatus(String email);
	public void setHostStatus(String email);
	public List<PayInfoVO> selectPayInfo(String email);
	public List<PayInfoVO> selectKeyPayInfo(String keyword, String email);
	public void refundApply(int apply_num, String cancel_reason);
	public void deleteSettlement(int apply_num);

}
