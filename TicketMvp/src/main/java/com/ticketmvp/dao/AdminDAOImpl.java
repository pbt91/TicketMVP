package com.ticketmvp.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketmvp.domain.AdminVO;
import com.ticketmvp.domain.UserInquiryVO;


@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 유저 목록 호출
	public List<AdminVO> user(AdminVO vo) {
		System.out.println("===> Mybatis user() 호출");
		return mybatis.selectList("AdminDAO.user", vo);
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
	
	
	
	// 선수 등록
	public void athleteManage(AdminVO vo ) {
		  System.out.println("===> Mybatis athleteManage() 호출");
		  System.out.println(vo);
		mybatis.insert("AdminDAO.athleteManage", vo);
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
		  
	// 티켓 삭제
	public int deleteTicket(Integer ticketId) {
		System.out.println(ticketId);
		return mybatis.delete("AdminDAO.deleteTicket",ticketId);
	}
	
	// 선수 삭제
	public int deleteAthletename(String athletename) {
		System.out.println(athletename);
		return mybatis.delete("AdminDAO.deleteAthletename",athletename);
	}
	
	// 유저 삭제
	public int deleteUserid(String userid) {
		System.out.println(userid);
		return mybatis.delete("AdminDAO.deleteUserid",userid);
	}
	

	//관리자 페이지에서 문의 내용 불러오기
	public List<UserInquiryVO> handleInquiry(){
		System.out.println("===> Mybatis handleInquiry() 호출");
		return mybatis.selectList("AdminDAO.handleInquiry");
	}
}

	
	
	

