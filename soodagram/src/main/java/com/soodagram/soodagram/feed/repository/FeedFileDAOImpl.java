package com.soodagram.soodagram.feed.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.soodagram.soodagram.feed.domain.FeedFileVO;

@Repository
public class FeedFileDAOImpl implements FeedFileDAO {

	private static final String NAMESPACE = "com.soodagram.soodagram.mappers.feed.FeedFileMapper";
	
	private final SqlSession sqlSession;
	
	@Inject
	public FeedFileDAOImpl (SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void uploadFile(FeedFileVO feedFileVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".uploadFile", feedFileVO);		
	}

	@Override
	public List<String> getFileNames(int feedNo) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getFileList", feedNo);
	}

}
