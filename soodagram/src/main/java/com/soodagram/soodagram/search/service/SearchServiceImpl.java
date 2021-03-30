package com.soodagram.soodagram.search.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.soodagram.soodagram.feed.domain.FeedHashtagVO;
import com.soodagram.soodagram.feed.domain.FeedVO;
import com.soodagram.soodagram.feed.repository.FeedDAO;
import com.soodagram.soodagram.search.repository.SearchDAO;
import com.soodagram.soodagram.user.domain.UserVO;

@Service
public class SearchServiceImpl implements SearchService {

	private final SearchDAO searchDAO;
	private final FeedDAO feedDAO;
	
	@Inject
	public SearchServiceImpl(SearchDAO searchDAO, FeedDAO feedDAO) {
		this.searchDAO = searchDAO;
		this.feedDAO = feedDAO;
	}
	
	@Override
	public Map<String, Object> search(String keyword) throws Exception {
		
		char indicator = keyword.charAt(0);
		Map<String, Object> result = new HashMap<>();
		
		
		if(indicator == '@') {
			List<UserVO> resultUser = searchDAO.searchUser(keyword.substring(1));
			result.put("resultUser", resultUser);
		} else if(indicator == '#') {
			List<FeedHashtagVO> resultHashtag = searchDAO.searchHashtag(keyword.substring(1));
			result.put("resultHashtag", resultHashtag);
		} else {
			List<UserVO> resultUser = searchDAO.searchUser(keyword);
			result.put("resultUser", resultUser);
			List<FeedHashtagVO> resultHashtag = searchDAO.searchHashtag(keyword);
			result.put("resultHashtag", resultHashtag);
			
		}
		
		return result;
	}

	@Override
	public List<FeedVO> getHashtagFeed(String hashtagName) throws Exception {		
		return feedDAO.getHashtagFeed(hashtagName);
	}

}
