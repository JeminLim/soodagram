package com.soodagram.soodagram.user.repository;

import java.util.List;
import java.util.Map;

import com.soodagram.soodagram.user.domain.FollowDTO;
import com.soodagram.soodagram.user.domain.LoginDTO;
import com.soodagram.soodagram.user.domain.UserVO;

public interface UserDAO {
	
	// 회원가입
	void register(UserVO userVO) throws Exception;
	int duplicateEmail(String userEmail) throws Exception;
	int duplicateId(String userId) throws Exception;
	
	// 정보갱신
	void uploadUserImg(UserVO userVO) throws Exception;
	// 로그인
	UserVO login(LoginDTO loginDTO) throws Exception;
	
	// 팔로잉
	void follow(Map<String, Object> follow) throws Exception;
	
	// 팔로잉 팔로워 리스트 GET
	List<UserVO> getFollowerList(UserVO userVO) throws Exception;
	List<UserVO> getFollowingList(UserVO userVO) throws Exception;
	
	// 정보열람
	List<UserVO> getRecommendUserList(UserVO userVO) throws Exception;
	
}
