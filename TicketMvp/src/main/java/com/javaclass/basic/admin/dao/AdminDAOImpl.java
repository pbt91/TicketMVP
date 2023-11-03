package com.javaclass.basic.admin.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.basic.admin.domain.AdminVO;


@Repository("adminDAO")
public class AdminDAOImpl {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<AdminVO> user(AdminVO vo) {
		System.out.println("===> Mybatis user() 호출");
		return mybatis.selectList("AdminVO.user", vo);
	}
	public int deleteUser(String uid) {
		System.out.println("===> Mybatis deleteUser() 호출");
		return mybatis.delete("AdminVO.deleteUser", uid);
	}
	
	public List<AdminVO> athleteManagement(AdminVO vo) {
		System.out.println("===> Mybatis athleteManagement() 호출");
		return mybatis.selectList("AdminVO.athleteManagement", vo);
	}
	public List<AdminVO> clubManagement(AdminVO vo) {
		System.out.println("===> Mybatis clubManagement() 호출");
		return mybatis.selectList("AdminVO.clubManagement", vo);
	}
	
	public List<AdminVO> ticket(AdminVO vo) {
		System.out.println("===> Mybatis ticket() 호출");
		return mybatis.selectList("AdminVO.ticket", vo);
	}
}
