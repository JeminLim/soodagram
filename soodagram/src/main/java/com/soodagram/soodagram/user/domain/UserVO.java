package com.soodagram.soodagram.user.domain;

import java.util.Date;

public class UserVO {
	private String userEmail;
	private String userPw;
	private String userName;
	private String userId;
	private String userPhone;
	private String userGender;
	private String userImg;
	private Date userRegDate;
	private String userDesc;
	
	
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


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPhone() {
		return userPhone;
	}


	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}


	public String getUserGender() {
		return userGender;
	}


	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}


	public String getUserImg() {
		return userImg;
	}


	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}


	public Date getUserRegDate() {
		return userRegDate;
	}


	public void setUserRegDate(Date userRegDate) {
		this.userRegDate = userRegDate;
	}


	public String getUserDesc() {
		return userDesc;
	}


	public void setUserDesc(String userDesc) {
		this.userDesc = userDesc;
	}


	@Override
	public String toString() {
		return "UserVO [userEmail=" + userEmail + ", userPw=" + userPw + ", userName=" + userName + ", userId=" + userId
				+ ", userPhone=" + userPhone + ", userGender=" + userGender + ", userRegDate="	+ userRegDate + ", userDesc=" + userDesc + "]";
	}
	
	
	
}
