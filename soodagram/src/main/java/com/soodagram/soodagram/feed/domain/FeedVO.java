package com.soodagram.soodagram.feed.domain;

import java.util.Date;
import java.util.List;

public class FeedVO {
	private Integer feedNo;
	private String content;
	private Date regDate;
	private Date updateDate;
	private String userEmail;
	private String[] files;
	private List<FeedFileVO> fileVO;
	
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
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
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
	@Override
	public String toString() {
		return "FeedVO [feedNo=" + feedNo + ", content=" + content + ", regDate=" + regDate + ", updateDate="
				+ updateDate + "]";
	}
	
	
	
}
