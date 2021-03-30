package com.soodagram.soodagram.user.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.soodagram.soodagram.user.domain.LoginDTO;
import com.soodagram.soodagram.user.domain.UserVO;

public interface UserService {
	
	void register(UserVO userVO) throws Exception;
	int duplicateEmail(String userEmail) throws Exception;
	int duplicateId(String userId) throws Exception;
	void uploadUserImg(UserVO userVO) throws Exception;
	UserVO login(LoginDTO loginDTO) throws Exception;
	List<UserVO> getRecommendUserList(UserVO userVO) throws Exception;
	List<UserVO> getFollowerList(UserVO userVO) throws Exception; 
	List<UserVO> getFollowingList(UserVO userVO) throws Exception;
	UserVO getUserInfo(String userEmail) throws Exception;
	void updateUserInfo(UserVO userVO) throws Exception;
	void follow(Map<String, Object> input) throws Exception;
	void cancelFollow(Map<String, Object> userInput) throws Exception;
	Integer checkFollow(Map<String, Object> userInput) throws Exception;
	UserVO getUserInfoById(String userId) throws Exception;	
	void keepLogin(String userEmail, String sessionId, Date next) throws Exception;
	UserVO checkLoginBefore(String value) throws Exception;
}
