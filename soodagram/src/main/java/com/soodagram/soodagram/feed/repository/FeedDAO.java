package com.soodagram.soodagram.feed.repository;

import com.soodagram.soodagram.feed.domain.FeedVO;

public interface FeedDAO {
	void writeFeed(FeedVO feedVO) throws Exception;
}
