package com.ticketmvp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		List<MatchVO> matches = athleteService.getMatchesForClub(athleteName);
		model.addAttribute("matches", matches);

		System.out.println("Matches: " + matches);

		return "athlete/athlete_information";
	}
	// ***************************************************** //

	// 예매 버튼 클릭 시 matchId를 세션에 저장하고 ReserveChoose 페이지로 리다이렉트
	@RequestMapping(value = "/storeMatchIdInSession", method = RequestMethod.POST)
	@ResponseBody
	public void storeMatchIdInSession(@RequestParam("matchId") Integer matchId, HttpSession session) {
		session.setAttribute("selectedMatchId", matchId); //
		System.out.println("matchId를 세션에 저장했습니다: " + matchId);
	}

	  @RequestMapping("/ReserveChoose.do")
	    public String showReserveChoosePage(@RequestParam("matchId") Integer matchId, HttpSession session) {
	        session.setAttribute("selectedMatchId", matchId);

	        System.out.println("사용자가 선택한 matchId: " + matchId);

	      
	        return "reserve/ReserveChoose";
	    }
	  
	  
	  
	// 찜 추가 및 삭제 메서드에서 사용자 ID를 세션에서 가져오도록 수정
	  @RequestMapping(value = "/addLike", method = RequestMethod.POST)
	  @ResponseBody
	  public ResponseEntity<String> addLike(@RequestParam("matchId") Integer matchId, HttpSession session) {
	      try {
	          String userId = (String) session.getAttribute("userid");
	          athleteService.addLike(userId, matchId);
	          return ResponseEntity.ok("찜 추가 성공");
	      } catch (Exception e) {
	          return ResponseEntity.status(500).body("찜 추가 실패");
	      }
	  }

	  @RequestMapping(value = "/removeLike", method = RequestMethod.POST)
	  @ResponseBody
	  public ResponseEntity<String> removeLike(@RequestParam("matchId") Integer matchId, HttpSession session) {
	      try {
	          String userId = (String) session.getAttribute("userid");
	          athleteService.removeLike(userId, matchId);
	          return ResponseEntity.ok("찜 삭제 성공");
	      } catch (Exception e) {
	          return ResponseEntity.status(500).body("찜 삭제 실패");
	      }
	  }
	}