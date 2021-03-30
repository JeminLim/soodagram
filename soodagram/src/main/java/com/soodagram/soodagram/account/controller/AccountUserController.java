package com.soodagram.soodagram.account.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soodagram.soodagram.user.domain.UserVO;
import com.soodagram.soodagram.user.service.UserService;

@Controller
@RequestMapping("/main/account")
public class AccountUserController {
	
	private static final Logger logger = LoggerFactory.getLogger(AccountUserController.class);
	
	private final UserService userService;
	
	@Inject
	public AccountUserController (UserService userService) {
		this.userService = userService;
	}
	
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String getProfile(Model model, HttpServletRequest request) throws Exception {
		HttpSession httpSession = request.getSession();
		UserVO loginUser = (UserVO) httpSession.getAttribute("login");
		
		UserVO userVO = userService.getUserInfo(loginUser.getUserEmail());
		
		model.addAttribute("loginUser", userVO);
		
		
		return "/main/profile";
	}
	
	@RequestMapping(value = "/update", method = {RequestMethod.POST, RequestMethod.GET})
	public String updateProfile(UserVO userVO, RedirectAttributes redirectAttributes) throws Exception {
		
		userService.updateUserInfo(userVO);
		
		redirectAttributes.addFlashAttribute("msg", "Registered");
		
		return "redirect:/main/account/profile";
	}
	
	@RequestMapping(value= "/follow", method = RequestMethod.POST)
	@ResponseBody
	public int followUser(String targetEmail, Model model, HttpServletRequest request) throws Exception{
		HttpSession httpSession = request.getSession();
		UserVO loginUser = (UserVO) httpSession.getAttribute("login");
		
		Map<String, Object> input = new HashMap<>();
		input.put("loginEmail", loginUser.getUserEmail());
		input.put("targetEmail", targetEmail);
		
		int result = 0;
		
		if(userService.checkFollow(input) > 0) {
			userService.cancelFollow(input);
			result = 0;
		} else {
			userService.follow(input);
			result = 1;
		}
		
		return result;
	}
	
}
