package com.main.sheerhouse.admin.domain;

import java.sql.Date;

public class TermVO {
	int term_num; //seq
	String title;
	String sub_title;
	String content;
	Date regist_date;
	
	
	
	public TermVO() { }

	public TermVO(int term_num, String title, String sub_title, String content, Date regist_date) {
		super();
		this.term_num = term_num;
		this.title = title;
		this.sub_title = sub_title;
		this.content = content;
		this.regist_date = regist_date;
	}

	public int getTerm_num() {
		return term_num;
	}

	public void setTerm_num(int term_num) {
		this.term_num = term_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSub_title() {
		return sub_title;
	}

	public void setSub_title(String sub_title) {
		this.sub_title = sub_title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegist_date() {
		return regist_date;
	}

	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}

	@Override
	public String toString() {
		return "TermVO [term_num=" + term_num + ", title=" + title + ", sub_title=" + sub_title + ", content=" + content
				+ ", regist_date=" + regist_date + "]";
	}
	
	
	
}
