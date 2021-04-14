package com.soodagram.soodagram.search.controller;

import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soodagram.soodagram.feed.domain.FeedVO;
import com.soodagram.soodagram.search.service.SearchService;

/**
 * 검색 관련 컨트롤러
 * @author jeminLim
 * @version 1.0
 */
@Controller
@RequestMapping("/search")
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	private final SearchService searchService;
	
	@Inject
	public SearchController (SearchService searchService) {
		this.searchService = searchService;
	}
	
	/**
	 * 주어진 키워드로 유저 또는 해시태그 검색
	 * @param keyword
	 * @return search result
	 * @throws Exception
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> search(@RequestParam("keyword") String keyword) throws Exception {
		
		return searchService.search(keyword);
		
	}
	
	/**
	 * 해시태그에 관련 있는 피드 열람
	 * @param hashtag
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/hashtag", method = RequestMethod.GET)
	public String getHashtagFeed(@RequestParam("hashtag") String hashtag, Model model) throws Exception {
		
		hashtag = URLDecoder.decode(hashtag, "UTF-8");
		
		logger.info(hashtag + " searched");
		
		List<FeedVO> searchedFeed = searchService.getHashtagFeed(hashtag);
		model.addAttribute("searchedFeed", searchedFeed);
		model.addAttribute("hashtagName", hashtag);
		
		
		return "/feed/hashtagFeed";
	}
	
	
}
