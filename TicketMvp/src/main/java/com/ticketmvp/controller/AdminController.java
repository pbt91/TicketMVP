package com.ticketmvp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
		return step;
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


	// 선수 리스트 출력
	@RequestMapping("/athleteManagement.do")
	public void athleteManagement(AdminVO vo, Model model) {
		List<AdminVO> result = AdminService.athleteManagement(vo);

		model.addAttribute("athleteList", result);
	}
	// 유저 정보 삭제= 탈퇴
	@PostMapping("/deleteUserid.do")
	@ResponseBody
	public Map<String, String> deleteUserid(@RequestParam String userid) {
	    System.out.println(userid);
	    Integer result = AdminService.deleteUserid(userid);
	    System.out.println(result);

	    Map<String, String> response = new HashMap<>();
	    
	    if (result != null && result > 0) {
	        response.put("result", "success");
	    } else {
	        response.put("result", "fail");
	    }

	    return response;
	}
	
	// 선수 이름 기준으로 삭제 
	@PostMapping("/deleteAthletename.do")
	@ResponseBody
	public Map<String, String> deleteAthletename(@RequestParam String athletename) {
	    System.out.println(athletename);
	    Integer result = AdminService.deleteAthletename(athletename);
	    System.out.println(result);

	    Map<String, String> response = new HashMap<>();
	    
	    if (result != null && result > 0) {
	        response.put("result", "success");
	    } else {
	        response.put("result", "fail");
	    }

	    return response;
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
	
	// 경기 삭제
	@PostMapping("/deleteMatch.do")
	@ResponseBody
	public Integer deleteMatch(@RequestParam Integer matchid) {
		System.out.println(matchid);
		Integer result = AdminService.deleteMatch(matchid);
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
	
	

	// 경기 수정 버튼 서브 밋
	@RequestMapping("/updateMatchfrm.do")
	public String updateMatchfrm(AdminVO vo, Model m) throws IOException {
		System.out.println("updateMatchfrm.do");
		AdminService.updateMatchfrm(vo) ; 
		//m.addAttribute("updateResult");
		return "redirect:ticket.do";
	}
		
	// 경기 및 티켓 수정 조회
	@RequestMapping("/ticketModify.do")
	public void ticketModify(AdminVO vo ,Model m) {
		AdminVO av = AdminService.ticketModify(vo);
		System.out.println(av);
		m.addAttribute("ticketmo",av);
		System.out.println(av);
	}

	// 선수 이미지 및 정보 수정 조회
	@RequestMapping("/athleteModify.do")
	public void athleteModify(AdminVO vo ,Model m) {
		AdminVO av = AdminService.athleteModify(vo) ; 
		System.out.println(av);
		m.addAttribute("athleteM",av);
		System.out.println(av);
	}
	
	// 선수 정보 및 이미지 수정 
	@RequestMapping("/athleteModifysubmit.do")
	public String athleteModifysubmit(AdminVO vo)throws IOException, InterruptedException{
		System.out.println("athleteModifysubmit.do");
		AdminService.athleteModifysubmit(vo) ; 
		//m.addAttribute("updateResult");
		 Thread.sleep(1500);
		return "redirect:athleteManagement.do";
	}
	
	// 클럽 등록 인서트
	@RequestMapping("/clubRegister.do")
	public void clubRegister() {
		

	}
	
	// 클럽 등록 인서트
	@RequestMapping("/clubManage.do")
	public String clubManage(AdminVO vo) {
		System.out.println(vo);
		AdminService.clubManage(vo);
		return "redirect:clubManagement.do";

	}
	
	// 클럽 이름 기준 삭제시
	@PostMapping("/deleteClubname.do")
	@ResponseBody
	public Map<String, String> deleteClubname(@RequestParam String clubname) {
	    System.out.println(clubname);
	    Integer result = AdminService.deleteClubname(clubname);
	    System.out.println(result);

	    Map<String, String> response = new HashMap<>();
	    
	    if (result != null && result > 0) {
	        response.put("result", "success");
	    } else {
	        response.put("result", "fail");
	    }

	    return response;
	}



	// 클럽 이미지 및 정보 수정 조회
	@RequestMapping("/clubModify.do")
	public void clubModify(AdminVO vo , Model m ) {
		AdminVO av = AdminService.clubModify(vo) ;
		System.out.println(av);
		m.addAttribute("clubM",av);
		System.out.println(av);
	}

//	@RequestMapping("/athleteModifysubmit.do")
//	public String athleteModifysubmit(AdminVO vo, Model m)throws IOException, InterruptedException{
//		System.out.println("athleteModifysubmit.do");
//		AdminService.athleteModifysubmit(vo) ; 
//		//m.addAttribute("updateResult");
//		 Thread.sleep(1500);
//		return "redirect:athleteManagement.do";
//	}	
//	
	// 클럽 이미지 및 정보 수정 
	@RequestMapping("/clubManageModify.do")
	public String clubManageModify(AdminVO vo) throws IOException, InterruptedException {
		System.out.println("clubManageModify.do");
		AdminService.clubManageModify(vo) ;
		Thread.sleep(1500);
		return "redirect:clubManagement.do";
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
		System.out.println("차트");
	}
	
	// 차트 관련
    @RequestMapping("/chartTicketClubData.do")
    @ResponseBody
    public List<Map<String, Object>> chartTicketClubData(AdminVO vo) {
        List<AdminVO> result = AdminService.chartTicketClubData(vo);

        List<Map<String, Object>> chartData = new ArrayList<>();

        for (AdminVO data : result) {
            Map<String, Object> rowData = new HashMap<>();
            rowData.put("athleteName", data.getAthletename());
            rowData.put("ticketName", data.getTicketname());
            rowData.put("ticketRemain", data.getTicketremain());

            chartData.add(rowData);
        }

        return chartData;
    }
    
    
}
