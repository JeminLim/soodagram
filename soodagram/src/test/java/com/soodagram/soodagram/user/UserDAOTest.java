package com.soodagram.soodagram.user;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.soodagram.soodagram.user.domain.UserVO;
import com.soodagram.soodagram.user.repository.UserDAO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserDAOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDAOTest.class);
	
	@Inject
	private UserDAO userDAO;
	
	@Test
	public void testRegist() throws Exception {
		UserVO user = new UserVO();
		user.setUserEmail("testmail@mail.com");
		user.setUserName("tester");
		user.setUserId("testId");
		user.setUserPw("1111");
		userDAO.register(user);
	}
	@Test
	public void testDuplicateEmail() throws Exception {
		logger.info(Integer.toString(userDAO.duplicateEmail("testmail@mail.com")));
	}
	
	@Test
	public void testDuplicateId() throws Exception {
		logger.info(Integer.toString(userDAO.duplicateId("testId")));
	}
}
