package com.soodagram.soodagram.feed.service;

import java.util.List;
import java.util.Map;

import com.soodagram.soodagram.feed.domain.FeedVO;
import com.soodagram.soodagram.user.domain.UserVO;

public interface FeedService {
	void wrtieFeed(FeedVO feedVO) throws Exception;
	List<FeedVO> getMyFeed(UserVO userVO) throws Exception;
	List<FeedVO> getFollowingFeed(UserVO userVO) throws Exception;
	List<FeedVO> getMoreFeed(UserVO userVO, int minFeedNo) throws Exception;
}
