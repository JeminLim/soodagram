package com.soodagram.soodagram.feed.repository;

import com.soodagram.soodagram.feed.domain.FeedHashtagVO;

public interface FeedHashtagDAO {
	void writeHashtag(String hashtagName) throws Exception;
}
