package com.main.sheerhouse.admin.domain;

import java.sql.Date;

public class NoticeVO {
	int notice_num;
	String title;
	String content;
	Date regist_date;
	Date update_date;
	
	public NoticeVO() {}

	public NoticeVO(int notice_num, String title, String content, Date regist_date, Date update_date) {
		super();
		this.notice_num = notice_num;
		this.title = title;
		this.content = content;
		this.regist_date = regist_date;
		this.update_date = update_date;
	}

	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", title=" + title + ", content=" + content + ", regist_date="
				+ regist_date + ", update_date=" + update_date + "]";
	}

}