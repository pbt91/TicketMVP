package com.ticketmvp.service;

import com.ticketmvp.domain.UserVO;

public interface UserService {
	
	//아이디 중복확인
	Integer selectIdCheck(String id);
	
	//회원가입
	void insertUser(UserVO vo);
	
}