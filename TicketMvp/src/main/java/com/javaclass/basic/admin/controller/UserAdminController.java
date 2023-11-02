package com.javaclass.basic.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaclass.basic.admin.domain.AdminVO;
import com.javaclass.basic.admin.service.AdminService;

@Controller
public class UserAdminController {

	@Autowired
	private AdminService AdminService;
	
	@RequestMapping("user")
	public void user(AdminVO vo , Model model) {
		List<AdminVO> result = AdminService.user(vo);
		
		model.addAttribute("userList",result);
		
	}
	@RequestMapping("/{step}.do")
	public String viewPage(@PathVariable String step) {
		return step;
	}
	
	@DeleteMapping("deleteUser")
	public int deleteUser(@PathVariable String uid) {
		return AdminService.deleteUser(uid);
		
	}

	

	
}
	

