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
	public void reserveChoose(ReserveVO vo, Model m, HttpSession session ) {
		m.addAttribute("ticketList", reserveService.getTicketList(vo));
		m.addAttribute("stadiumImage", reserveService.getImageFile(vo));
		session.setAttribute("paymentInProgress", true);
	}
	
	//티켓 예매 확인 작업
	@RequestMapping(value = "/ReserveConfirm.do", method = RequestMethod.POST)
	public String reserveConfirm(Integer ticketId, Integer ticketQuantityBuy, HttpSession session) {
	    // 세션에 tickedId와 수량 정보 저장
	    session.setAttribute("ticketId", ticketId);
	    session.setAttribute("ticketQuantityBuy", ticketQuantityBuy);

	    // 결재로 이동
	    return "redirect:/reserve/ReservePayment.do";
	}
	
	//예매 페이지로 이동
	@RequestMapping("/ReservePayment.do")
	public ModelAndView reservePayment(HttpSession session, UserVO vo, Model m) {
		ModelAndView mv = new ModelAndView();
		String userId = (String) session.getAttribute("userid");
		Integer ticketId = (Integer) session.getAttribute("ticketId");
		Integer ticketQuantityBuy = (Integer) session.getAttribute("ticketQuantityBuy");
		
		//로그인 안했으면 에러페이지로 강제이동
		if (userId == null || userId.trim().isEmpty()) {
	        mv.setViewName("redirect:/error/NoLogin.do");
	        return mv;
	    }
		
		//좌석예매 페이지에서 정보 넘겨 받지 못하면 다시 돌아가기
		if (ticketId == null || ticketId == 0|| ticketQuantityBuy == null || ticketQuantityBuy == 0) {
	        mv.setViewName("redirect:/reserve/ReserveChoose.do?matchid=1");
	        return mv;
	    }
		
		//이미 결재했으면 좌석화면으로 강제이동
		Boolean paymentInProgress = (Boolean) session.getAttribute("paymentInProgress");
	    if (paymentInProgress != null && !paymentInProgress) {
	        mv.setViewName("redirect:/athlete/main_page.do"); 
	        return mv;
	    }
		
	    //전의 좌석선택화면에서 정보(유저정보 포함) 불러오기
		m.addAttribute("ticket", reserveService.getTicketInfo(ticketId));
		m.addAttribute("ticketId", ticketId);
		m.addAttribute("ticketQuantityBuy", ticketQuantityBuy);
		m.addAttribute("userInfo", reserveService.getUserInfo(userId, vo));
		m.addAttribute("paymentInProgress", paymentInProgress);
		mv.setViewName("/reserve/ReservePayment");
		
		return mv;
	}
		
	//결제완료 페이지로 이동
	@RequestMapping(value = "/ReserveFinish.do", method = RequestMethod.GET)
	public ModelAndView reserveFinish(String orderId, Integer amount, HttpSession session, Model m){
		ModelAndView mv = new ModelAndView();
		Boolean paymentInProgress = (Boolean) session.getAttribute("paymentInProgress");
		String userId = (String) session.getAttribute("userid");
		Integer ticketId = (Integer) session.getAttribute("ticketId");
		Integer ticketQuantityBuy = (Integer) session.getAttribute("ticketQuantityBuy");
		
		// 만약 제대로된 결재 경로가 아니면 좌석화면으로 강제이동
	    if (paymentInProgress == null || !paymentInProgress) {
	    	mv.setViewName("redirect:/athlete/main_page.do");
	        return mv;
	    }
		
	    //결재작업
		reserveService.recordAll(orderId, amount, ticketId, ticketQuantityBuy, userId);
		
		//결재완료에 따라 session에 업데이트
		session.setAttribute("paymentInProgress", false);
		session.setAttribute("ticketId", 0);
		session.setAttribute("ticketQuantityBuy", 0);
		mv.setViewName("/reserve/ReserveFinish");
		return mv;
	}
	
}
