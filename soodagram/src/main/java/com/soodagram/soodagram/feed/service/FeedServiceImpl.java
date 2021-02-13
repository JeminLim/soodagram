package com.soodagram.soodagram.feed.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.soodagram.soodagram.feed.domain.FeedVO;
import com.soodagram.soodagram.feed.repository.FeedDAO;

@Service
public class FeedServiceImpl implements FeedService {

	private final FeedDAO feedDAO;
	
	@Inject
	public FeedServiceImpl(FeedDAO feedDAO) {
		this.feedDAO = feedDAO;
	}
	
	@Override
	public void wrtieFeed(FeedVO feedVO) throws Exception {
		feedDAO.writeFeed(feedVO);
	}

}
