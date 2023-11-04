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
	
	//비밀먼호 찾기 - 아이디,이메일 매칭 확인하기
	String findPw(UserVO vo);
	
	//비밀번호 찾기 - 인증번호 확인하기
	Integer checkTempPw(UserVO vo);
	
	//비밀번호 재설정
	Integer resetPw(UserVO vo);
	
	//현재비밀번호 확인
	String checkPw(UserVO vo);
}
