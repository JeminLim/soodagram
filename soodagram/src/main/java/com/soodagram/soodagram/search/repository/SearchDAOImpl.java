package com.soodagram.soodagram.search.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.soodagram.soodagram.feed.domain.FeedHashtagVO;
import com.soodagram.soodagram.feed.domain.FeedVO;
import com.soodagram.soodagram.user.domain.UserVO;

@Repository
public class SearchDAOImpl implements SearchDAO {

	private static final String NAMESPACE = "com.soodagram.soodagram.mappers.search.SearchMapper";
	
	private final SqlSession sqlSession;
	
	@Inject
	public SearchDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public List<UserVO> searchUser(String keyword) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".searchUser", keyword);
	}

	@Override
	public List<FeedHashtagVO> searchHashtag(String keyword) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".searchHashtag", keyword);
	}
}
