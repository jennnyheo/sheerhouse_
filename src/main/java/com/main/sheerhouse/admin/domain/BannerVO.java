package com.main.sheerhouse.admin.domain;

import java.sql.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class BannerVO {

	private int bannerNum; //sequence
	private String originalFileName;
	private String s3FileName;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date fileRegDate;
	
	private int bannerShow;
	private String bannerUrl;
	
	public int getLastNum() {
		return lastNum;
	}
	public void setLastNum(int lastNum) {
		this.lastNum = lastNum;
	}
	private int lastNum;
	
	public int getBannerNum() {
		return bannerNum;
	}
	public void setBannerNum(int bannerNum) {
		this.bannerNum = bannerNum;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getS3FileName() {
		return s3FileName;
	}
	public void setS3FileName(String s3FileName) {
		this.s3FileName = s3FileName;
	}
	public Date getFileRegDate() {
		return fileRegDate;
	}
	public void setFileRegDate(Date fileRegDate) {
		this.fileRegDate = fileRegDate;
	}
	public int getBannerShow() {
		return bannerShow;
	}
	public void setBannerShow(int bannerShow) {
		this.bannerShow = bannerShow;
	}
	public String getBannerUrl() {
		return bannerUrl;
	}
	public void setBannerUrl(String bannerUrl) {
		this.bannerUrl = bannerUrl;
	}
	@Override
	public String toString() {
		return "BannerVO [bannerNum=" + bannerNum + ", originalFileName=" + originalFileName + ", s3FileName="
				+ s3FileName + ", fileRegDate=" + fileRegDate + ", bannerShow=" + bannerShow + ", bannerUrl="
				+ bannerUrl + "]";
	}
	
	//////////////////
	

	
	
	
	
	
}
