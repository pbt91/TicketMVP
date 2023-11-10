package com.ticketmvp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ticketmvp.domain.AthleteVO;
import com.ticketmvp.domain.MatchVO;

public interface AthleteDAO {
	
    List<AthleteVO> getAthleteImagePaths();
    
    AthleteVO getAthleteInformation(@Param("athletename") String athleteName);

	/* List<MatchVO> getAthleteMatches(String club); */

    //모든 경기 불러오기
    List<MatchVO> getAllMatches();
    
    List<MatchVO> getMatchesForClub(String club);

    void addLike(@Param("userId") String userId, @Param("matchId") Integer matchId);

    void removeLike(@Param("userId") String userId, @Param("matchId") Integer matchId);

    List<MatchVO> checkLikeStatus(String userId,  Integer matchId);

}
