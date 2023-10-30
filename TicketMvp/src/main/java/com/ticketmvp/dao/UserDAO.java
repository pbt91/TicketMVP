package com.ticketmvp.dao;

import com.ticketmvp.domain.UserVO;

public interface UserDAO {


	public Integer selectIdCkeck(String id);			// 아이디 중복체크 

	public void insertUser(UserVO vo);				// 회원가입 
	

}
