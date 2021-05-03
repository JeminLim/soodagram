package com.soodagram.soodagram.feed.domain;

public class FeedHashtagVO {
	
	private Integer hashtagNo;
	private String hashtagName;
	private Integer feedNo;
	private Integer tagCount;
	
	public Integer getTagCount() {
		return tagCount;
	}
	public void setTagCount(Integer tagCount) {
		this.tagCount = tagCount;
	}
	
	
	public Integer getHashtagNo() {
		return hashtagNo;
	}
	public void setHashtagNo(Integer hashtagNo) {
		this.hashtagNo = hashtagNo;
	}
	public String getHashtagName() {
		return hashtagName;
	}
	public void setHashtagName(String hashtagName) {
		this.hashtagName = hashtagName;
	}
	public Integer getFeedNo() {
		return feedNo;
	}
	public void setFeedNo(Integer feedNo) {
		this.feedNo = feedNo;
	}
	
	@Override
	public String toString() {
		return "FeedHashtagVO [hashtagNo=" + hashtagNo + ", hashtagName=" + hashtagName + ", feedNo=" + feedNo + "]";
	}
	
	
		
}
