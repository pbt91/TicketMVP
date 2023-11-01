package com.ticketmvp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.ticketmvp.domain.ReserveVO;



@Repository("reserveDAO") 
public class ReserveDAOImpl implements ReserveDAO{
	@Autowired
	private SqlSessionTemplate mybatis;

	//경기 선택한 상태에서 해당 경기 예약 가능 티켓 호출
	public List<ReserveVO> getTicketList(ReserveVO vo) {
		System.out.println("===> Mybatis getTicketList() 호출");
		return mybatis.selectList("ReserveDAO.getTicketList", vo);
	}

	//경기장 이미지 호출
	public ReserveVO getImageFile(ReserveVO vo) {
		System.out.println("===> Mybatis getImageList() 호출");
		return mybatis.selectOne("ReserveDAO.getImageFile", vo);
	}

	//예매/결재 확인 페이지에 결재할 티켓 정보 호출
	public ReserveVO getTicketInfo(int ticketId) {
		System.out.println("===> Mybatis getTicketInfo 호출");
		return mybatis.selectOne("ReserveDAO.getTicketInfo",ticketId);
	}
	

}