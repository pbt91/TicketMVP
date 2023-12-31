package com.ticketmvp.dao;
import java.util.List;

import com.ticketmvp.domain.AdminVO;
import com.ticketmvp.domain.UserInquiryVO;


public interface AdminDAO {
	
	// 유저 목록
	public List<AdminVO> user(AdminVO vo) ;
	
	// 선수 목록
	public List<AdminVO> athleteManagement(AdminVO vo) ;
	
	// 클럽 목록
	public List<AdminVO> clubManagement(AdminVO vo) ;
	
	// 티켓 및 경기 입력
	public void saveTicket(AdminVO vo) ;
	
	// 티켓 및 경기 입력
	public void saveMatch(AdminVO vo) ;
	
	// 경시 matchid 호출
	public int getMatchId(AdminVO vo);
	
	//좌석 ticketid 호출
	public int getTicketId(AdminVO vo);
	
	//티켓 및 경기 수정 조회
	public AdminVO ticketModify(AdminVO vo);
	
	// 경기 수정
	public void updateMatchfrm(AdminVO vo) ;
	
	// 티켓 수정
	//public void updateTiket(AdminVO vo) ;
	
	// 티켓 삭제
	public int deleteTicket(Integer ticketId) ; 
	
	// 선수 등록
	public void athleteManage(AdminVO vo);
	
	// 선수 삭제
	public int deleteAthletename(String deleteAthlete);
	
	// 유저 삭제
	public int deleteUserid(String userid);
	
	//관리자 페이지에서 문의내용 불러오기
	public List<UserInquiryVO> handleInquiry();
	
	//문의 제목 클리하면 내용 가져오기
	public UserInquiryVO replyToInquiryForm(Integer helpid);
	
	//문의 내용에 관리자 답변 등록
	public int replyToInquiry(Integer helpid, String replytext);
	// 선수 수정 조회
	public AdminVO athleteModify(AdminVO vo);
	
	// 선수 수정
	public void athleteModifysubmit(AdminVO vo) ; 
	
	// c차트 관련
	public List<AdminVO> chartTicketClubData(AdminVO vo) ;
	
	// 클럽 수정 조회
	public AdminVO clubModify(AdminVO vo);
	
	// 클럽 수정
	public void clubManageModify(AdminVO vo) ; 
	
	// 클럽 등록
	public void clubManage(AdminVO vo);
	
	// 클럽 삭제
	public int deleteClubname(String clubname);

}
