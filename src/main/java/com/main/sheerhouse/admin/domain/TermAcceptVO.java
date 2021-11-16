package com.main.sheerhouse.admin.domain;

import java.sql.Date;

public class TermAcceptVO {
	int term_num;
	String email;
	boolean confirm;
	Date confirm_date;
	public int getTerm_num() {
		return term_num;
	}
	public void setTerm_num(int term_num) {
		this.term_num = term_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isConfirm() {
		return confirm;
	}
	public void setConfirm(boolean confirm) {
		this.confirm = confirm;
	}
	public Date getConfirm_date() {
		return confirm_date;
	}
	public void setConfirm_date(Date confirm_date) {
		this.confirm_date = confirm_date;
	}
	@Override
	public String toString() {
		return "TermAcceptVO [term_num=" + term_num + ", email=" + email + ", confirm=" + confirm + ", confirm_date="
				+ confirm_date + "]";
	}
	
}
