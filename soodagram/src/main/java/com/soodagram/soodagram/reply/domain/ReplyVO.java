package com.soodagram.soodagram.reply.domain;

import java.util.Date;

public class ReplyVO {
	
	Integer replyNo;
	String content;
	Date regDate;
	Date updateDate;

	
	//for user
	String userEmail;
	String userId;
	
	//for feed
	Integer feedNo;
	
	
	public Integer getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(Integer replyNo) {
		this.replyNo = replyNo;
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
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getFeedNo() {
		return feedNo;
	}
	public void setFeedNo(Integer feedNo) {
		this.feedNo = feedNo;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [replyNo=" + replyNo + ", content=" + content + ", regDate=" + regDate + ", updateDate="
				+ updateDate + ", userEmail=" + userEmail + ", userId=" + userId + ", feedNo=" + feedNo + "]";
	}
	
	
	
	
	
	
}
