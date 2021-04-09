package com.soodagram.soodagram.user.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soodagram.soodagram.commons.util.UploadFileUtils;
import com.soodagram.soodagram.user.domain.UserVO;
import com.soodagram.soodagram.user.service.UserService;

@Controller
@RequestMapping("/profile")
public class UserProfileController {

	private static final Logger logger = LoggerFactory.getLogger(UserProfileController.class);
	
	private final UserService userService;
	
	@Inject
	public UserProfileController(UserService userService) {
		this.userService = userService;
	}

	// 유저 프로필 변경 페이지
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getProfile(Model model, HttpServletRequest request) throws Exception {
		HttpSession httpSession = request.getSession();
		UserVO loginUser = (UserVO) httpSession.getAttribute("login");
		
		UserVO userVO = userService.getUserInfo(loginUser.getUserEmail());
		
		model.addAttribute("loginUser", userVO);
		
		
		return "/profile/profileUpdate";
	}
	
	// 유저 프로필 수정 요청
	@RequestMapping(value = "", method = RequestMethod.PATCH)
	public String updateProfile(UserVO userVO, RedirectAttributes redirectAttributes) throws Exception {
		
		userService.updateUserInfo(userVO);
		
		redirectAttributes.addFlashAttribute("msg", "Updated");
		
		return "redirect:/profile/profileUpdate";
	}

	//유저 프로필 사진 업로드
	@RequestMapping(value="/img", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public @ResponseBody ResponseEntity<String> uploadUserImg(MultipartFile file, HttpServletRequest request) throws Exception {
		
		HttpSession httpSession = request.getSession();
		UserVO loginUser = (UserVO)httpSession.getAttribute("login");
		
		ResponseEntity<String> entity = null;
		try {
			String savedFilePath = UploadFileUtils.uploadFile(file, request);
			loginUser.setUserImg("/resources/dist/upload/media" + savedFilePath);
			userService.uploadUserImg(loginUser);			
			entity = new ResponseEntity<>(savedFilePath, HttpStatus.CREATED);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return entity;
	}
	
	
}
