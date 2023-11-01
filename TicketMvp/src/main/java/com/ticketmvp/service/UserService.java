package com.ticketmvp.service;

import com.ticketmvp.domain.UserVO;

public interface UserService {
	
	//아이디 중복확인
	Integer selectIdCheck(String id);
	
	//회원가입
	void insertUser(UserVO vo);
	
	//로그인 체크
	String loginCheck(String id, String pw);
	
	//아이디 찾기 - 이메일 확인하기
	String findId(String email);
	
}
