package com.ticketmvp.service;

import java.util.List;

import com.ticketmvp.domain.AthleteVO;
import com.ticketmvp.domain.MatchVO;

public interface AthleteService {
    List<AthleteVO> getAthleteImagePaths();
    
    AthleteVO getAthleteInformation(String athleteName);

	/* List<MatchVO> getAthleteMatches(String club); */
    
    List<MatchVO> getMatchesForClub(String club);
    
    
    void addLike(String userId, Integer matchId);

    void removeLike(String userId, Integer matchId);


    
}