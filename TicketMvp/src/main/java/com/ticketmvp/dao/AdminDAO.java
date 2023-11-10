package com.ticketmvp.dao;
import java.util.List;

import com.ticketmvp.domain.AdminVO;


public interface AdminDAO {
	
	// 유저 목록
	public List<AdminVO> user(AdminVO vo) ;
	
	// 선수 목록
	public List<AdminVO> athleteManagement(AdminVO vo) ;
	
	// 클럽 목록
	public List<AdminVO> clubManagement(AdminVO vo) ;
	
	// 티켓 및 경기 입력
	//public void insertTicket(AdminVO vo) ;
	public void saveMatchTicket(AdminVO vo) ;
	
	//티켓 및 경기 수정 조회
	public AdminVO ticketModify(AdminVO vo);
	
	// 경기 수정
	public void updateMatchfrm(AdminVO vo) ;
	
	// 티켓 수정
	//public void updateTiket(AdminVO vo) ;
	
	public int deleteTicket(Integer ticketId) ; 
	
	// 선수 등록
	public void athleteManage(AdminVO vo);
	
	// 선수 삭제
	public int deleteAthletename(String deleteAthlete);
	
	// 유저 삭제
	public int deleteUserid(String userid);
	
	// 선수 수정 조회
	public AdminVO athleteModify(AdminVO vo);
	
	public void athleteModifysubmit(AdminVO vo) ; 
	
	// c차트 관련
	public List<AdminVO> chartTicketClubData(AdminVO vo) ;

}
