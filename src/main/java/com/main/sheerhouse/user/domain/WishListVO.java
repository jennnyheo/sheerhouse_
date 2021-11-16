package com.main.sheerhouse.user.domain;

public class WishListVO {
	private int home_seq;
	private int act_seq;
	private String email;
	private String status;
	
	@Override
	public String toString() {
		return "WishListVO [home_seq=" + home_seq + ", act_seq=" + act_seq + ", email=" + email + ", status=" + status
				+ "]";
	}
	public int getHome_seq() {
		return home_seq;
	}
	public void setHome_seq(int home_seq) {
		this.home_seq = home_seq;
	}
	public int getAct_seq() {
		return act_seq;
	}
	public void setAct_seq(int act_seq) {
		this.act_seq = act_seq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
