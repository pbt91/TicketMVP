package com.ticketmvp.dao;

import com.ticketmvp.domain.UserVO;

public interface UserDAO {

	// 아이디 중복체크
	public Integer selectIdCkeck(String id);			 
	// 회원가입 
	public void insertUser(UserVO vo);				
	// 로그인 체크 
	public String loginCheck(String id, String pw);
	// 아이디 찾기 - 이메일 확인하기
	public String findId(String email);
	// 비밀번호 찾기 - 이름,이메일 확인하기
	public String findPw(UserVO vo);
	// 비밀번호 찾기 - 인증메일 보내기
	public void sendMail(UserVO vo);
	// 비밀번호 찾기 - 인증번호 확인하기
	public Integer checkTempPw(UserVO vo);
	// 비밀번호 재설정
	public Integer resetPw(UserVO vo);
	// 회원정보수정 - 현재비밀번호 확인하기 
	public String checkPw(UserVO vo);
	
	

}
