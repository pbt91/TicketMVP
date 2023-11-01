package com.ticketmvp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketmvp.domain.UserVO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	

	// 아이디 중복체크
	@Override
	public Integer selectIdCkeck(String id) {
		System.out.println("===> Mybatis selectIdCheck() 호출");
		System.out.println(id);
		String userid = mybatis.selectOne("UserDAO.selectidcheck", id);
		System.out.println(userid);
		Integer result;
		if(userid != null) { result = 1; }
		else { result = 0; }
		return result; 
		
	}
	
	// 회원가입
	@Override
	public void insertUser(UserVO vo) {
		System.out.println("===> Mybatis insertUser() 호출");
		System.out.println(vo.toString());		
		mybatis.insert("UserDAO.insertuser", vo);
	}

}
