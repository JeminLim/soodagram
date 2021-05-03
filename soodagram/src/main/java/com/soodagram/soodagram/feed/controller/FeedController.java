package com.soodagram.soodagram.feed.controller;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.soodagram.soodagram.commons.util.UploadFileUtils;
import com.soodagram.soodagram.feed.domain.FeedVO;
import com.soodagram.soodagram.feed.service.FeedService;
import com.soodagram.soodagram.user.domain.UserVO;

/**
 * 피드 컨트롤러
 * 피드 작성 관련 컨트롤러
 * @author jeminLim
 * @version 1.0
 */

@Controller
@RequestMapping("/feed")
public class FeedController {

	private static final Logger logger = LoggerFactory.getLogger(FeedController.class);
	
	private final FeedService feedService;
	
	@Inject
	public FeedController(FeedService feedService) {
		this.feedService = feedService;
	}	
	
	/**
	 * 피드 등록
	 * @param feedVO
	 * @param request
	 * @return redirect profile page
	 * @throws Exception
	 */
	@RequestMapping(value="/post", method = RequestMethod.POST)
	public String uploadFeed(FeedVO feedVO, HttpServletRequest request) throws Exception {
		// 작성자(로그인) 유저 정보
		HttpSession httpSession = request.getSession();
		UserVO loginUser = (UserVO) httpSession.getAttribute("login");
		
		feedVO.setUserEmail(loginUser.getUserEmail());
		feedVO.setUserVO(loginUser);
		
		// 피드 컨텐츠 등록
		feedService.wrtieFeed(feedVO);
		
		return "redirect:/user/" + loginUser.getUserId();
	}
	
	/**
	 * 피드 사진 업로드
	 * @param file
	 * @param request
	 * @return response entity
	 * @throws Exception
	 */
	@RequestMapping(value="/post/img", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> uploadFile(MultipartFile file, HttpServletRequest request) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			String savedFilePath = UploadFileUtils.uploadFile(file,  request);
			entity = new ResponseEntity<>(savedFilePath, HttpStatus.CREATED);
		} catch ( Exception e ) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * 피드 작성중인 사진 삭제
	 * @param fileName
	 * @param request
	 * @return response entity
	 * @throws Exception
	 */
	@RequestMapping(value="/post/img", method = RequestMethod.DELETE)
	@ResponseBody 
	public ResponseEntity<String> deleteFile(@RequestBody String fileName, HttpServletRequest request) throws Exception {
		ResponseEntity<String> entity = null;		
		try {
			String rootPath = UploadFileUtils.getRootPath(request);
			UploadFileUtils.deleteFile(fileName, rootPath);
			entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;		
	}
	
	/**
	 * 썸네일 사진
	 * @param fileName
	 * @param request
	 * @return responseEntity
	 * @throws Exception
	 */
	@RequestMapping(value="/thumbnail", method = RequestMethod.GET)
	@ResponseBody 
	public ResponseEntity<byte[]> display(@RequestParam("fileName") String fileName, HttpServletRequest request) throws Exception {	
		
		HttpHeaders httpHeaders = UploadFileUtils.getHttpHeaders(fileName);
		String rootPath = UploadFileUtils.getRootPath(request);
		ResponseEntity<byte[]> entity = null;
		
		try (InputStream inputstream = new FileInputStream(rootPath + fileName)) {
			entity = new ResponseEntity<>(IOUtils.toByteArray(inputstream), httpHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;		
	}	

	/**
	 * 피드 전체 삭제
	 * @param feedNo
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping(value="/{feedNo}", method = RequestMethod.DELETE)
	@ResponseBody
	public void deleteFeed(@PathVariable("feedNo") int feedNo, HttpServletRequest request) throws Exception {	
		String rootPath = UploadFileUtils.getRootPath(request);		
		feedService.deleteFeed(feedNo, rootPath);		
		logger.info("feed - " + feedNo + "deleted");		
	}	
	
	
}
