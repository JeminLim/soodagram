package com.soodagram.soodagram.feed.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soodagram.soodagram.commons.util.UploadFileUtils;
import com.soodagram.soodagram.feed.domain.FeedFileVO;
import com.soodagram.soodagram.feed.domain.FeedHashtagVO;
import com.soodagram.soodagram.feed.domain.FeedVO;
import com.soodagram.soodagram.feed.repository.FeedDAO;
import com.soodagram.soodagram.feed.repository.FeedFileDAO;
import com.soodagram.soodagram.feed.repository.FeedHashtagDAO;
import com.soodagram.soodagram.feed.repository.FeedLikeDAO;
import com.soodagram.soodagram.user.domain.UserVO;

/**
 * 피드 관련 서비스 구현체
 * 피드 작성, 열람, 소셜 기능 구현
 * @author jeminLim
 * @version 1.0
 */
@Service
public class FeedServiceImpl implements FeedService {

	private final FeedDAO feedDAO;
	private final FeedFileDAO feedFileDAO;
	private final FeedHashtagDAO feedHashtagDAO;
	private final FeedLikeDAO feedLikeDAO;
	
	@Inject
	public FeedServiceImpl(FeedDAO feedDAO, FeedFileDAO feedFileDAO, FeedHashtagDAO feedHashtagDAO,FeedLikeDAO feedLikeDAO) {
		this.feedDAO = feedDAO;
		this.feedFileDAO = feedFileDAO;
		this.feedHashtagDAO = feedHashtagDAO;
		this.feedLikeDAO = feedLikeDAO;
	}
	
	/**
	 * 피드 작성 함수
	 */
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
				word = "<a href=" + "/search/hashtag?hashtag=" + word + ">" + word + "</a>";
			}
			convertedContent += (word + " ");
		}
		
		// 컨텐츠 등록
		feedVO.setContent(convertedContent);
		feedDAO.writeFeed(feedVO);
		
		//해시태그 등록
		for(String hashtagName: hashtags) {
			FeedHashtagVO hashtagInput = new FeedHashtagVO();
			hashtagInput.setFeedNo(feedVO.getFeedNo());
			hashtagInput.setHashtagName(hashtagName);
			feedHashtagDAO.writeHashtag(hashtagInput);
		}
		
		//피드 첨부파일 등록
		String[] files = feedVO.getFiles();
		
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

	/**
	 * 로그인 사용자 작성 피드 리스트 
	 */
	@Override
	public List<FeedVO> getMyFeed(UserVO userVO) throws Exception {
		return feedDAO.getMyFeed(userVO);
	}

	/**
	 * 팔로잉 유저 작성 피드 리스트
	 */
	@Override
	public List<FeedVO> getFollowingFeed(Map<String, Object> input) throws Exception {
		return feedDAO.getFollowingFeed(input);
	}

	/**
	 * 피드 좋아요 표시
	 */
	@Override
	public void insertLike(Map<String, Object> likeInput) throws Exception {
		feedLikeDAO.insertLike(likeInput);		
	}

	/**
	 * 피드 좋아요 취소
	 */
	@Override
	public void cancelLike(Map<String, Object> likeInput) throws Exception {
		feedLikeDAO.cancelLike(likeInput);
		
	}

	/**
	 * 피드 좋아요 여부 확인
	 */
	@Override
	public int duplicateCheck(Map<String, Object> likeInput) throws Exception {
		return feedLikeDAO.duplicateCheck(likeInput);
	}

	/**
	 * 작성 피드 삭제
	 */
	@Override
	public void deleteFeed(int feedNo, String rootPath) throws Exception {
		
		List<FeedFileVO> fileNames = feedFileDAO.getFileNames(feedNo);
		
		for(FeedFileVO file : fileNames) {
			UploadFileUtils.deleteFile(file.getFileName(), rootPath);
		}	
		
		feedDAO.deleteFeed(feedNo);		
	}

	/**
	 * 좋아요 갯수 확인
	 */
	@Override
	public int countLikeNo(int feedNo) throws Exception {
		return feedLikeDAO.countLikeNo(feedNo);
	}


	
	
	
	
}
