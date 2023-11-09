package com.ticketmvp.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ticketmvp.domain.AdminVO;
import com.ticketmvp.service.AdminService;

@Controller
@RequestMapping("/adminViewsJspFile")
public class AdminController {

	@Autowired
	private AdminService AdminService;

	@RequestMapping("/{step}.do")
	public String viewPage(@PathVariable String step) {
		return "adminViewsJspFile/"+step;
	}

	// 회원 리스트 출력
	@RequestMapping("/userAdmin.do")
	public void user(AdminVO vo, Model model) {
		List<AdminVO> result = AdminService.user(vo);
		model.addAttribute("userList", result);

	}

	@RequestMapping("/adminHome.do")
	public void adminMain() {

	}

	// 선수 등록 조회
	@RequestMapping("/athleteRegister.do")
	public void athleteRegister() {

	}

	@RequestMapping("/athleteModify.do")
	public void athleteModify() {

	}

	// 선수 리스트 출력
	@RequestMapping("/athleteManagement.do")
	public void athleteManagement(AdminVO vo, Model model) {
		List<AdminVO> result = AdminService.athleteManagement(vo);

		model.addAttribute("athleteList", result);
	}
	// 유저 탈퇴
	@PostMapping("/deleteUser/{uid}")
	public int deleteUser(@PathVariable String uid) {
		return AdminService.deleteUser(uid);

	}
	
	// 선수 이름 기준으로 삭제 
	@PostMapping("/deleteAthletename.do")
	@ResponseBody
	public void deleteAthletename(@RequestParam String athletename) {
		System.out.println(athletename);
		int result = AdminService.deleteAthletename(athletename);
		System.out.println(result);
	}
	// 티켓 삭제 
	@PostMapping("/deleteTicket.do")
	@ResponseBody
	public Integer deleteTicket(@RequestParam Integer ticketId) {
		System.out.println(ticketId);
		Integer result = AdminService.deleteTicket(ticketId);
		System.out.println(result);
		return result ; 
	}

	// 경기 및 티켓 리스트 출력
	@RequestMapping("/ticket.do")
	public void ticket(AdminVO vo, Model model) {
		List<AdminVO> result = AdminService.ticket(vo);

		model.addAttribute("ticketList", result);
		System.out.println("ticket.do");
	}

	
	  // 경기 등록
	@RequestMapping(value= "/saveMatchTicket.do") 
	public String saveMatchTicket(AdminVO vo) throws IOException {
	AdminService.saveMatchTicket(vo);
	System.out.println(vo);
	return "redirect:ticket.do"; 
	}
	
	/*
	 * // 티켓 등록
	 * 
	 * @RequestMapping(value= "/saveTicketList.do") public String
	 * insertTicket(AdminVO vo) throws IOException { System.out.println(vo);
	 * AdminService.insertTicket(vo); System.out.println(vo); return
	 * "redirect:ticket.do"; }
	 */
	
	// 티켓 등록 페이지 그 자체
	@RequestMapping("/ticketRegister.do")
	public void ticketRegister() {

	}
	
	// 선수 등록
	@RequestMapping("/athleteManage.do")
	public String athleteManage(AdminVO vo) {
		System.out.println(vo);
		AdminService.athleteManage(vo);
		return "redirect:athleteManagement.do"; 
	}
	// 선수 삭제 
	
	
	// 티켓 수정

	// 경기 수정 버튼 서브 밋
	@RequestMapping("/updateMatchfrm.do")
	public String updateMatchfrm(AdminVO vo, Model m) throws IOException {
		AdminService.updateMatchfrm(vo) ; 
		m.addAttribute("updateResult");
		return "redirect:ticket.do";
	}
	
	// 티켓 수정 버튼 서브밋
//	@RequestMapping("/onlyInsertTiket.do")
//	public String onlyInsertTiket(AdminVO vo, Model m) throws IOException{
//		AdminService.onlyInsertTiket(vo) ; 
//		m.addAttribute("updateResult");
//		return "redirect:ticket.do";
//	}
	
	
	// 경기 및 티켓 수정 조회
	@RequestMapping("/ticketModify.do")
	public void ticketModify(AdminVO vo ,Model m) {
		AdminVO av = AdminService.ticketModify(vo);
		System.out.println(av);
		m.addAttribute("ticketmo",av);
		System.out.println(av);
	}

	// 클럽 등록
	@RequestMapping("/clubRegister.do")
	public void clubRegister() {

	}

	// 클럽 수정
	@RequestMapping("/clubModify.do")
	public void clubModify() {

	}

	// 클럽 리스트 출력
	@RequestMapping("/clubManagement.do")
	public void clubManagement(AdminVO vo, Model model) {
		List<AdminVO> result = AdminService.clubManagement(vo);

		model.addAttribute("clubList", result);
	}
	
	// 차트 목록
	@RequestMapping("/index.do")
	public void index() {

	}

}
