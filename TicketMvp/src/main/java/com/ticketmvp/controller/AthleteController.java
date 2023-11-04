package com.ticketmvp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ticketmvp.service.AthleteService;



@Controller
@RequestMapping("athlete")
public class AthleteController {
	
	@Autowired
	private AthleteService athleteService;
	
	 @RequestMapping("main_page.do")
	 public String showMain(Model model) {
	        List<String> imagePaths = athleteService.getAthleteImagePaths();
	        model.addAttribute("imagePaths", imagePaths);
	        return "main_page";
	    }

}
