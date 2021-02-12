package com.soodagram.soodagram.user.repository;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.soodagram.soodagram.user.domain.LoginDTO;
import com.soodagram.soodagram.user.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	private static final String NAMESPACE = "com.soodagram.soodagram.mappers.user.UserMapper";
	
	private final SqlSession sqlSession;
	
	@Inject
	public UserDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void register(UserVO userVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".register", userVO);
	}

	@Override
	public int duplicateEmail(String userEmail) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".duplicateEmail", userEmail);
	}

	@Override
	public int duplicateId(String userId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".duplicateId", userId);
	}

	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".login", loginDTO);
	}

}
