package com.ticketmvp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ticketmvp.dao.AdminDAOImpl;
import com.ticketmvp.domain.AdminVO;
import com.ticketmvp.domain.UserInquiryVO;


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
	@Transactional
	public void saveMatchTicket(AdminVO vo) {
		System.out.println(vo.getTicketname());
		if(vo.getTicketname() != null && !vo.getTicketname().isEmpty()) {
			adminDAO.saveMatch(vo);
			vo.setMatchid(adminDAO.getMatchId(vo));
			adminDAO.saveTicket(vo);
			vo.setTicketid(adminDAO.getTicketId(vo));
			adminDAO.insertSeat(vo);
		} else {
			adminDAO.saveMatch(vo);
		}
	}

	// 티켓 및 경기 수정 조회
	public AdminVO ticketModify(AdminVO vo) {
		System.out.println(vo);
		return adminDAO.ticketModify(vo);
	}
	
	// 티켓 및 경기 수정
	public void updateMatchfrm(AdminVO vo) {
		System.out.println(vo);
		adminDAO.updateMatchfrm(vo); 
		}
	// 선수 수정 조회
	public AdminVO athleteModify(AdminVO vo) {
		System.out.println(vo);
		return adminDAO.athleteModify(vo) ; 
	}
	
	// 선수 수정
	public void athleteModifysubmit(AdminVO vo) {
		System.out.println(vo);
		adminDAO.athleteModifysubmit(vo);
	}
	
	// 티켓 삭제
	public Integer deleteTicket(Integer ticketId) {
		System.out.println(ticketId);
		return adminDAO.deleteTicket(ticketId );
	} 
	
	//경기 삭제
	public Integer deleteMatch(Integer matchid) {
		System.out.println(matchid);
		return adminDAO.deleteMatch(matchid );
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

	//관리자 페이지에서 문의 내용 불러오기
	public List<UserInquiryVO> handleInquiry() {
		return adminDAO.handleInquiry();
	}

	//문의 제목 클리하면 내용 가져오기
	public UserInquiryVO replyToInquiryForm(Integer helpid) {
		return adminDAO.replyToInquiryForm(helpid);
	}
	
	//문의 내용에 관리자 답변 등록
	public int replyToInquiry(Integer helpid, String replytext) {
		return adminDAO.replyToInquiry(helpid, replytext);
	}
	
	// 클럽 등록
	public void clubManage(AdminVO vo) {
		System.out.println(vo);
		adminDAO.clubManage(vo);
	}
	
	// 클럽 삭제
	public Integer deleteClubname(String clubname) {
		System.out.println(clubname);
		return adminDAO.deleteClubname(clubname);
	}
	
	// 클럽 수정 조회
	public AdminVO clubModify(AdminVO vo) {
		System.out.println(vo);
		return adminDAO.clubModify(vo) ; 
	}
	
	// 클럽 수정
	public void clubManageModify(AdminVO vo) {
		System.out.println(vo);
		adminDAO.clubManageModify(vo);
	}
	
	// 차트 관련
	public List<AdminVO> chartTicketClubData(AdminVO vo) {
		return adminDAO.chartTicketClubData(vo);
	}

}
