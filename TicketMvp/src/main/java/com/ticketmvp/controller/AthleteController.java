package com.ticketmvp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;

import com.ticketmvp.domain.AthleteVO;
import com.ticketmvp.domain.MatchVO;
import com.ticketmvp.service.AthleteService;

@Controller
@RequestMapping("athlete")
public class AthleteController {

	@Autowired
	private AthleteService athleteService;

// 메인페이지에서 선수 정보 띄우기
	@RequestMapping("main_page.do")
	public String showMain(Model model) {
		List<AthleteVO> athletes = athleteService.getAthleteImagePaths();
		model.addAttribute("athletes", athletes);
		return "main_page";
	}

// athlete_information 페이지에서 선수 이미지, 정보, 경기 일정 띄우기
	@RequestMapping("athlete_information.do")
	public String showAthleteInformation(@RequestParam("athletename") String athleteName, Model model) {
		
		// 선수 이미지, 정보 띄우기.
		AthleteVO athlete = athleteService.getAthleteInformation(athleteName);
		model.addAttribute("athlete", athlete);
		
		// 선수가 속한 구단의 경기 일정 가져오기
		List<MatchVO> matches =  athleteService.getMatchesForClub(athleteName);
		
		 model.addAttribute("matches", matches);
		 
		 System.out.println("Matches: " + matches);
		 
		return "athlete/athlete_information";
	}
	

}
