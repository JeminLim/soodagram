package com.soodagram.soodagram.feed.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.soodagram.soodagram.feed.domain.FeedVO;
import com.soodagram.soodagram.feed.service.FeedService;
import com.soodagram.soodagram.user.domain.UserVO;
import com.soodagram.soodagram.user.service.UserService;

/**
 * 피드 열람 페이지 컨트롤러
 * @author jeminLim
 * @version 1.0
 */
@Controller
@RequestMapping("/")
public class FeedPageController {

	private static final Logger logger = LoggerFactory.getLogger(FeedController.class);
	
	private final FeedService feedService;
	private final UserService userService;
	
	@Inject
	public FeedPageController(FeedService feedService, UserService userService) {
		this.feedService = feedService;
		this.userService = userService;
	}	
	
	/**
	 * 피드 열람 페이지 유저 관련 정보(추천 유저, 팔로잉 유저) 데이터 수신
	 * @param model
	 * @param request
	 * @return feed page
	 * @throws Exception
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String feedPageGET(Model model, HttpServletRequest request) throws Exception {
		// 현재 로그인 유저 정보		
		HttpSession httpSession = request.getSession();
		UserVO loginUser = (UserVO) httpSession.getAttribute("login");	
		
		// 다른 유저 추천 리스트
		List<UserVO> recommendList = userService.getRecommendUserList(loginUser);
		model.addAttribute("recommendList", recommendList);
		
		// 팔로잉 리스트
		List<UserVO> followingList = userService.getFollowingList(loginUser);
		model.addAttribute("followingList", followingList);
		
		return "/feed/feed";
	}
	
	/**
	 * 팔로잉 유저의 피드 열람
	 * @param model
	 * @param request
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/feeds/{page}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getFeed(Model model, HttpServletRequest request, @PathVariable("page") int page) throws Exception {
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
	
	/**
	 * 해당 피드 좋아요 갯수
	 * @param feedNo
	 * @return number of feed like
	 * @throws Exception
	 */
	@RequestMapping(value="/feeds/like/{feedNo}", method = RequestMethod.GET)
	@ResponseBody
	public int getCountFeedLike(@PathVariable("feedNo") int feedNo) throws Exception {			
		return feedService.countLikeNo(feedNo);
	}
}
