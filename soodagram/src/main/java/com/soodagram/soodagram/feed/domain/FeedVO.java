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
	
	
	//업로드시
	private String files[];
	
	//피드 GET
	private List<FeedFileVO> fileVO;
	private UserVO userVO;
	
	//좋아요 개수
	private int totalLike;
	
	//댓글 개수
	private int totalReplies;
	
	public int getTotalReplies() {
		return totalReplies;
	}
	public void setTotalReplies(int totalReplies) {
		this.totalReplies = totalReplies;
	}
	public int getTotalLike() {
		return totalLike;
	}
	public void setTotalLike(int totalLike) {
		this.totalLike = totalLike;
	}
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
	
	public List<FeedFileVO> getFileVO() {
		return fileVO;
	}
	public void setFileVO(List<FeedFileVO> fileVO) {
		this.fileVO = fileVO;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}	
	
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	
	
	
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "FeedVO [feedNo=" + feedNo + ", content=" + content + ", regDate=" + regDate + ", updateDate="
				+ updateDate + "]";
	}
	
	
	
}
