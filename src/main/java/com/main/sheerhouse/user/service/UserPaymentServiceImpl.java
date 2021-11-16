package com.main.sheerhouse.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.user.domain.ReservationVO;
import com.main.sheerhouse.user.mapper.UserPaymentMapper;

@Service
public class UserPaymentServiceImpl implements UserPaymentService{

	@Autowired
	private UserPaymentMapper mapper;
	
	@Override
	public void insertHomeReservation(ReservationVO res, String title, String hostEmail) {
		res.setRes_date(res.getRes_date().substring(1, res.getRes_date().length()-1));
		System.out.println("예약날짜: " + res.getRes_date());
		mapper.insertHomeReservation(res, title, hostEmail);
	}

	@Override
	public HomeVO selectHome(String home_seq) {
		
		return mapper.selectHome(Integer.parseInt(home_seq));
	}

	@Override
	public void updateUnusedDate(String unused, String home_seq) {
		unused = unused.replace(" ", "");
		
		unused = unused.substring(1, unused.length()-1);
		System.out.println(unused);
		mapper.updateUnsusedDate(unused, Integer.parseInt(home_seq));
	}

	@Override
	public void insertSetHistory(ReservationVO res) {
		mapper.insertSetHistory(res);
		
	}
	
	
	
}
