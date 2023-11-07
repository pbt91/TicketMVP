package com.ticketmvp.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketmvp.domain.AdminVO;


@Repository("adminDAO")
public class AdminDAOImpl {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<AdminVO> user(AdminVO vo) {
		System.out.println("===> Mybatis user() 호출");
		return mybatis.selectList("AdminDAO.user", vo);
	}
	public int deleteUser(String uid) {
		System.out.println("===> Mybatis deleteUser() 호출");
		return mybatis.delete("AdminDAO.deleteUser", uid);
	}
	
	public List<AdminVO> athleteManagement(AdminVO vo) {
		System.out.println("===> Mybatis athleteManagement() 호출");
		return mybatis.selectList("AdminDAO.athleteManagement", vo);
	}
	public List<AdminVO> clubManagement(AdminVO vo) {
		System.out.println("===> Mybatis clubManagement() 호출");
		return mybatis.selectList("AdminDAO.clubManagement", vo);
	}
	
	public List<AdminVO> ticket(AdminVO vo) {
		System.out.println("===> Mybatis ticket() 호출");
		return mybatis.selectList("AdminDAO.ticket", vo);
	}
	
	
	public void ticketRegister1(AdminVO vo) {
	  System.out.println("===> Mybatis ticketRegister1() 호출");
	  mybatis.insert("AdminDAO.ticketRegister1", vo); 
	  }
	
	public void insertMatch(AdminVO vo) {
	  System.out.println("===> Mybatis insertMatch() 호출");
	  System.out.println(vo);
	  mybatis.insert("AdminDAO.insertMatch", vo); 
	  }
	
	public void insertTicket(AdminVO vo) {
		  System.out.println("===> Mybatis insertTicket() 호출");
		  System.out.println(vo);
		  mybatis.insert("AdminDAO.insertTicket", vo); 
		  }
	
	public AdminVO ticketModify(AdminVO vo) {
		  System.out.println("===> Mybatis ticketModify() 호출");
		  System.out.println(vo);
		  return (AdminVO) mybatis.selectOne("AdminDAO.ticketModify",vo);
		  }
	
	public void updateTiket(AdminVO vo) {
		  System.out.println("===> Mybatis updateTiket() 호출");
		  System.out.println(vo);
		  mybatis.update("AdminDAO.updateTiket", vo); 
		  }
	
	
}
