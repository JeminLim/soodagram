package com.soodagram.soodagram.feed.repository;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.soodagram.soodagram.feed.domain.FeedHashtagVO;

@Repository
public class FeedHashtagDAOImpl implements FeedHashtagDAO {

	private static final String NAMESPACE = "com.soodagram.soodagram.mappers.feed.FeedHashtagMapper";
	
	private final SqlSession sqlSession;
	
	@Inject
	public FeedHashtagDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void writeHashtag(FeedHashtagVO hashtagVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".writeHashtag", hashtagVO);
	}

}
