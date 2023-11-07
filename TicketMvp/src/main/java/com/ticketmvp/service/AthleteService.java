package com.ticketmvp.service;

import java.util.List;

import com.ticketmvp.domain.AthleteVO;

public interface AthleteService {
    List<AthleteVO> getAthleteImagePaths();
    
    AthleteVO getAthleteInformation(String athleteName);
}