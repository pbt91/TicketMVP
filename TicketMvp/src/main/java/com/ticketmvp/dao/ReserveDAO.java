package com.ticketmvp.dao;

import java.util.List;

import com.ticketmvp.domain.ReserveVO;


public interface ReserveDAO {
	//경기 선택한 상태에서 해당 경기 예약 가능 티켓 호출
	public List<ReserveVO> getTicketList(ReserveVO vo) ;
	
	//경기장 이미지 호출
	public ReserveVO getImageFile(ReserveVO vo);
}
