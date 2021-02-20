package com.soodagram.soodagram.user.repository;

import com.soodagram.soodagram.user.domain.LoginDTO;
import com.soodagram.soodagram.user.domain.UserVO;

public interface UserDAO {
	
	// 회원가입
	void register(UserVO userVO) throws Exception;
	int duplicateEmail(String userEmail) throws Exception;
	int duplicateId(String userId) throws Exception;
	
	// 정보갱신
	void uploadUserImg(UserVO userVO) throws Exception;
	
	// 정보열람
	
	
	// 로그인
	UserVO login(LoginDTO loginDTO) throws Exception;
	
}
