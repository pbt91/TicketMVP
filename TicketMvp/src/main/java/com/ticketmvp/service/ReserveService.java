package com.ticketmvp.service;

import java.util.List;

import com.ticketmvp.domain.ReserveVO;

public interface ReserveService {
	
	//티켓 리스트 호출
	public List<ReserveVO> getTicketList(ReserveVO vo);

	//경기장 이미지 호출
	public ReserveVO getImageFile(ReserveVO vo);

}
