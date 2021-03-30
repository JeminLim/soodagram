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

@Controller
@RequestMapping("/search")
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	private final SearchService searchService;
	
	@Inject
	public SearchController (SearchService searchService) {
		this.searchService = searchService;
	}
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> search(@RequestParam("keyword") String keyword) throws Exception {
		
		return searchService.search(keyword);
		
	}
	
	@RequestMapping(value = "/hashtag", method = RequestMethod.GET)
	public String getHashtagFeed(@RequestParam("hashtagName") String hashtagName, Model model, HttpServletRequest request) throws Exception {
		
		hashtagName = URLDecoder.decode(hashtagName, "UTF-8");
		
		logger.info(hashtagName + " searched");
		
		List<FeedVO> searchedFeed = searchService.getHashtagFeed(hashtagName);
		model.addAttribute("searchedFeed", searchedFeed);
		model.addAttribute("hashtagName", hashtagName);
		
		
		return "/main/hashtagSearch";
	}
	
	
}
