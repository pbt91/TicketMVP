package com.ticketmvp.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ticketmvp.domain.AthleteVO;
import com.ticketmvp.domain.MatchVO;

@Repository("athleteDAO")
public class AthleteDAOImpl implements AthleteDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<AthleteVO> getAthleteImagePaths() {
		return mybatis.selectList("com.ticketmvp.dao.AthleteDAO.getAthleteImagePaths");
	}

	@Override
	public AthleteVO getAthleteInformation(String athleteName) {
		return mybatis.selectOne("com.ticketmvp.dao.AthleteDAO.getAthleteInformation", athleteName);
	}// 선수 이미지, 선수 정보

	@Override
	public List<MatchVO> getMatchesForClub(String athletename) {
		System.out.println("파라미터 선수이름: "+athletename);
		
		String club = mybatis.selectOne("com.ticketmvp.dao.AthleteDAO.getMatchesAthleteClub", athletename);
		System.out.println("클럽명 : "+club);
		
		List<MatchVO> result = mybatis.selectList("com.ticketmvp.dao.AthleteDAO.getMatchesForClub", club);
		System.out.println("경기일정 "+result.toString());
		return result;
	}

	/*
	 * @Override public List<MatchVO> getAthleteMatches(String club) { return
	 * mybatis.selectList("com.ticketmvp.dao.AthleteDAO.getAthleteMatches", club); }
	 */

}
