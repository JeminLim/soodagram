package com.soodagram.soodagram.feed.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.soodagram.soodagram.feed.domain.FeedVO;

public interface FeedService {
	void wrtieFeed(FeedVO feedVO) throws Exception;
}
