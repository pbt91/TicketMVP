package com.ticketmvp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketmvp.dao.UserDAO;
import com.ticketmvp.domain.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	// 아이디 중복확인
	public Integer selectIdCheck(String id) {
		Integer result = userDAO.selectIdCkeck(id);
		System.out.println(result.toString());
		return result;
	}
	
	// 회원가입
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}
	
	// 로그인 체크
	public String loginCheck(String id, String pw) {
		String result = (String) userDAO.loginCheck(id, pw);
		return result;
	}

	// 아이디 찾기
	public String findId(String email) {
		String result = userDAO.findId(email);
		return result;
	}
	
}
