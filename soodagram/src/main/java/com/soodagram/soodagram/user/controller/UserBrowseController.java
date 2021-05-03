package com.soodagram.soodagram.user.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.soodagram.soodagram.feed.domain.FeedVO;
import com.soodagram.soodagram.feed.service.FeedService;
import com.soodagram.soodagram.user.domain.UserVO;
import com.soodagram.soodagram.user.service.UserService;

/**
 * 유저 개인 페이지 컨트롤러
 * 타겟 유저의 정보 및 피드 열람
 * @author jeminLim
 * @version 1.0
 */
@Controller
@RequestMapping("/user")
public class UserBrowseController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserBrowseController.class);
	
	private final FeedService feedService;
	private final UserService userService;
	
	@Inject
	public UserBrowseController(FeedService feedService, UserService userService) {
		this.feedService = feedService;
		this.userService = userService;
	}
		
	/**
	 * 타겟 유저 피드 열람
	 * @param userId
	 * @param model
	 * @param request
	 * @return 
	 * @throws Exception
	 */
	@RequestMapping(value= "/{userId}", method = RequestMethod.GET)
	public String accountGET(@PathVariable("userId") String userId, Model model, HttpServletRequest request) throws Exception {		
		
		// 로그인 계정
		HttpSession httpSession = request.getSession();
		UserVO loginUser = (UserVO) httpSession.getAttribute("login");	
		
		// 열람할 타겟 유저
		UserVO target = (loginUser.getUserId().equals(userId)) ? loginUser : userService.getUserInfoById(userId);
			
		
		
		model.addAttribute("feedList", feedService.getMyFeed(target));
		model.addAttribute("followerList", userService.getFollowerList(target));
		model.addAttribute("followingList", userService.getFollowingList(target));
		
		// 타겟 == 로그인 사용자 경우, 본인 프로필 계정으로 이동
		if(loginUser.getUserId().equals(userId)) {
			List<UserVO> recommendList = userService.getRecommendUserList(target);
			model.addAttribute("recommendList", recommendList);
			return "/profile/profile";
		} 
		
		// 타인 계정 탐방
		model.addAttribute("targetUser", target);
		model.addAttribute("userFollowingList", userService.getFollowingList(loginUser));
		return "/feed/userFeed";
		
	}	
}
