package com.ticketmvp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ticketmvp.domain.ReserveVO;
import com.ticketmvp.service.ReserveService;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	@Autowired
	private ReserveService reserveService;


	
	//페이지 이동
	@RequestMapping("/{step}.do")
	public String viewPage(@PathVariable String step) {
		return "reserve/"+step;
	}
	
	
	//좌석 예약으로 이동 + 티켓 리스트 불러오기
	@RequestMapping("/ReserveChoose.do")
	public void reserveChooseList(ReserveVO vo, Model m ) {
		m.addAttribute("ticketList", reserveService.getTicketList(vo));
	}
	
	//경기장 이미지
	@RequestMapping("/ReserveMap.do")
	public String reserveMapChange(ReserveVO vo, Model m){
		m.addAttribute("imgFile", reserveService.getImageFile(vo));
		return "redirect:/reserve/ReserveMap.do";
	}		
}
