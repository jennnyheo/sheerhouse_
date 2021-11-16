package com.main.sheerhouse.admin.domain;

import java.sql.Timestamp;

public class PayAndSetVO {
	private int apply_num;
	private String host_email;
	private String user_email;
	private int set_price;
	private int total_price;
	private String set_status;
	private String pay_status;
	private Timestamp set_date;
	private String pay_date;
	private String cancel_reason;
	
	public PayAndSetVO() {}
	public PayAndSetVO(int apply_num, String host_email, String user_email, int set_price, int total_price,
			String set_status, String pay_status, Timestamp set_date, String pay_date, String cancel_reason) {
		super();
		this.apply_num = apply_num;
		this.host_email = host_email;
		this.user_email = user_email;
		this.set_price = set_price;
		this.total_price = total_price;
		this.set_status = set_status;
		this.pay_status = pay_status;
		this.set_date = set_date;
		this.pay_date = pay_date;
		this.cancel_reason = cancel_reason;
	}

	public int getApply_num() {
		return apply_num;
	}

	public void setApply_num(int apply_num) {
		this.apply_num = apply_num;
	}

	public String getHost_email() {
		return host_email;
	}

	public void setHost_email(String host_email) {
		this.host_email = host_email;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getSet_price() {
		return set_price;
	}

	public void setSet_price(int set_price) {
		this.set_price = set_price;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getSet_status() {
		return set_status;
	}

	public void setSet_status(String set_status) {
		this.set_status = set_status;
	}

	public String getPay_status() {
		return pay_status;
	}

	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}

	public Timestamp getSet_date() {
		return set_date;
	}

	public void setSet_date(Timestamp set_date) {
		this.set_date = set_date;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public String getCancel_reason() {
		return cancel_reason;
	}

	public void setCancel_reason(String cancel_reason) {
		this.cancel_reason = cancel_reason;
	}

	@Override
	public String toString() {
		return "PayAndSetVO [apply_num=" + apply_num + ", host_email=" + host_email + ", user_email=" + user_email
				+ ", set_price=" + set_price + ", total_price=" + total_price + ", set_status=" + set_status
				+ ", pay_status=" + pay_status + ", set_date=" + set_date + ", pay_date=" + pay_date
				+ ", cancel_reason=" + cancel_reason + "]";
	}
}
