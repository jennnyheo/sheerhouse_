package com.main.sheerhouse.host.domain;

public class HostReservationInfoVO {

	private int apply_num;
	private int home_seq;
	private int act_seq;
	private String email;
	private int total_price;
	private int headcount;
	private String pay_status;
	private String pay_date;
	private String res_date;
	private String cancel_reason;
	private String title;
	private String info;
	private String rule;
	private String url;
	
	public HostReservationInfoVO() {}

	public HostReservationInfoVO(int apply_num, int home_seq, int act_seq, String email, int total_price, int headcount,
			String pay_status, String pay_date, String res_date, String cancel_reason, String title, String info,
			String rule, String url) {
		super();
		this.apply_num = apply_num;
		this.home_seq = home_seq;
		this.act_seq = act_seq;
		this.email = email;
		this.total_price = total_price;
		this.headcount = headcount;
		this.pay_status = pay_status;
		this.pay_date = pay_date;
		this.res_date = res_date;
		this.cancel_reason = cancel_reason;
		this.title = title;
		this.info = info;
		this.rule = rule;
		this.url = url;
	}

	public int getApply_num() {
		return apply_num;
	}

	public void setApply_num(int apply_num) {
		this.apply_num = apply_num;
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

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getHeadcount() {
		return headcount;
	}

	public void setHeadcount(int headcount) {
		this.headcount = headcount;
	}

	public String getPay_status() {
		return pay_status;
	}

	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public String getCancel_reason() {
		return cancel_reason;
	}

	public void setCancel_reason(String cancel_reason) {
		this.cancel_reason = cancel_reason;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "HostReservationInfoVO [apply_num=" + apply_num + ", home_seq=" + home_seq + ", act_seq=" + act_seq
				+ ", email=" + email + ", total_price=" + total_price + ", headcount=" + headcount + ", pay_status="
				+ pay_status + ", pay_date=" + pay_date + ", res_date=" + res_date + ", cancel_reason=" + cancel_reason
				+ ", title=" + title + ", info=" + info + ", rule=" + rule + ", url=" + url + "]";
	}
	
}
