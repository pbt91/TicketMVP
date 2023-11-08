package com.ticketmvp.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ticketmvp.domain.ReserveVO;
import com.ticketmvp.domain.UserVO;

public interface ReserveService {
	
	//티켓 리스트 호출
	public List<ReserveVO> getTicketList(ReserveVO vo);

	//경기장 이미지 호출
	public ReserveVO getImageFile(ReserveVO vo);
	
	//예매/결재 확인 페이지에 결재할 티켓 정보 호출
	public ReserveVO getTicketInfo(int ticketId);
	
	//유저가 소유한 쿠폰 목록 불러오기
	public List<ReserveVO> selectCoupons(String userId);
	
	//예매/결재 후 예약테이블에 정보 입력 + 예약번호를 모든 해당 좌석에 정보넣기+결제 수량 만큼 티켓 수 없애기
	public void recordAll(String orderId, Integer totalAmount, Integer ticketId, Integer ticketQuantity, String userId, String couponId, String orderName, Integer ticketPrice);
	
	//유저정보 호출
	public UserVO getUserInfo(String userId, UserVO vo);

	//예매id 중복체크
	public int checkOrderId(int orderId);

}
