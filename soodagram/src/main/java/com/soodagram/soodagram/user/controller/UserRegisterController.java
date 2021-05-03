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

/**
 * 회원가입 페이지 컨트롤러
 * 회원가입, 제약조건 확인 관련
 * @author jeminLim
 * @version 1.0
 */
@Controller
@RequestMapping("/user/regist")
public class UserRegisterController {
	
	private final UserService userService;
	
	@Inject
	public UserRegisterController(UserService userService) {
		this.userService = userService;
	}
	
	/**
	 * 회원가입 페이지 열람
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="", method=RequestMethod.GET)
	public String registerGET() throws Exception {
		return "/user/register";
	}
	
	/**
	 * 회원가입 처리
	 * @param userVO
	 * @param model
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="", method=RequestMethod.POST)
	public String registerPOST(UserVO userVO, Model model, RedirectAttributes redirectAttributes) throws Exception {
		
		// 비밀번호 해시 생성 및 등록
		String hashedPw = BCrypt.hashpw(userVO.getUserPw(), BCrypt.gensalt());
		userVO.setUserPw(hashedPw);
		
		// 회원가입
		userService.register(userVO);
		redirectAttributes.addFlashAttribute("msg", "Registered");		
		
		return "redirect:/user/login";
	}	
		
	/**
	 * 이메일 중복 체크 함수
	 * @param userEmail
	 * @return number of duplicate email
	 */
	@RequestMapping(value="/check/email", method=RequestMethod.POST)
	@ResponseBody 
	public int duplicateEmail(String userEmail){		
		try {			
			int result = userService.duplicateEmail(userEmail);
			return result;			
		} catch (Exception e) {			
			e.printStackTrace();
			return -1;			
		}		
	}
	
	/**
	 * 아이디 중복체크 함수
	 * @param userId
	 * @return number of duplicate id
	 */
	@RequestMapping(value="/check/id", method=RequestMethod.POST)
	@ResponseBody 
	public int duplicateId(String userId){		
		try {			
			int result = userService.duplicateId(userId);
			return result;			
		} catch (Exception e) {			
			e.printStackTrace();
			return -1;			
		}		
	}
	
}
