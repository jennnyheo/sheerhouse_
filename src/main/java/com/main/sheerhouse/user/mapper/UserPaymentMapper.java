package com.main.sheerhouse.user.mapper;

import org.apache.ibatis.annotations.Param;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.user.domain.ReservationVO;

public interface UserPaymentMapper {

	public void insertHomeReservation(@Param("res")ReservationVO res, @Param("title") String title, @Param("hostEmail") String hostEmail);
	public HomeVO selectHome(int home_seq);
	public void updateUnsusedDate(@Param("unused") String unused, @Param("home_seq") int home_seq);
	public void insertSetHistory(ReservationVO res);
}
