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
	public void insertTicket(AdminVO vo) ;
	
	public void insertMatch(AdminVO vo) ;
	
	//티켓 및 경기 수정
	public AdminVO ticketModify(AdminVO vo);
	
	public void updateTiket(AdminVO vo) ;
	
}
