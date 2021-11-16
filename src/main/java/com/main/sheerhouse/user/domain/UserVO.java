package com.main.sheerhouse.user.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class UserVO {

	private String email;
	private String name;
	private String password;
	private String phone;
	private String role;
	private String gender;
	private Date birthday;
	private boolean smsConfirm;
	private boolean emailConfirm;
	private String address;
	private String userInfo;
	private int status;
	private Timestamp regdate;
	private Timestamp updatedate; 
	
	public UserVO() {}

	public UserVO(String email, String name, String password, String phone, String role, String gender, Date birthday,
			boolean smsConfirm, boolean emailConfirm, String address, String userInfo, int status, Timestamp regdate,
			Timestamp updatedate) {
		super();
		this.email = email;
		this.name = name;
		this.password = password;
		this.phone = phone;
		this.role = role;
		this.gender = gender;
		this.birthday = birthday;
		this.smsConfirm = smsConfirm;
		this.emailConfirm = emailConfirm;
		this.address = address;
		this.userInfo = userInfo;
		this.status = status;
		this.regdate = regdate;
		this.updatedate = updatedate;
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

	public boolean isSmsConfirm() {
		return smsConfirm;
	}

	public void setSmsConfirm(boolean smsConfirm) {
		this.smsConfirm = smsConfirm;
	}

	public boolean isEmailConfirm() {
		return emailConfirm;
	}

	public void setEmailConfirm(boolean emailConfirm) {
		this.emailConfirm = emailConfirm;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

	@Override
	public String toString() {
		return "UserVO [email=" + email + ", name=" + name + ", password=" + password + ", phone=" + phone + ", role="
				+ role + ", gender=" + gender + ", birthday=" + birthday + ", smsConfirm=" + smsConfirm
				+ ", emailConfirm=" + emailConfirm + ", address=" + address + ", userInfo=" + userInfo + ", status="
				+ status + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}

	
	
}
