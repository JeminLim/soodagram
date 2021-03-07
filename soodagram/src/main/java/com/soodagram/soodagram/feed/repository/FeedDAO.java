package com.soodagram.soodagram.feed.repository;

import java.util.List;
import java.util.Map;

import com.soodagram.soodagram.feed.domain.FeedVO;
import com.soodagram.soodagram.user.domain.UserVO;

public interface FeedDAO {
	void writeFeed(FeedVO feedVO) throws Exception;
	List<FeedVO> getMyFeed(UserVO userVO) throws Exception;
	List<FeedVO> getFollowingFeed(UserVO userVO) throws Exception;
	List<FeedVO> getMoreFeed(Map<String, Object> followFeedCondition) throws Exception;
}
