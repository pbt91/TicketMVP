package com.ticketmvp.dao;

import java.util.List;

import com.ticketmvp.domain.ReserveVO;


public interface ReserveDAO {
	public List<ReserveVO> getTicketList(ReserveVO vo) ;
}
