package com.ticketmvp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketmvp.dao.AthleteDAO;
import com.ticketmvp.domain.AthleteVO;

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
    }
}