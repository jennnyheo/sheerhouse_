package com.main.sheerhouse.host.domain;

import java.sql.Timestamp;

public class SettlementHistotyVO {
	private int set_seq;
	private int host_seq;
	private int apply_num;
	private String title;
	private int set_price;
	private int price;
	private boolean status;
	private String pay_date;
	private Timestamp update_date;
	private String statusKeyword;
	
	public SettlementHistotyVO() {}

	public SettlementHistotyVO(int set_seq, int host_seq, int apply_num, String title, int set_price, int price,
			boolean status, String pay_date, Timestamp update_date, String statusKeyword) {
		super();
		this.set_seq = set_seq;
		this.host_seq = host_seq;
		this.apply_num = apply_num;
		this.title = title;
		this.set_price = set_price;
		this.price = price;
		this.status = status;
		this.pay_date = pay_date;
		this.update_date = update_date;
		this.statusKeyword = statusKeyword;
	}

	public int getSet_seq() {
		return set_seq;
	}

	public void setSet_seq(int set_seq) {
		this.set_seq = set_seq;
	}

	public int getHost_seq() {
		return host_seq;
	}

	public void setHost_seq(int host_seq) {
		this.host_seq = host_seq;
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

	public int getSet_price() {
		return set_price;
	}

	public void setSet_price(int set_price) {
		this.set_price = set_price;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public Timestamp getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
	}

	public String getStatusKeyword() {
		return statusKeyword;
	}

	public void setStatusKeyword(String statusKeyword) {
		this.statusKeyword = statusKeyword;
	}

	@Override
	public String toString() {
		return "SettlementHistotyVO [set_seq=" + set_seq + ", host_seq=" + host_seq + ", apply_num=" + apply_num
				+ ", title=" + title + ", set_price=" + set_price + ", price=" + price + ", status=" + status
				+ ", pay_date=" + pay_date + ", update_date=" + update_date + ", statusKeyword=" + statusKeyword + "]";
	}

	
	
}
