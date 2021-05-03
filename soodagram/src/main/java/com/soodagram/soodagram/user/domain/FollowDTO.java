package com.soodagram.soodagram.user.domain;

public class FollowDTO {
	private Integer follow_no;
	private String basedUser;
	private String targetUser;
	
	
	public Integer getFollow_no() {
		return follow_no;
	}
	public void setFollow_no(Integer follow_no) {
		this.follow_no = follow_no;
	}
	public String getBasedUser() {
		return basedUser;
	}
	public void setBasedUser(String basedUser) {
		this.basedUser = basedUser;
	}
	public String getTargetUser() {
		return targetUser;
	}
	public void setTargetUser(String targetUser) {
		this.targetUser = targetUser;
	}
	
	@Override
	public String toString() {
		return "FollowDTO [follow_no=" + follow_no + ", basedUser=" + basedUser + ", targetUser=" + targetUser + "]";
	}
	
	
	
}
