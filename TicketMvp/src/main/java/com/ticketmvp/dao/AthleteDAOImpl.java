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

	//모든 경기 불러오기
	@Override
	public List<MatchVO> getAllMatches() {
		System.out.println("===> Mybatis getAllMatches() 호출");
		return mybatis.selectList("com.ticketmvp.dao.AthleteDAO.getAllMatches");
	}
	
	@Override
    public void addLike(String userId, Integer matchId) {
        mybatis.insert("com.ticketmvp.dao.AthleteDAO.addLike", new LikeDTO(userId, matchId));
    }
	
    @Override
    public void removeLike(String userId, Integer matchId) {
        mybatis.delete("com.ticketmvp.dao.AthleteDAO.removeLike", new LikeDTO(userId, matchId));
    }

    // LikeDTO 클래스 추가
    private static class LikeDTO {
        private String userId;
        private Integer matchId;

        public LikeDTO(String userId, Integer matchId) {
            this.userId = userId;
            this.matchId = matchId;
        }

        public String getUserId() {
            return userId;
        }

        public Integer getMatchId() {
            return matchId;
        }
    }

    @Override
    public List<MatchVO> checkLikeStatus(String userId) {
    	List<MatchVO> count = mybatis.selectList("com.ticketmvp.dao.AthleteDAO.checkLikeStatus", userId);
        return count;
    }

}

