package com.soodagram.soodagram.account.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Iterator;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.soodagram.soodagram.commons.util.UploadFileUtils;
import com.soodagram.soodagram.feed.domain.FeedVO;
import com.soodagram.soodagram.feed.service.FeedService;

@Controller
@RequestMapping("/main/account")
public class AccountFeedController {

	private final FeedService feedService;
	
	@Inject
	public AccountFeedController(FeedService feedService) {
		this.feedService = feedService;
	}
	
	@RequestMapping(value= "", method = RequestMethod.GET)
	public String accountGET() throws Exception {
		return "/main/account";
	}
	
	@RequestMapping(value="/upload", method = RequestMethod.POST)
	public String uploadFeed(FeedVO feedVO) throws Exception {
		
		// 피드 컨텐츠 등록
		feedService.wrtieFeed(feedVO);
		
		return "redirect:/main/account";
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<String> deleteFile(String fileName, HttpServletRequest request) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			UploadFileUtils.deleteFile(fileName, request);
			entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	@RequestMapping(value="/uploadFile", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public @ResponseBody ResponseEntity<String> uploadFile(MultipartFile file, HttpServletRequest request) throws Exception {
		System.out.println("called");
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
	
	@RequestMapping(value="/display", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<byte[]> display(@RequestParam("fileName") String fileName, HttpServletRequest request) throws Exception {
		HttpHeaders httpHeaders = UploadFileUtils.getHttpHeaders(fileName);
		String rootPath = UploadFileUtils.getRootPath(fileName, request);
		ResponseEntity<byte[]> entity = null;
		
		try (InputStream inputstream = new FileInputStream(rootPath + fileName)) {
			entity = new ResponseEntity<>(IOUtils.toByteArray(inputstream), httpHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
}
