package com.main.sheerhouse.user.domain;

public class PayInfoVO {
	private int apply_num;
	private String title;
	private String host_email;
	private int total_price;
	private String res_date;
	private String pay_date;
	private String pay_status;
	
	public PayInfoVO() {}

	public PayInfoVO(int apply_num, String title, String host_email, int total_price, String res_date, String pay_date,
			String pay_status) {
		super();
		this.apply_num = apply_num;
		this.title = title;
		this.host_email = host_email;
		this.total_price = total_price;
		this.res_date = res_date;
		this.pay_date = pay_date;
		this.pay_status = pay_status;
	}

	public int getApply_num() {
		return apply_num;
	}

	public void setApply_num(int apply_num) {
		this.apply_num = apply_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getHost_email() {
		return host_email;
	}

	public void setHost_email(String host_email) {
		this.host_email = host_email;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public String getPay_status() {
		return pay_status;
	}

	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}

	@Override
	public String toString() {
		return "PayInfoVO [apply_num=" + apply_num + ", title=" + title + ", host_email=" + host_email
				+ ", total_price=" + total_price + ", res_date=" + res_date + ", pay_date=" + pay_date + ", pay_status="
				+ pay_status + "]";
	}

}
