package com.soodagram.soodagram.feed.repository;

import java.util.List;

import com.soodagram.soodagram.feed.domain.FeedFileVO;

public interface FeedFileDAO {
	void uploadFile(FeedFileVO feedFileVO) throws Exception;
	List<String> getFileNames(int feedNo) throws Exception;
}
