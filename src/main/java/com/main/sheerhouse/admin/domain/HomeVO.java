package com.main.sheerhouse.admin.domain;

public class HomeVO {
	private int home_seq;
	private String title;
	private String type;
	private String status;
	private String address;
	private String host_email;
	
	
	
	public HomeVO() {
		
	}

	public HomeVO(int home_seq, String title, String type, String status, String address, String host_email) {
		super();
		this.home_seq = home_seq;
		this.title = title;
		this.type = type;
		this.status = status;
		this.address = address;
		this.host_email = host_email;
	}

	public int getHome_seq() {
		return home_seq;
	}

	public void setHome_seq(int home_seq) {
		this.home_seq = home_seq;
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

	public String getHost_email() {
		return host_email;
	}

	public void setHost_email(String host_email) {
		this.host_email = host_email;
	}

	@Override
	public String toString() {
		return "HomeVO [home_seq=" + home_seq + ", title=" + title + ", type=" + type + ", status=" + status
				+ ", address=" + address + ", host_email=" + host_email + "]";
	}
	
	
	
	
	
}
