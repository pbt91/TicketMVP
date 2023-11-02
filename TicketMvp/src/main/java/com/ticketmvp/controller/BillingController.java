package com.ticketmvp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/billing")
public class BillingController {
	
	//페이지 이동
	@RequestMapping("/{step}.do")
	public String viewPage(@PathVariable String step) {
		System.out.println("토스 테스트 이동");
		return "billing/"+step;
	}
}
