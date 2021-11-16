package com.main.sheerhouse.user.domain;

import java.util.Date;

public class SearchVO {
	private String location;
	private String checkin;
	private String checkout;
	private String people;
	
	@Override
	public String toString() {
		return "SearchVO [location=" + location + ", checkin=" + checkin + ", checkout=" + checkout + ", people="
				+ people + "]";
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
}
