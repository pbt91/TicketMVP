package com.ticketmvp.service;

import java.util.List;

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

	//유저가 소유한 쿠폰 목록 불러오기
		public List<ReserveVO> selectCoupons(String userId) {
			return reserveDAO.selectCoupons(userId);
		}
	
	//유저정보 호출
	public UserVO getUserInfo(String userId, UserVO vo) {
		return reserveDAO.getUserInfo(userId, vo);
	}
		
	//예매/결재 후 예약테이블에 정보 입력 + 예약번호를 모든 해당 좌석에 정보넣기+결제 수량 만큼 티켓 수 없애기+ 쿠폰사용(쿠폰 적용시)
	@Transactional
	public void recordAll(String orderId, Integer totalAmount, Integer ticketId, Integer ticketQuantity, String userId, String couponId, String orderName, Integer ticketPrice) {
		reserveDAO.recordReservation(orderId, totalAmount, userId, ticketQuantity, orderName, ticketPrice);
		int tickets = reserveDAO.recordSeat(orderId, ticketId, ticketQuantity);
		reserveDAO.deductTickets(tickets, ticketId);
		if (couponId != null && !couponId.isEmpty() && !couponId.equals("undefined")){
			reserveDAO.updateCoupon(couponId, orderId);
			reserveDAO.updateReservationDiscount(orderId);
		};
	}

	//예매id 중복체크
	public int checkOrderId(int orderId) {
		return reserveDAO.checkOrderId(orderId);
	}
	
	
} 
