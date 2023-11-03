package com.ticketmvp.service;
import java.util.List;

import com.ticketmvp.domain.AdminVO;


public interface AdminService {
	
	// 회원 목록 조회
	List<AdminVO> user(AdminVO vo);
	
	//회원 목록 삭제
	int deleteUser(String uid);
	
	// 선수 목록 조회
	List<AdminVO> athleteManagement(AdminVO vo);
	
	// 구단 목록 조회
	List<AdminVO> clubManagement(AdminVO vo);
	
	// 티켓 목록 조회
	List<AdminVO> ticket(AdminVO vo);
	
		
	
}
