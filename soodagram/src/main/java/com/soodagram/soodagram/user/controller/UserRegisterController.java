package com.soodagram.soodagram.user.controller;

import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soodagram.soodagram.user.domain.UserVO;
import com.soodagram.soodagram.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserRegisterController {
	
	private final UserService userService;
	
	@Inject
	public UserRegisterController(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registerGET() throws Exception {
		return "/user/register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(UserVO userVO, Model model, RedirectAttributes redirectAttributes) throws Exception {
				
		String hashedPw = BCrypt.hashpw(userVO.getUserPw(), BCrypt.gensalt());
		userVO.setUserPw(hashedPw);
		userService.register(userVO);
		redirectAttributes.addFlashAttribute("msg", "Registered");
		
		
		return "redirect:/user/login";
	}
	
	@RequestMapping(value="/duplicateEmail", method=RequestMethod.POST)
	@ResponseBody 
	public int duplicateEmail(String userEmail){
		
		try {
			
			int result = userService.duplicateEmail(userEmail);
			return result;
			
		} catch (Exception e) {			
			e.printStackTrace();
			int errorResult = -1;
			return errorResult;			
		}
		
	}
	
	@RequestMapping(value="/duplicateId", method=RequestMethod.POST)
	@ResponseBody 
	public int duplicateId(String userId){

		System.out.println(userId);
		
		try {
			
			int result = userService.duplicateId(userId);
			System.out.println(result);
			return result;
			
		} catch (Exception e) {			
			e.printStackTrace();
			int errorResult = -1;
			return errorResult;			
		}
		
	}
	
}
