package com.ticketmvp.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketmvp.domain.AdminVO;


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
	
	// 티켓 및 경기  등록
	public void saveMatchTicket(AdminVO vo) {
	  System.out.println("===> Mybatis saveMatchTicket() 호출");
	  System.out.println(vo);
	  if(vo.getTicketname() == null || vo.getTicketname().equals("") ) {
		  System.out.println("insertMatch 탄다");
		  mybatis.insert("AdminDAO.insertMatch", vo);
	  }else {
	  mybatis.insert("AdminDAO.insertMatch", vo);
	  System.out.println(vo);
	  Integer lastMatchId = mybatis.selectOne("AdminDAO.getLastMatchId");
	  System.out.println("마지막 경기 아이디"+lastMatchId);
      if (lastMatchId != null ) { 
    	  System.out.println("널 아님 들어옴");
          vo.setMatchid(lastMatchId);
          System.out.println(vo);
          mybatis.insert("AdminDAO.saveMatchTicket", vo);
          Integer getLastTickId = mybatis.selectOne("AdminDAO.getLastTickId");
          vo.setTicketid(getLastTickId);
          System.out.println(getLastTickId);
          System.out.println( vo.getTicketall() ) ;
          for (int i = 0; i < vo.getTicketall(); i++) {
        	  mybatis.insert("AdminDAO.insertSeat", vo);
        	  System.out.println(getLastTickId);
          }
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
	
	// 경기 및 티켓 수정페이지 조회 
	public AdminVO ticketModify(AdminVO vo) {
		  System.out.println("===> Mybatis ticketModify() 호출");
		  System.out.println(vo);
		  return (AdminVO) mybatis.selectOne("AdminDAO.ticketModify",vo);
		  }
	
	// 경기 및 티켓 수정 
	public void updateMatchfrm(AdminVO vo) {
		  System.out.println("===> Mybatis updateMatchfrm() 호출");
		  System.out.println(vo);
		  if(vo.getTicketid() == null  ) {
			  mybatis.insert("AdminDAO.onlyInsertTiket", vo);
			    
		  }else {
			  mybatis.update("AdminDAO.updateMatchfrm", vo); 
		  } 
		  
		} 
	
	// 선수 이미지 및 정보 수정 
	public void athleteModifysubmit(AdminVO vo) {
		  System.out.println("===> Mybatis athleteModifysubmit() 호출 탔ㅇ으");
		  System.out.println(vo);
		  Integer result = mybatis.update("AdminDAO.athleteModifysubmit",vo);
		  System.out.println(result + "줄 수정완료");
	}
	
	// 선수 정보 및 이미지 수정 조회
	public AdminVO athleteModify(AdminVO vo) {
		System.out.println("===> Mybatis athleteModify() 호출");
		System.out.println(vo);
		return (AdminVO) mybatis.selectOne("AdminDAO.athleteModify",vo);
	}
	
//	public void onlyInsertTiket(AdminVO vo) {
//		mybatis.insert("AdminDAO.onlyInsertTiket",vo);
//	}
		  
	// 티켓 삭제 + 해당 티켓 삭제 전 좌석 삭제
	public int deleteTicket(Integer ticketId) {
		System.out.println(ticketId);
		Integer result = mybatis.delete("AdminDAO.deleteSeat",ticketId);
		System.out.println("===> Mybatis deleteSeat() 호출");
		System.out.println(result);
		return mybatis.delete("AdminDAO.deleteTicket",ticketId);
	}
	
	// 경기 삭제
	public int deleteMatch(Integer matchid) {
		System.out.println(matchid);
		return mybatis.delete("AdminDAO.deleteMatch",matchid);
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
	
	//클럽 등록 
	public void clubManage(AdminVO vo) {
		  System.out.println("===> Mybatis clubManage() 호출");
		  System.out.println(vo);
		mybatis.insert("AdminDAO.clubManage", vo);
	}
	
	//클럽삭제
	public int deleteClubname(String clubname) {
		System.out.println(clubname);
		return mybatis.delete("AdminDAO.deleteCLub",clubname);
	}
	
	// 클럽 수정 클럽 이름 기준으로 조회  clubModify
	public AdminVO clubModify(AdminVO vo) {
		System.out.println("===> Mybatis clubModify() 호출");
		System.out.println(vo);
		return (AdminVO) mybatis.selectOne("AdminDAO.clubModify",vo);
	}
	
	// 클럽 수정  clubManageModify
	public void clubManageModify(AdminVO vo) {
		  System.out.println("===> Mybatis clubManageModify() 호출");
		  System.out.println(vo);
		  System.out.println("Club value: " + vo.getClub());
		  Integer result = mybatis.update("AdminDAO.clubManageModify",vo);
		  System.out.println(result + "줄 수정완료");
		    // 추가: 결과 출력
		  System.out.println("결과: " + result);

		    // 추가: 실행한 쿼리 확인
		  System.out.println("실행한 쿼리: " + mybatis.getConfiguration().getMappedStatement("AdminDAO.clubManageModify").getBoundSql(vo).getSql());

	}
	
//	public List<AdminVO> athleteManagement(AdminVO vo) {
//		System.out.println("===> Mybatis athleteManagement() 호출");
//		return mybatis.selectList("AdminDAO.athleteManagement", vo);
//	}
//	
	
	// 차트 관련 함수
	public List<AdminVO> chartTicketClubData(AdminVO vo) {
		System.out.println("===> Mybatis chartTicketClubData() 호출");
		return mybatis.selectList("AdminDAO.chartTicketClubData", vo);
	}
	
	
}
	
	

