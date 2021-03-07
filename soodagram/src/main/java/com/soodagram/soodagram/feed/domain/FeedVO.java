package com.soodagram.soodagram.feed.domain;

import java.util.Date;
import java.util.List;

import com.soodagram.soodagram.user.domain.UserVO;

public class FeedVO {
	private Integer feedNo;
	private String content;
	private Date regDate;
	private Date updateDate;
	private String userEmail;
	
	
	// from feed_img table
	private String[] files;	
	private List<FeedFileVO> fileVO;
	
	// from user table	
	private String userId;
	private String userImg;
	
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
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	
	public List<FeedFileVO> getFileVO() {
		return fileVO;
	}
	public void setFileVO(List<FeedFileVO> fileVO) {
		this.fileVO = fileVO;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	@Override
	public String toString() {
		return "FeedVO [feedNo=" + feedNo + ", content=" + content + ", regDate=" + regDate + ", updateDate="
				+ updateDate + "]";
	}
	
	
	
}
