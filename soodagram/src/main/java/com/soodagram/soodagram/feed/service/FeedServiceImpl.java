package com.soodagram.soodagram.feed.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soodagram.soodagram.feed.domain.FeedFileVO;
import com.soodagram.soodagram.feed.domain.FeedVO;
import com.soodagram.soodagram.feed.repository.FeedDAO;
import com.soodagram.soodagram.feed.repository.FeedFileDAO;
import com.soodagram.soodagram.feed.repository.FeedHashtagDAO;
import com.soodagram.soodagram.user.domain.UserVO;

@Service
public class FeedServiceImpl implements FeedService {

	private final FeedDAO feedDAO;
	private final FeedFileDAO feedFileDAO;
	private final FeedHashtagDAO feedHashtagDAO;
	
	@Inject
	public FeedServiceImpl(FeedDAO feedDAO, FeedFileDAO feedFileDAO, FeedHashtagDAO feedHashtagDAO) {
		this.feedDAO = feedDAO;
		this.feedFileDAO = feedFileDAO;
		this.feedHashtagDAO = feedHashtagDAO;
	}
	
	@Transactional
	@Override
	public void wrtieFeed(FeedVO feedVO) throws Exception {		
		// 단어 분리
		String[] splitedContent = feedVO.getContent().split(" ");
		// 해시태그 추출
		List<String> hashtags = new ArrayList<String>();
		
		// 링크 변환된 컨텐츠
		String convertedContent = "";
		
		// 해시태그 단어 링크 치환
		for(String word : splitedContent) {
			// #으로 시작하는 요소들만 리스트에 삽입
			if(word.indexOf("#") == 0) {
				hashtags.add(word);
				word = "<a href=" + "#" + ">" + word + "</a>";
			}
			convertedContent += (word + " ");
		}
		
		feedVO.setContent(convertedContent);
		feedDAO.writeFeed(feedVO);
		
		//해시태그 등록
		for(String hashtagNmae: hashtags) {
			feedHashtagDAO.writeHashtag(hashtagNmae);
		}
		
		String[] files = feedVO.getFiles();
		// 파일 첨부가 없을 때
		if (files == null) {
			return;
		}
			
		for (String fileName : files) {
			FeedFileVO feedFileVO = new FeedFileVO();
			feedFileVO.setFeedNo(feedVO.getFeedNo());	
			feedFileVO.setFileName(fileName);
			feedFileDAO.uploadFile(feedFileVO);
		}
		
	}

	@Override
	public List<FeedVO> getMyFeed(UserVO userVO) throws Exception {
		return feedDAO.getMyFeed(userVO);
	}

	@Override
	public List<FeedVO> getFollowingFeed(UserVO userVO) throws Exception {
		return feedDAO.getFollowingFeed(userVO);
	}
	
	@Override
	public List<FeedVO> getMoreFeed(UserVO userVO, int minFeedNo) throws Exception {
		Map<String, Object> input = new HashMap<String, Object>();
		input.put("user", userVO);
		input.put("maxFeedNo", minFeedNo);
		
		return feedDAO.getMoreFeed(input);
	}
}
