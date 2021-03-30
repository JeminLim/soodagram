package com.soodagram.soodagram.reply.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.soodagram.soodagram.reply.domain.ReplyVO;
import com.soodagram.soodagram.reply.repository.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	private final ReplyDAO replyDAO;
	
	@Inject
	public ReplyServiceImpl (ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public void writeReply(ReplyVO replyVO) throws Exception {
		replyDAO.writeReply(replyVO);
	}

	@Override
	public List<ReplyVO> getReply(Map<String, Object> getInput) throws Exception {		
		return replyDAO.getReply(getInput);
	}

}
