package com.soodagram.soodagram.feed.domain;

public class FeedLikeDTO {
	int likeNo;
	int feedNo;
	String userEmail;
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getFeedNo() {
		return feedNo;
	}
	public void setFeedNo(int feedNo) {
		this.feedNo = feedNo;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	@Override
	public String toString() {
		return "FeedLikeDTO [likeNo=" + likeNo + ", feedNo=" + feedNo + ", userEmail=" + userEmail + "]";
	}
}
