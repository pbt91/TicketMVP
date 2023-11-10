package com.ticketmvp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketmvp.dao.AthleteDAO;
import com.ticketmvp.domain.AthleteVO;
import com.ticketmvp.domain.MatchVO;

@Service("athleteService")
public class AthleteServiceImpl implements AthleteService {

	@Autowired
	private AthleteDAO athleteDAO;

	@Override
	public List<AthleteVO> getAthleteImagePaths() {
		return athleteDAO.getAthleteImagePaths();
	}

	@Override
	public AthleteVO getAthleteInformation(String athleteName) {
		return athleteDAO.getAthleteInformation(athleteName);
	} // 여기까지는 건드리지 말기

	@Override
	public List<MatchVO> getMatchesForClub(String athleteName) {
		return athleteDAO.getMatchesForClub(athleteName);
	}

	//모든 경기 불러오기
	@Override
	public List<MatchVO> getAllMatches() {
		return athleteDAO.getAllMatches();
	}
	
	@Override
	public void addLike(String userId, Integer matchId) {
		athleteDAO.addLike(userId, matchId);
	}

	@Override
	public void removeLike(String userId, Integer matchId) {
		athleteDAO.removeLike(userId, matchId);
	}

	@Override
	public List<MatchVO> checkLikeStatus(String userId, Integer matchId) {
		 return athleteDAO.checkLikeStatus(userId, matchId);
	}

}

