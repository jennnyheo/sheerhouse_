package com.main.sheerhouse.host.domain;

import java.sql.Timestamp;

public class HostVO {

	private int host_seq;
	private String email;
	private String name;
	private String phone;
	private String host_info;
	private Timestamp regdate;
	private Timestamp updatedate;
	private int certificateNum;
	private String certificateTitle;
	private String account_url;
	private int status;
	
	public HostVO() {}

	public HostVO(int host_seq, String email, String name, String phone, String host_info, Timestamp regdate,
			Timestamp updatedate, int certificateNum, String certificateTitle, String account_url, int status) {
		super();
		this.host_seq = host_seq;
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.host_info = host_info;
		this.regdate = regdate;
		this.updatedate = updatedate;
		this.certificateNum = certificateNum;
		this.certificateTitle = certificateTitle;
		this.account_url = account_url;
		this.status = status;
	}

	public int getHost_seq() {
		return host_seq;
	}

	public void setHost_seq(int host_seq) {
		this.host_seq = host_seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHost_info() {
		return host_info;
	}

	public void setHost_info(String host_info) {
		this.host_info = host_info;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Timestamp getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Timestamp updatedate) {
		this.updatedate = updatedate;
	}

	public int getCertificateNum() {
		return certificateNum;
	}

	public void setCertificateNum(int certificateNum) {
		this.certificateNum = certificateNum;
	}

	public String getCertificateTitle() {
		return certificateTitle;
	}

	public void setCertificateTitle(String certificateTitle) {
		this.certificateTitle = certificateTitle;
	}

	public String getAccount_url() {
		return account_url;
	}

	public void setAccount_url(String account_url) {
		this.account_url = account_url;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "HostVO [host_seq=" + host_seq + ", email=" + email + ", name=" + name + ", phone=" + phone
				+ ", host_info=" + host_info + ", regdate=" + regdate + ", updatedate=" + updatedate
				+ ", certificateNum=" + certificateNum + ", certificateTitle=" + certificateTitle + ", account_url="
				+ account_url + ", status=" + status + "]";
	}

}
