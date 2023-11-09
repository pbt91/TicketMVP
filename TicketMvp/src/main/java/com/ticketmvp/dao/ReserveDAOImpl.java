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

	@Override
	public List<ReserveVO> getTicketList(ReserveVO vo) {
		System.out.println("===> Mybatis getTicketList() 호출");
		return mybatis.selectList("ReserveDAO.getTicketList", vo);
	}
	

}