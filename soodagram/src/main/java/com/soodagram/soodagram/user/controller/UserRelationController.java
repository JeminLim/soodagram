package com.soodagram.soodagram.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.soodagram.soodagram.feed.service.FeedService;
import com.soodagram.soodagram.user.domain.UserVO;
import com.soodagram.soodagram.user.service.UserService;

/**
 * 유저 소셜 기능 관련 컨트롤러
 * 좋아요 팔로우 관련 함수
 * @author jeminLim
 *
 */
@RestController
@RequestMapping("/relation")
public class UserRelationController {

	private final UserService userService;
	private final FeedService feedService;
	
	@Inject
	public UserRelationController(UserService userService, FeedService feedService) {
		this.userService = userService;
		this.feedService = feedService;
	}

	/**
	 * 피드 좋아요 작동 함수
	 * @param request
	 * @param feedNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/like", method = RequestMethod.POST)
	@ResponseBody
	public int likeFeed(HttpServletRequest request, @RequestParam("feedNo") int feedNo) throws Exception {
		// 현재 로그인 유저 정보		
		HttpSession httpSession = request.getSession();
		UserVO loginUser = (UserVO) httpSession.getAttribute("login");	
				

		Map<String, Object> input = new HashMap<>();
		input.put("feedNo", feedNo);
		input.put("userVO", loginUser);
		
		int result = 0; // 1 = 좋아요인 상태, 0 = 기본 상태
		
		
		if(feedService.duplicateCheck(input) > 0) {
			feedService.cancelLike(input);
			result = 0;
		} else {
			feedService.insertLike(input);
			result = 1;
		}
		
		return result;		
	}

	/**
	 * 유저 팔로우 함수
	 * @param targetEmail
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value= "/follow", method = RequestMethod.POST)
	@ResponseBody
	public int followUser(String targetEmail, Model model, HttpServletRequest request) throws Exception{
		HttpSession httpSession = request.getSession();
		UserVO loginUser = (UserVO) httpSession.getAttribute("login");
		
		Map<String, Object> input = new HashMap<>();
		input.put("loginEmail", loginUser.getUserEmail());
		input.put("targetEmail", targetEmail);
		
		int result = 0; // 1 = 팔로우 중인 상태 , 0 = 아무 관계 없는 상태
		
		if(userService.checkFollow(input) > 0) {
			userService.cancelFollow(input);
			result = 0;
		} else {
			userService.follow(input);
			result = 1;
		}
		
		return result;
	}
	
	
}
