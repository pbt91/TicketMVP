package com.ticketmvp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketmvp.dao.AdminDAOImpl;
import com.ticketmvp.domain.AdminVO;


@Service("adminservice")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAOImpl adminDAO;
	
	public List<AdminVO> user(AdminVO vo) {
		return adminDAO.user(vo);
	}
	
	public List<AdminVO> athleteManagement(AdminVO vo) {
		return adminDAO.athleteManagement(vo);
	}
	
	public List<AdminVO> clubManagement(AdminVO vo) {
		return adminDAO.clubManagement(vo);
	}
	
	public List<AdminVO> ticket(AdminVO vo) {
		return adminDAO.ticket(vo);
	}
	
	//선수 등록 
	public void athleteManage(AdminVO vo) {
		System.out.println(vo);
		adminDAO.athleteManage(vo);
	}
	
	// 티켓,경기 입력
//	public void insertTicket(AdminVO vo) {
//		adminDAO.insertTicket(vo); 
//		}
	public void saveMatchTicket(AdminVO vo) {
		adminDAO.saveMatchTicket(vo); 
		}

	// 티켓 및 경기 수정 리스트
	public AdminVO ticketModify(AdminVO vo) {
		System.out.println(vo);
		return adminDAO.ticketModify(vo);
	}
	
	// 매치 수정 서브 밋
	public void updateMatchfrm(AdminVO vo) {
		System.out.println(vo);
		adminDAO.updateMatchfrm(vo); 
		}
	
//	public void onlyInsertTiket(AdminVO vo) {
//		System.out.println(vo);
//		adminDAO.onlyInsertTiket(vo); 
//		}
	
	// 티켓 삭제
	public Integer deleteTicket(Integer ticketId) {
		System.out.println(ticketId);
		return adminDAO.deleteTicket(ticketId );
	} 
	
	// 선수 삭제
	public Integer deleteAthletename(String athletename) {
		System.out.println(athletename);
		return adminDAO.deleteAthletename(athletename );
	}
	
	// 유저 삭제
	public Integer deleteUserid(String userid) {
		System.out.println(userid);
		return adminDAO.deleteUserid(userid );
	}
}
