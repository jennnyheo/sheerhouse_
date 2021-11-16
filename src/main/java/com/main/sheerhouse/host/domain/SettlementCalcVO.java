package com.main.sheerhouse.host.domain;

import java.sql.Timestamp;
import java.util.Arrays;

public class SettlementCalcVO {
	private int total_price;
	private int set_price;
	private int unset_price;
	private String status;
	private String res_status;
	private int res_total_count;
	private double res_paid_per;
	private double res_failed_per;
	private String res_date;
	private Timestamp update_date;
	private String[][] chartData;
	private String chartArray;
	
	public SettlementCalcVO() {}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getSet_price() {
		return set_price;
	}

	public void setSet_price(int set_price) {
		this.set_price = set_price;
	}

	public int getUnset_price() {
		return unset_price;
	}

	public void setUnset_price(int unset_price) {
		this.unset_price = unset_price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRes_status() {
		return res_status;
	}

	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}

	public int getRes_total_count() {
		return res_total_count;
	}

	public void setRes_total_count(int res_total_count) {
		this.res_total_count = res_total_count;
	}

	public double getRes_paid_per() {
		return res_paid_per;
	}

	public void setRes_paid_per(double res_paid_per) {
		this.res_paid_per = res_paid_per;
	}

	public double getRes_failed_per() {
		return res_failed_per;
	}

	public void setRes_failed_per(double res_failed_per) {
		this.res_failed_per = res_failed_per;
	}

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public Timestamp getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
	}

	public String[][] getChartData() {
		return chartData;
	}

	public void setChartData(String[][] chartData) {
		this.chartData = chartData;
	}

	public String getChartArray() {
		return chartArray;
	}

	public void setChartArray(String chartArray) {
		this.chartArray = chartArray;
	}

	@Override
	public String toString() {
		return "SettlementCalcVO [total_price=" + total_price + ", set_price=" + set_price + ", unset_price="
				+ unset_price + ", status=" + status + ", res_status=" + res_status + ", res_total_count="
				+ res_total_count + ", res_paid_per=" + res_paid_per + ", res_failed_per=" + res_failed_per
				+ ", res_date=" + res_date + ", update_date=" + update_date + ", chartData="
				+ Arrays.toString(chartData) + ", chartArray=" + chartArray + "]";
	}

	
}
