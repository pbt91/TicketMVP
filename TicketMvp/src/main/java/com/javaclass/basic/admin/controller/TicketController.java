package com.javaclass.basic.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaclass.basic.admin.domain.AdminVO;
import com.javaclass.basic.admin.service.AdminService;

@Controller
public class TicketController {
	
	@Autowired
	private AdminService AdminService;
	
	@RequestMapping("ticket")
	public void ticket(AdminVO vo , Model model) {
		List<AdminVO> result = AdminService.ticket(vo);
		
		model.addAttribute("ticketList",result);
	}
	
	@RequestMapping("ticketRegister")
	public String ticketRegister() {
		
		return "ticketRegister";
	}
	
	@RequestMapping("ticketModify")
	public void ticketModify() {
		
	}


	
}
