package com.soodagram.soodagram.user;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.soodagram.soodagram.reply.domain.ReplyVO;
import com.soodagram.soodagram.reply.repository.ReplyDAO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReplyDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(ReplyDAOTest.class);
	
	@Inject
	private ReplyDAO replyDAO;
	
	/*
	@Test
	public void testWrtie() throws Exception {
		for(int i = 0; i < 9; i++) {
			ReplyVO reply = new ReplyVO();
			reply.setContent("testReply " + i);
			reply.setUserEmail("sooda02@mail.com");		
			reply.setUserId("sooda02");
			reply.setFeedNo(43);
			replyDAO.writeReply(reply);
		}
	}
	*/
	
	
	 @Test public void testGet() throws Exception {
		 logger.info(replyDAO.getReply(43).get(0).toString()); 
	 }
	 
	
}
