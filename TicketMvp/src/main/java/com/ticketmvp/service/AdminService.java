package com.ticketmvp.service;
import java.util.List;

import com.ticketmvp.domain.AdminVO;
import com.ticketmvp.domain.UserInquiryVO;


public interface AdminService {

	// 회원 목록 조회
	List<AdminVO> user(AdminVO vo);


	// 선수 목록 조회
	List<AdminVO> athleteManagement(AdminVO vo);

	// 구단 목록 조회
	List<AdminVO> clubManagement(AdminVO vo);

	// 티켓 목록 조회
	List<AdminVO> ticket(AdminVO vo);

	// 티켓 등록
	void saveMatchTicket(AdminVO vo); 
	// void insertTicket(AdminVO vo); 

	// 티켓 및 경기 수정 조회
	AdminVO ticketModify(AdminVO vo); 

	//  티켓 및 경기 수정 
	void updateMatchfrm(AdminVO vo);

	// 티켓 삭제 
	Integer deleteTicket (Integer ticketId) ; 

	//경기 삭제
	Integer deleteMatch (Integer matchid) ; 

	// 선수삭제
	Integer deleteAthletename(String athletename);

	// 선수 등록
	void athleteManage(AdminVO vo) ; 

	// 유저 삭제
	Integer deleteUserid(String userid);

	//관리자 페이지에서 문의 내용 불러오기
	public List<UserInquiryVO> handleInquiry();

	//문의 제목 클리하면 내용 가져오기
	public UserInquiryVO replyToInquiryForm(Integer helpid);

	//문의 내용에 관리자 답변 등록
	public int replyToInquiry(Integer helpid, String replytext);

	// 선수 수정 조회
	AdminVO athleteModify(AdminVO vo);

	// 선수 수정  
	void athleteModifysubmit(AdminVO vo) ;

	// 클럽 등록 
	void clubManage(AdminVO vo); 

	// 클럽 삭제 
	Integer deleteClubname(String clubname);

	// 클럽 수정 조회
	AdminVO clubModify(AdminVO vo) ; 

	// 클럽 수정
	void clubManageModify(AdminVO vo);

	// 차트 관련 
	List<AdminVO> chartTicketClubData(AdminVO vo);

}
