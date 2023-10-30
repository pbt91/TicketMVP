package com.ticketmvp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ticketmvp.domain.UserVO;
import com.ticketmvp.service.UserService;

@Controller
@RequestMapping("/user")
//@RestController
public class UserController {

	@Autowired
	private UserService userservice;
	
	
	// 메인 -> 회원가입폼
	@RequestMapping("/{step}.do")
	public String viewPage(@PathVariable String step) {
		return "user/"+step;
	}
	
	// 회원가입폼_아이디중복체크
	@PostMapping("/userIdCheck")
	@ResponseBody
	public Integer idCheck(@RequestParam("id") String id) {
		Integer idCheckResult = userservice.selectIdCheck(id);
		
		return idCheckResult;
	}
	
	// 회원가입폼 -> 디비저장 -> 회원가입완료페이지
	@RequestMapping("/insertUser.do")
	public void insertUser(UserVO vo) {
		userservice.insertUser(vo);
	}
}
