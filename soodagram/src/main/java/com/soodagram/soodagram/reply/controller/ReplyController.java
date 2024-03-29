package com.soodagram.soodagram.reply.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soodagram.soodagram.reply.domain.ReplyVO;
import com.soodagram.soodagram.reply.service.ReplyService;
import com.soodagram.soodagram.user.domain.UserVO;

/**
 * 댓글 관련 컨트롤러
 * 댓글 등록 및 열람
 * @author jeminLim
 * @version 1.0
 */
@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	private final ReplyService replyService;
	
	@Inject
	public ReplyController(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	/**
	 * 해당 피드에 뎃글 등록
	 * @param feedNo
	 * @param replyVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/{feedNo}", method = RequestMethod.POST)
	@ResponseBody
	public List<ReplyVO> writeReply(@PathVariable("feedNo") int feedNo, ReplyVO replyVO, HttpServletRequest request) throws Exception{
		
		// 이용자 식별
		HttpSession httpSession = request.getSession();
		UserVO loginUser = (UserVO) httpSession.getAttribute("login");
		replyVO.setUserEmail(loginUser.getUserEmail());
		replyVO.setUserId(loginUser.getUserId());
		
		replyService.writeReply(replyVO);
		
		List<ReplyVO> reply = new ArrayList<>();
		reply.add(replyVO);
		
		return reply;
		
			
	}
	
	/**
	 * 해당 피드 댓글 열람
	 * @param feedNo
	 * @param loadNum
	 * @param curPage
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/{feedNo}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getReply(@PathVariable("feedNo") int feedNo, @RequestParam("loadNum")int loadNum, @RequestParam("curPage") int curPage) throws Exception {
		Map<String, Object> getInput = new HashMap<>();
		getInput.put("feedNo", feedNo);
		getInput.put("loadNum", loadNum);
		getInput.put("curPage", curPage);
		
		List<ReplyVO> reply = replyService.getReply(getInput);
		Collections.reverse(reply);
		Map<String, Object> result = new HashMap<>();
		result.put("code", "success");
		result.put("replyList", reply);
				
		return result;
	}
	
}
