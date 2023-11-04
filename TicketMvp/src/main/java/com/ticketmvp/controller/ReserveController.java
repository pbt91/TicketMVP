package com.ticketmvp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ticketmvp.domain.ReserveVO;
import com.ticketmvp.domain.UserVO;
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
	public ModelAndView reservePayment(Integer ticketId, Integer ticketQuantityBuy, HttpSession session, UserVO vo, Model m) {
		ModelAndView mv = new ModelAndView();
		String userId = (String) session.getAttribute("userid");
		if (userId != null && !userId.trim().isEmpty()) {
			m.addAttribute("ticket", reserveService.getTicketInfo(ticketId));
			m.addAttribute("ticketId", ticketId);
			m.addAttribute("ticketQuantityBuy", ticketQuantityBuy);
			m.addAttribute("userInfo", reserveService.getUserInfo(userId, vo));
			mv.setViewName("reserve/ReservePayment");
		} else {
			mv.setViewName("redirect:/error/NoLogin.do");
		}
		
		return mv;
	}
	
	//결제완료 페이지로 이동
	@RequestMapping(value = "/ReserveFinish.do", method = RequestMethod.GET)
	public void reserveFinish(String orderId,  Integer amount, Integer ticketId, Integer ticketQuantity, String userId, Model m){;
		reserveService.recordAll(orderId, amount, ticketId, ticketQuantity, userId);
	}
}
