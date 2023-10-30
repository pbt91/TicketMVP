package com.ticketmvp.service;

import java.util.List;

import com.ticketmvp.domain.ReserveVO;

public interface ReserveService {

	public List<ReserveVO> getTicketList(ReserveVO vo);

	public ReserveVO getImageFile(ReserveVO vo);

}
