package com.soodagram.soodagram.user.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.soodagram.soodagram.user.domain.LoginDTO;
import com.soodagram.soodagram.user.domain.UserVO;
import com.soodagram.soodagram.user.repository.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	private final UserDAO userDAO;
	
	@Inject
	public UserServiceImpl(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	
	@Override
	public void register(UserVO userVO) throws Exception {
		userDAO.register(userVO);
	}


	@Override
	public int duplicateEmail(String userEmail) throws Exception {
		return userDAO.duplicateEmail(userEmail);
	}


	@Override
	public int duplicateId(String userId) throws Exception {
		return userDAO.duplicateId(userId);
	}


	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		return userDAO.login(loginDTO);
	}


	@Override
	public void uploadUserImg(UserVO userVO) throws Exception {
		userDAO.uploadUserImg(userVO);
	}


	@Override
	public List<UserVO> getRecommendUserList(UserVO userVO) throws Exception {
		return userDAO.getRecommendUserList(userVO);
		
	}


	@Override
	public List<UserVO> getFollowerList(UserVO userVO) throws Exception {
		return userDAO.getFollowerList(userVO);
	}


	@Override
	public List<UserVO> getFollowingList(UserVO userVO) throws Exception {
		return userDAO.getFollowingList(userVO);
	}


	@Override
	public UserVO getUserInfo(String userEmail) throws Exception {
		return userDAO.getUserInfo(userEmail);
	}


	@Override
	public void updateUserInfo(UserVO userVO) throws Exception {
		userDAO.updateUserInfo(userVO);
		
	}


	@Override
	public void follow(Map<String, Object> input) throws Exception {
		userDAO.follow(input);		
	}


	@Override
	public void cancelFollow(Map<String, Object> userInput) throws Exception {
		userDAO.cancelFollow(userInput);
	}


	@Override
	public Integer checkFollow(Map<String, Object> userInput) throws Exception {
		return userDAO.checkFollow(userInput);
	}


	@Override
	public UserVO getUserInfoById(String userId) throws Exception {
		return userDAO.getUserInfoById(userId);
	}


	@Override
	public void keepLogin(String userEmail, String sessionId, Date next) throws Exception {
		userDAO.keepLogin(userEmail, sessionId, next);
	}


	@Override
	public UserVO checkLoginBefore(String value) throws Exception {
		
		return userDAO.checkUserWithSessionKey(value);
	}
	
	

}
