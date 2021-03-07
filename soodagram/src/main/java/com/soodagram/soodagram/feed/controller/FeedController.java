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
		
		// 팔로잉 유저 피드
		List<FeedVO> followingFeed = feedService.getFollowingFeed(loginUser);
		model.addAttribute("followingFeed", followingFeed);
		
		
		return "/main/feed";
	}
	
	@RequestMapping(value= "/moreFeed", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<String> getMoreFeed(Model model, HttpServletRequest request, int minFeedNo) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		try {
			 HttpSession httpSession = request.getSession();
			 UserVO loginUser = (UserVO) httpSession.getAttribute("login");
			 
			 List<FeedVO> moreFeed = feedService.getMoreFeed(loginUser, minFeedNo);
			 model.addAttribute("moreFeed", moreFeed);
			
			 entity = new ResponseEntity<String>("added", HttpStatus.OK);
			 
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
	
	@RequestMapping(value="/getFeed", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getFeed(Model model, HttpServletRequest request) throws Exception {
		// 현재 로그인 유저 정보		
		HttpSession httpSession = request.getSession();
		UserVO loginUser = (UserVO) httpSession.getAttribute("login");	
		// 팔로잉 유저 피드
		List<FeedVO> followingFeed = feedService.getFollowingFeed(loginUser);
		Map<String, Object> result = new HashMap<>();
		
		
		result.put("followingFeed", followingFeed);
		result.put("code", "success");
		
		return result;
	}
	
}
