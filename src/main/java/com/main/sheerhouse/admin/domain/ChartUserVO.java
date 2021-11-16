package com.main.sheerhouse.admin.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ChartUserVO {

	//Member 또는 user 관련 VO
	private String email;
	private String password;
	private String phone;
	private String role;
	private String gender;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	private int sms_confirm;
	private int email_confirm;
	private String address;
	private String user_info;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedate;
	private String name;
	private int status;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	//임의로 받아줄 값들
	private int inputYear;
	private int inputMonth;
	private int cnt;
	
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public int getSms_confirm() {
		return sms_confirm;
	}
	public void setSms_confirm(int sms_confirm) {
		this.sms_confirm = sms_confirm;
	}
	public int getEmail_confirm() {
		return email_confirm;
	}
	public void setEmail_confirm(int email_confirm) {
		this.email_confirm = email_confirm;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUser_info() {
		return user_info;
	}
	public void setUser_info(String user_info) {
		this.user_info = user_info;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "ChartVO [email=" + email + ", password=" + password + ", phone=" + phone + ", role=" + role
				+ ", gender=" + gender + ", birthday=" + birthday + ", sms_confirm=" + sms_confirm + ", email_confirm="
				+ email_confirm + ", address=" + address + ", user_info=" + user_info + ", regdate=" + regdate
				+ ", updatedate=" + updatedate + ", name=" + name + ", status=" + status + "]";
	}
	
}
