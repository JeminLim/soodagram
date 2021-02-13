package com.soodagram.soodagram.feed.domain;

import java.util.Date;

public class FeedVO {
	private Integer feedNo;
	private String content;
	private Date regDate;
	private Date updateDate;
	
	public Integer getFeedNo() {
		return feedNo;
	}
	public void setFeedNo(Integer feedNo) {
		this.feedNo = feedNo;
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
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	@Override
	public String toString() {
		return "FeedVO [feedNo=" + feedNo + ", content=" + content + ", regDate=" + regDate + ", updateDate="
				+ updateDate + "]";
	}
	
	
	
}
