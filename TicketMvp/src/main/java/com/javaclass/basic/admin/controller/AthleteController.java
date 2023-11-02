package com.javaclass.basic.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaclass.basic.admin.domain.AdminVO;
import com.javaclass.basic.admin.service.AdminService;

@Controller
public class AthleteController {
	
	@Autowired
	private AdminService AdminService;
	

	
	@RequestMapping("athleteRegister")
	public void athleteRegister() {
		
	}
	
	@RequestMapping("athleteModify")
	public void athleteModify() {
		
	}
	@RequestMapping("athleteManagement")
	public void athleteManagement(AdminVO vo , Model model) {
		List<AdminVO> result = AdminService.athleteManagement(vo);
		
		model.addAttribute("athleteList",result);
	}

	
	
}
