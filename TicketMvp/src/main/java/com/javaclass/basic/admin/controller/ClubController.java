package com.javaclass.basic.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaclass.basic.admin.domain.AdminVO;
import com.javaclass.basic.admin.service.AdminService;

@Controller
public class ClubController {
	@Autowired
	private AdminService AdminService;
	
	@RequestMapping("clubRegister")
	public void clubRegister() {
		
	}
	

	@RequestMapping("clubModify")
	public void clubModify() {
		
	}
	
	@RequestMapping("clubManagement")
	public void clubManagement(AdminVO vo , Model model) {
		List<AdminVO> result = AdminService.clubManagement(vo);
		
		model.addAttribute("clubList",result);
	}


}
