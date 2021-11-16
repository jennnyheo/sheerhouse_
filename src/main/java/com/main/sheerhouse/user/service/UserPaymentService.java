package com.main.sheerhouse.user.service;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.user.domain.ReservationVO;

public interface UserPaymentService {

	public void insertHomeReservation(ReservationVO res, String title, String hostEmail);
	public HomeVO selectHome(String home_seq);
	public void updateUnusedDate(String unused, String home_seq);
	public void insertSetHistory(ReservationVO res);
}
