package com.ticketmvp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	//좌석 예약으로 이동 + 티켓 리스트 불러오기 + 경기장 이미지 호출
	@RequestMapping("/ReserveChoose.do")
	public void reserveChoose(ReserveVO vo, Model m ) {
		m.addAttribute("ticketList", reserveService.getTicketList(vo));
		m.addAttribute("stadiumImage", reserveService.getImageFile(vo));
	}
	
	//예매 페이지로 이동
	@RequestMapping("/ReservePayment.do")
	public void reservePayment(Integer ticketId, Integer ticketQuantityBuy, Model m) {
		m.addAttribute("ticket", reserveService.getTicketInfo(ticketId));
		m.addAttribute("ticketId", ticketId);
		m.addAttribute("ticketQuantityBuy", ticketQuantityBuy); 
	}
	
	//결제완료 페이지로 이동
	@RequestMapping(value = "/ReserveFinish.do", method = RequestMethod.GET)
	public void reserveFinish(String orderId, Integer finalPrice, Integer ticketId, Model m){
		reserveService.recordAll(orderId, finalPrice, ticketId);
	}
}
