package com.soodagram.soodagram.feed.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soodagram.soodagram.feed.domain.FeedVO;
import com.soodagram.soodagram.feed.service.FeedService;
import com.soodagram.soodagram.user.domain.UserVO;
import com.soodagram.soodagram.user.service.UserService;

@Controller
@RequestMapping("/main")
public class FeedController {

	private final FeedService feedService;
	private final UserService userService;
	
	@Inject
	public FeedController(FeedService feedService, UserService userService) {
		this.feedService = feedService;
		this.userService = userService;
	}
	
	@RequestMapping(value = "/feed", method = RequestMethod.GET)
	public String feedGET(Model model, HttpServletRequest request) throws Exception {
		// 현재 로그인 유저 정보		
		HttpSession httpSession = request.getSession();
		UserVO loginUser = (UserVO) httpSession.getAttribute("login");	
		
		// 다른 유저 추천 리스트
		List<UserVO> recommendList = userService.getRecommendUserList(loginUser);
		model.addAttribute("recommendList", recommendList);
		
		// 팔로잉 리스트
		List<UserVO> followingList = userService.getFollowingList(loginUser);
		model.addAttribute("followingList", followingList);
		
		return "/main/feed";
	}
	
	@RequestMapping(value="/getFeed", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getFeed(Model model, HttpServletRequest request, @RequestParam("page") int page) throws Exception {
		// 현재 로그인 유저 정보		
		HttpSession httpSession = request.getSession();
		UserVO loginUser = (UserVO) httpSession.getAttribute("login");	
		// 팔로잉 유저 피드
		Map<String, Object> input = new HashMap<String, Object>();
		input.put("page", page);
		input.put("userVO", loginUser);
		
		List<FeedVO> followingFeed = feedService.getFollowingFeed(input);	
	
		
		Map<String, Object> result = new HashMap<>();
		result.put("followingFeed", followingFeed);
		result.put("code", "success");
		return result;
	}
	
	@RequestMapping(value="/like", method = RequestMethod.POST)
	@ResponseBody
	public int likeFeed(HttpServletRequest request, @RequestParam("feedNo") int feedNo) throws Exception {
		// 현재 로그인 유저 정보		
		HttpSession httpSession = request.getSession();
		UserVO loginUser = (UserVO) httpSession.getAttribute("login");	
				

		Map<String, Object> input = new HashMap<>();
		input.put("feedNo", feedNo);
		input.put("userVO", loginUser);
		
		int result = 0;
		
		if(feedService.duplicateCheck(input) > 0) {
			feedService.cancelLike(input);
			result = 0;
		} else {
			feedService.insertLike(input);
			result = 1;
		}
		
		return result;		
	}
}
