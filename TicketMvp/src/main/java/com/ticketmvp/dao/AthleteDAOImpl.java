package com.ticketmvp.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ticketmvp.domain.AthleteVO;

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
    }
}
