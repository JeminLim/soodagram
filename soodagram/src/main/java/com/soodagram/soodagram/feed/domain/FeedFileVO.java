package com.soodagram.soodagram.feed.domain;

import java.util.Date;

public class FeedFileVO {
	private String fileName;
	private Integer feedNo;
	private Date regDate;
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Integer getFeedNo() {
		return feedNo;
	}
	public void setFeedNo(Integer feedNo) {
		this.feedNo = feedNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "FeedFileVO [fileName=" + fileName + ", feedNo=" + feedNo + ", regDate=" + regDate + "]";
	}
	
	
	
}
