package com.ticketmvp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketmvp.domain.AthleteVO;

@Repository("athleteDAO") 
public class AthleteDAOImpl implements AthleteDAO{
	
	@Autowired
	 private SqlSessionTemplate mybatis;

	@Override
	public List<AthleteVO> getAllAthletes() { // 선수 정보 가져오기
		return null;
	}

	@Override
	public List<String> getAthleteImagePaths() {
		// TODO Auto-generated method stub
		return null;
	}

}
