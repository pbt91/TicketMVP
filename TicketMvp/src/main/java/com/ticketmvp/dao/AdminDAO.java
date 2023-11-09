package com.ticketmvp.dao;
import java.util.List;

import com.ticketmvp.domain.AdminVO;


public interface AdminDAO {
	
	// 유저 목록
	public List<AdminVO> selectUser(AdminVO vo) ;
	
	
	public void deleteUser(String uid);
	
	// 선수 목록
	public List<AdminVO> selectAthlete(AdminVO vo) ;
	
	// 클럽 목록
	public List<AdminVO> selectClub(AdminVO vo) ;
	
	// 티켓 및 경기 입력
	//public void insertTicket(AdminVO vo) ;
	public void saveMatchTicket(AdminVO vo) ;
	
	//티켓 및 경기 수정 리스트
	public AdminVO ticketModify(AdminVO vo);
	
	// 경기 수정
	public void updateMatchfrm(AdminVO vo) ;
	
	// 티켓 수정
	//public void updateTiket(AdminVO vo) ;
	
	public int deleteTicket(Integer ticketId) ; 
	
	// 선수 등록
	public void athleteManage(AdminVO vo);
	
	// 선수 삭제
	public String deleteAthlete(String deleteAthlete);
}
