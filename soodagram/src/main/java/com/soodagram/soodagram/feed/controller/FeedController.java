package com.soodagram.soodagram.feed.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soodagram.soodagram.feed.service.FeedService;

@Controller
@RequestMapping("/main")
public class FeedController {

	private final FeedService feedService;
	
	@Inject
	public FeedController(FeedService feedService) {
		this.feedService = feedService;
	}
	
	@RequestMapping(value = "/feed", method = RequestMethod.GET)
	public String feedGET() throws Exception {
		return "/main/feed";
	}
	
}
