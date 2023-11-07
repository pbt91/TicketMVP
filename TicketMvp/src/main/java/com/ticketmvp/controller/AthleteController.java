package com.ticketmvp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ticketmvp.domain.AthleteVO;
import com.ticketmvp.service.AthleteService;

@Controller
@RequestMapping("athlete")
public class AthleteController {

	@Autowired
	private AthleteService athleteService;

	  @RequestMapping("main_page.do")
	    public String showMain(Model model) {
	        List<AthleteVO> athletes = athleteService.getAthleteImagePaths();
	        model.addAttribute("athletes", athletes);
	        return "main_page";
	    }

// athlete_information.do에 해당하는 메소드


	  @RequestMapping("athlete_information.do")
	  public String showAthleteInformation(@RequestParam("athletename") String athleteName, Model model) {
	      AthleteVO athlete = athleteService.getAthleteInformation(athleteName);
	      model.addAttribute("athlete", athlete);
	      return "athlete/athlete_information";
	  }
	}

