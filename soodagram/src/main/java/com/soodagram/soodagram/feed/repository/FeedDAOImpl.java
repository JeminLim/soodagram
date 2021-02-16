package com.soodagram.soodagram.feed.repository;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.soodagram.soodagram.feed.domain.FeedVO;

@Repository
public class FeedDAOImpl implements FeedDAO {

	private static final String NAMESAPCE = "com.soodagram.soodagram.mappers.feed.FeedMapper";
	
	private final SqlSession sqlSession;
	
	@Inject
	public FeedDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void writeFeed(FeedVO feedVO) throws Exception {
		sqlSession.insert(NAMESAPCE + ".writeFeed", feedVO);
	}

	
	
}
