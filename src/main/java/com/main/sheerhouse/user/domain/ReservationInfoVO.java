package com.main.sheerhouse.user.domain;

import java.util.Date;

public class ReservationInfoVO {
	private int home_seq;
	private int act_seq;
	private String email;
	private int total_price;
	private String pay_date;
	private String pay_status;
	private String res_date;
	private String cancel_reason;
	private int apply_num;
	private String title;
	private String price;
	private String host_info;
	private String info;
	private String address;
	

	@Override
	public String toString() {
		return "ReservationInfoVO [home_seq=" + home_seq + ", act_seq=" + act_seq + ", email=" + email
				+ ", total_price=" + total_price + ", pay_date=" + pay_date + ", pay_status=" + pay_status
				+ ", res_date=" + res_date + ", cancel_reason=" + cancel_reason + ", apply_num=" + apply_num
				+ ", title=" + title + ", price=" + price + ", host_info=" + host_info + ", info=" + info + ", address="
				+ address + ", headcount=" + headcount + ", rule=" + rule + ", url=" + url + "]";
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	private int headcount;
	
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getHost_info() {
		return host_info;
	}
	public void setHost_info(String host_info) {
		this.host_info = host_info;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getHeadcount() {
		return headcount;
	}
	public void setHeadcount(int headcount) {
		this.headcount = headcount;
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
	private String rule;
	private String url;
	


}
