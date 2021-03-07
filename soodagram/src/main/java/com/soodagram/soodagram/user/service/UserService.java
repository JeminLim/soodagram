package com.soodagram.soodagram.user.service;

import java.util.List;

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
}
