package com.soodagram.soodagram.feed.repository;

import com.soodagram.soodagram.feed.domain.FeedFileVO;

public interface FeedFileDAO {
	void uploadFile(FeedFileVO feedFileVO) throws Exception;
}
