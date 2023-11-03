package com.ticketmvp.dao;
import java.util.List;

import com.ticketmvp.domain.AdminVO;


public interface AdminDAO {
	
	public List<AdminVO> selectUser(AdminVO vo) ;
	
	public String deleteUser(String uid);
	
	public List<AdminVO> selectAthlete(AdminVO vo) ;
	
	public List<AdminVO> selectClub(AdminVO vo) ;
	
	public List<AdminVO> selectTicket(AdminVO vo) ;
	
}
