package com.ticketmvp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketmvp.dao.ReserveDAOImpl;
import com.ticketmvp.domain.ReserveVO;


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
	
} 
