package com.ticketmvp.dao;

import com.ticketmvp.domain.UserVO;

public interface UserDAO {

	// 아이디 중복체크
	public Integer selectIdCkeck(String id);			 
	// 회원가입 
	public void insertUser(UserVO vo);				
	// 로그인 체크 
	public String loginCheck(String id, String pw);
	//아이디 찾기 - 이름,이메일 확인하기
	public String findId(String email);
	
}
