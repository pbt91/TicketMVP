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
	
	public void saveMatchTicket(AdminVO vo) {
	  System.out.println("===> Mybatis saveMatchTicket() 호출");
	  System.out.println(vo);
	  if(vo.getTicketname() == null) {
		  mybatis.insert("AdminDAO.insertMatch", vo);
	  }else {
	  mybatis.insert("AdminDAO.insertMatch", vo);
	  System.out.println(vo);
	  Integer lastMatchId = mybatis.selectOne("AdminDAO.getLastMatchId");
	  System.out.println("마지막 경기 아이디"+lastMatchId);
      if (lastMatchId != null) { 
    	  System.out.println("널 아님 들어옴");
          vo.setMatchid(lastMatchId);
          System.out.println(vo);
          mybatis.insert("AdminDAO.saveMatchTicket", vo);
      } else {
          System.out.println("Last match ID is null.");
      
      }
  }
	  
	}
	 
	
//	public void insertTicket(AdminVO vo) {
//		  System.out.println("===> Mybatis insertTicket() 호출");
//		  System.out.println(vo);
//		  mybatis.insert("AdminDAO.insertTicket", vo);
//		}
	
	public AdminVO ticketModify(AdminVO vo) {
		  System.out.println("===> Mybatis ticketModify() 호출");
		  System.out.println(vo);
		  return (AdminVO) mybatis.selectOne("AdminDAO.ticketModify",vo);
		  }
	
	public void updateMatchfrm(AdminVO vo) {
		  System.out.println("===> Mybatis updateMatchfrm() 호출");
		  System.out.println(vo);
		  if(vo.getTicketid() == null  ) {
			  mybatis.insert("AdminDAO.onlyInsertTiket", vo);
			    
		  }else {
			  mybatis.update("AdminDAO.updateMatchfrm", vo); 
		  } 
		  
		} 
//	public void onlyInsertTiket(AdminVO vo) {
//		mybatis.insert("AdminDAO.onlyInsertTiket",vo);
//	}
		  
	public int deleteTicket(Integer ticketId) {
		System.out.println(ticketId);
		return mybatis.delete("AdminDAO.deleteTicket",ticketId);
	}
	
	}
	
	

