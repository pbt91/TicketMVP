package com.ticketmvp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ticketmvp.domain.AthleteVO;

public interface AthleteDAO {
	
    List<AthleteVO> getAthleteImagePaths();
    
    AthleteVO getAthleteInformation(@Param("athletename") String athleteName);
}
