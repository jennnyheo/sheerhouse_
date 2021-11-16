package com.main.sheerhouse.user.domain;

import java.util.Date;

public class CommentVO {
	private int home_seq;
	private int act_seq;
	private String name;
	private String content;
	private Date regDate;
	private int apply_num;
	private int score;
	

	
	@Override
	public String toString() {
		return "CommentVO [home_seq=" + home_seq + ", act_seq=" + act_seq + ", name=" + name + ", content=" + content
				+ ", regDate=" + regDate + ", apply_num=" + apply_num + ", score=" + score + "]";
	}
	
	
	public int getAct_seq() {
		return act_seq;
	}
	public void setAct_seq(int act_seq) {
		this.act_seq = act_seq;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getApply_num() {
		return apply_num;
	}
	public void setApply_num(int apply_num) {
		this.apply_num = apply_num;
	}
	public int getHome_seq() {
		return home_seq;
	}
	public void setHome_seq(int home_seq) {
		this.home_seq = home_seq;
	}
	public int getActivity_seq() {
		return act_seq;
	}
	public void setActivity_seq(int activity_seq) {
		this.act_seq = activity_seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
