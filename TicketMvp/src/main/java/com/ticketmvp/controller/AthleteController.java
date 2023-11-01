package com.ticketmvp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ticketmvp.domain.AthleteVO;
import com.ticketmvp.service.AthleteService;

@Controller
@RequestMapping("/athlete")
public class AthleteController {
	
	@Autowired
	private AthleteService athleteService;
	
	 @RequestMapping("/main")
	    public String showMain(Model model) {
		 List<String> imagePaths = athleteService.getAthleteImagePaths();
	        model.addAttribute("imagePaths", imagePaths);
	        return "main";
	    }

}
