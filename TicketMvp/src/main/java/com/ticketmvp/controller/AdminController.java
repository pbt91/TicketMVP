package com.ticketmvp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ticketmvp.domain.AdminVO;
import com.ticketmvp.service.AdminService;

@Controller
@RequestMapping("/adminViewsJspFile")
public class AdminController {
	
	@Autowired
	private AdminService AdminService;
	
	@RequestMapping("/{step}.do")
	public String viewPage(@PathVariable String step) {
		return step;
	}
	
	@RequestMapping("/userAdmin.do")
	public void user(AdminVO vo , Model model) {
		List<AdminVO> result = AdminService.user(vo);
		model.addAttribute("userList",result);
		
	}
	@RequestMapping("/adminHome.do")
	public void adminMain() {
		
	}
	@RequestMapping("/athleteRegister.do")
	public void athleteRegister() {
		
	}
	
	@RequestMapping("/athleteModify.do")
	public void athleteModify() {
		
	}
	@RequestMapping("/athleteManagement.do")
	public void athleteManagement(AdminVO vo , Model model) {
		List<AdminVO> result = AdminService.athleteManagement(vo);
		
		model.addAttribute("athleteList",result);
	}
	
		
	@PostMapping("/deleteUser/{uid}")
	public int deleteUser(@PathVariable String uid) {
		return AdminService.deleteUser(uid);
		
	}
	
	@RequestMapping("/ticket.do")
	public void ticket(AdminVO vo , Model model) {
		List<AdminVO> result = AdminService.ticket(vo);
		
		model.addAttribute("ticketList",result);
		System.out.println("ticket.do");
	}
	
	@RequestMapping("/ticketRegister.do")
	public void ticketRegister() {
		
	}
	
	@RequestMapping("/ticketModify.do")
	public void ticketModify() {
		
	}
	
	@RequestMapping("/clubRegister.do")
	public void clubRegister() {
		
	}
	

	@RequestMapping("/clubModify.do")
	public void clubModify() {
		
	}
	
	@RequestMapping("/clubManagement.do")
	public void clubManagement(AdminVO vo , Model model) {
		List<AdminVO> result = AdminService.clubManagement(vo);
		
		model.addAttribute("clubList",result);
	}
	
	@RequestMapping("/index.do")
	public void index() {
		
	}
	
}
