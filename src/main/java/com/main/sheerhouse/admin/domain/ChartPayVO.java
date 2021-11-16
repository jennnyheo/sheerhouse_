package com.main.sheerhouse.admin.domain;

public class ChartPayVO {

	//매출관련 VO
	private int home_seq;
	private int act_seq;
	private String email;
	private int total_price;
	private int headcount;
	private String pay_status;
	private String cancel_reason;
	private int apply_num;
	private String res_date;
	
	//임의로 받아줄 값들
	private int inputYear;
	private int inputMonth;
	private int cnt;
	
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
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public int getInputYear() {
		return inputYear;
	}
	public void setInputYear(int inputYear) {
		this.inputYear = inputYear;
	}
	public int getInputMonth() {
		return inputMonth;
	}
	public void setInputMonth(int inputMonth) {
		this.inputMonth = inputMonth;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	@Override
	public String toString() {
		return "ChartPayVO [home_seq=" + home_seq + ", act_seq=" + act_seq + ", email=" + email + ", total_price="
				+ total_price + ", headcount=" + headcount + ", pay_status=" + pay_status + ", cancel_reason="
				+ cancel_reason + ", apply_num=" + apply_num + ", res_date=" + res_date + ", inputYear=" + inputYear
				+ ", inputMonth=" + inputMonth + ", cnt=" + cnt + "]";
	}
	
	
	
}
