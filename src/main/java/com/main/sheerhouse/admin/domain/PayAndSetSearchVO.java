package com.main.sheerhouse.admin.domain;

public class PayAndSetSearchVO {
	private String startDate;
	private String endDate;
	private String search_keyword;
	
	public PayAndSetSearchVO() {}

	public PayAndSetSearchVO(String startDate, String endDate, String search_keyword) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.search_keyword = search_keyword;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getSearch_keyword() {
		return search_keyword;
	}

	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	@Override
	public String toString() {
		return "PayAndSetSearchVO [startDate=" + startDate + ", endDate=" + endDate + ", search_keyword="
				+ search_keyword + "]";
	}
}
