package com.ticketmvp.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ticketmvp.dao.ReserveDAOImpl;
import com.ticketmvp.domain.ReserveVO;
import com.ticketmvp.domain.UserVO;


@Service("reserveService")
public class ReserveServiceImpl implements ReserveService {
	@Autowired
	private ReserveDAOImpl reserveDAO;

	
	//경기 선택한 상태에서 해당 경기 예약 가능 티켓 호출
	public List<ReserveVO> getTicketList(ReserveVO vo) {
		return reserveDAO.getTicketList(vo);
	}


	//경기장 이미지 호출
	public ReserveVO getImageFile(ReserveVO vo) {
		return reserveDAO.getImageFile(vo);
	}

	//예매/결재 확인 페이지에 결재할 티켓 정보 호출
	public ReserveVO getTicketInfo(int ticketId) {
		return reserveDAO.getTicketInfo(ticketId);
	}


	//예매/결재 후 예약테이블에 정보 입력 + 예약번호를 모든 해당 좌석에 정보넣기+결제 수량 만큼 티켓 수 없애기
	@Transactional
	public void recordAll(String orderId, Integer totalAmount, Integer ticketId, Integer ticketQuantity, String userId) {
		reserveDAO.recordReservation(orderId, totalAmount, userId);
		int tickets = reserveDAO.recordSeat(orderId, ticketId, ticketQuantity);
		reserveDAO.deductTickets(tickets, ticketId);
	}

	//유저정보 호출
	public UserVO getUserInfo(String userId, UserVO vo) {
		return reserveDAO.getUserInfo(userId, vo);
	}
	
} 
