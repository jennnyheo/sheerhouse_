package com.main.sheerhouse.admin.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ChartHomeVO {
	
	//숙소 관련 VO
	private int home_seq;
	private int host_seq;
	private String title;
	private String type;
	private String status;
	private String address;
	private String unused_date;
	private String peak_season;
	private String off_season;
	private int peak_price_per;
	private int off_price_per;
	private int weekend_price;
	private int price;
	private int headcount;
	private String info;
	private String rule;
	private String url;
	private String host_info;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date update_date;
	private int min_date_count;
	private int max_date_count;
	private int long_price_per;
	private int cnt;
	
	//임시로 쓸 값들
	private int inputMonth;
	private int count;
	public int getHome_seq() {
		return home_seq;
	}
	public void setHome_seq(int home_seq) {
		this.home_seq = home_seq;
	}
	public int getHost_seq() {
		return host_seq;
	}
	public void setHost_seq(int host_seq) {
		this.host_seq = host_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUnused_date() {
		return unused_date;
	}
	public void setUnused_date(String unused_date) {
		this.unused_date = unused_date;
	}
	public String getPeak_season() {
		return peak_season;
	}
	public void setPeak_season(String peak_season) {
		this.peak_season = peak_season;
	}
	public String getOff_season() {
		return off_season;
	}
	public void setOff_season(String off_season) {
		this.off_season = off_season;
	}
	public int getPeak_price_per() {
		return peak_price_per;
	}
	public void setPeak_price_per(int peak_price_per) {
		this.peak_price_per = peak_price_per;
	}
	public int getOff_price_per() {
		return off_price_per;
	}
	public void setOff_price_per(int off_price_per) {
		this.off_price_per = off_price_per;
	}
	public int getWeekend_price() {
		return weekend_price;
	}
	public void setWeekend_price(int weekend_price) {
		this.weekend_price = weekend_price;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getHeadcount() {
		return headcount;
	}
	public void setHeadcount(int headcount) {
		this.headcount = headcount;
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
	public String getHost_info() {
		return host_info;
	}
	public void setHost_info(String host_info) {
		this.host_info = host_info;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public int getMin_date_count() {
		return min_date_count;
	}
	public void setMin_date_count(int min_date_count) {
		this.min_date_count = min_date_count;
	}
	public int getMax_date_count() {
		return max_date_count;
	}
	public void setMax_date_count(int max_date_count) {
		this.max_date_count = max_date_count;
	}
	public int getLong_price_per() {
		return long_price_per;
	}
	public void setLong_price_per(int long_price_per) {
		this.long_price_per = long_price_per;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getInputMonth() {
		return inputMonth;
	}
	public void setInputMonth(int inputMonth) {
		this.inputMonth = inputMonth;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "chaerHomeVO [home_seq=" + home_seq + ", host_seq=" + host_seq + ", title=" + title + ", type=" + type
				+ ", status=" + status + ", address=" + address + ", unused_date=" + unused_date + ", peak_season="
				+ peak_season + ", off_season=" + off_season + ", peak_price_per=" + peak_price_per + ", off_price_per="
				+ off_price_per + ", weekend_price=" + weekend_price + ", price=" + price + ", headcount=" + headcount
				+ ", info=" + info + ", rule=" + rule + ", url=" + url + ", host_info=" + host_info + ", regdate="
				+ regdate + ", update_date=" + update_date + ", min_date_count=" + min_date_count + ", max_date_count="
				+ max_date_count + ", long_price_per=" + long_price_per + ", cnt=" + cnt + ", inputMonth=" + inputMonth
				+ ", count=" + count + "]";
	}
	
	
	
	
}
