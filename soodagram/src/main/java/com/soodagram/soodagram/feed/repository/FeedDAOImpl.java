package com.soodagram.soodagram.feed.repository;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.soodagram.soodagram.feed.domain.FeedVO;
import com.soodagram.soodagram.user.domain.UserVO;

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

	@Override
	public List<FeedVO> getMyFeed(UserVO userVO) throws Exception {		
		return sqlSession.selectList(NAMESAPCE + ".getMyFeed", userVO);
	}
	
	@Override
	public List<FeedVO> getFollowingFeed(UserVO userVO) throws Exception {
		return sqlSession.selectList(NAMESAPCE + ".getFollowingFeed", userVO);
	}

	@Override
	public List<FeedVO> getMoreFeed(Map<String, Object> followFeedCondition) throws Exception {
		
		return sqlSession.selectList(NAMESAPCE + ".getMoreFeed", followFeedCondition);
	}

	
	
}
