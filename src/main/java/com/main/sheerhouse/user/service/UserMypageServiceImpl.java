package com.main.sheerhouse.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.PayInfoVO;
import com.main.sheerhouse.user.domain.ReservationInfoVO;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.domain.WishListVO;
import com.main.sheerhouse.user.mapper.UserLoginMapper;
import com.main.sheerhouse.user.mapper.UserMypageMapper;

@Service
public class UserMypageServiceImpl implements UserMypageService {

	@Autowired
	private UserMypageMapper mapper;
	
	@Autowired
	private UserLoginMapper logMapper;
	
	@Override
	public void userUpdate(UserVO user) {
		mapper.userUpdate(user);
	}

	@Override
	public UserVO selectUserInfo(UserVO user) {
	
		return logMapper.selectUserInfo(user);
	}

	@Override
	public boolean passwordCheck(UserVO user) {
		boolean result = false;
		String passwordCheck = logMapper.passwordCheck(user);
		if(user.getPassword().equals(passwordCheck)) {
			return true;
		}
		return result;
	}

	@Override
	public List<ResultVO> showWishLists(String email) {
		return mapper.showWishLists(email);
	}

	@Override
	public List<ReservationInfoVO> showReservationInfo(String email) {
		return mapper.showReservationInfo(email);
	}

	@Override
	public ReservationInfoVO reservationDetail(int apply_num) {
		return mapper.showReservationDetail(apply_num);
	}

	@Override
	public String insertComment(CommentVO comment) {
		try {		
			mapper.insertComment(comment);
			System.out.println("inserted");
			return "inserted";
		}catch(DataAccessException e) {
			e.printStackTrace();
			System.out.println("unInserted");
			return "unInserted";
		}
	}

	@Override
	public String deleteComment(CommentVO comment) {
		mapper.deleteComment(comment);
		return "delete";
	}

	@Override
	public void setStatus(String email) {
		mapper.setStatus(email);
	}

	@Override
	public void setHostStatus(String email) {
		mapper.setHostStatus(email);
	}

	@Override
	public List<PayInfoVO> selectPayInfo(String email) {
		return mapper.selectPayInfo(email);
	}

	@Override
	public List<PayInfoVO> selectKeyPayInfo(String keyword, String email) {
		return mapper.selectKeyPayInfo(keyword, email);
	}

	@Override
	public void refundApply(int apply_num, String cancel_reason) {
		mapper.refundApply(apply_num, cancel_reason);
		
	}

	@Override
	public void deleteSettlement(int apply_num) {
		mapper.deleteSettlement(apply_num);
	}
	
	
}
