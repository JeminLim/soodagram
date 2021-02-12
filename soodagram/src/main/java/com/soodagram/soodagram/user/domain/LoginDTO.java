package com.soodagram.soodagram.user.domain;

public class LoginDTO {
	
	private String userEmail;
	private String userPw;
	private boolean useCookie;
	
	
	@Override
	public String toString() {
		return "LoginDTO [userEmail=" + userEmail + ", userPw=" + userPw + ", useCookie=" + useCookie + "]";
	}
	
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
}
