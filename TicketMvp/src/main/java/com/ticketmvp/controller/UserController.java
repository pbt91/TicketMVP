package com.ticketmvp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.ticketmvp.domain.UserInquiryVO;
import com.ticketmvp.domain.UserVO;
import com.ticketmvp.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userservice;
	
	// 메인 -> 회원가입폼
	// 메인 -> 로그인폼
	@RequestMapping("/{step}.do")
	public String viewPage(@PathVariable String step) {
		return "user/"+step;
	}
	
	// 회원가입폼_아이디중복체크
	@RequestMapping(value="/userIdCheck", method=RequestMethod.POST)
	@ResponseBody
	public Integer idCheck(@RequestParam("id") String id) {
		Integer idCheckResult = userservice.selectIdCheck(id);
		System.out.println("가져온 값 : "+ id + "디비갔다온값 : "+ idCheckResult);
		
		return idCheckResult;
	}
	
	// 회원가입폼 -> 디비저장 -> 회원가입완료페이지
	@RequestMapping("/insertUser.do")
	public void userInsertUser(UserVO vo) {
		userservice.insertUser(vo);
	}
	
	// 로그인폼 -> 디비확인 -> 로그인 결과페이지
	@RequestMapping("/loginCheck.do")
	public String login(String userid, String userpw, HttpSession session) {
		UserVO result = userservice.loginCheck(userid, userpw);
		if(result != null && result.isJoinstatus() == true) {
			// 검색된 회원정보 있으면 로그인한 사용자 이름 세션에 저장해야함
			session.setAttribute("userid", result.getUserid());
			session.setAttribute("name", result.getName());
			session.setAttribute("email", result.getEmail());
			session.setAttribute("phone", result.getPhone());
			int asplit = result.getEmail().indexOf("@");
			String emailid = result.getEmail().substring(0,asplit);
			int emaillength = result.getEmail().length();
			String mailslc = result.getEmail().substring(asplit+1,emaillength);
			session.setAttribute("emailid", emailid);
			session.setAttribute("mailslc", mailslc);
				
			//세션시간 1시간
			session.setMaxInactiveInterval(60*60);
			return "redirect:userLoginStatus.do";
		
		}
		else {	
			// 회원정보 안맞으면 DB검색된 값 없음 -> 로그인 폼 그대로 있음. (비밀번호 틀렸다는 값 넘겨줘야 됨)
			return "redirect:userLoginForm.do";
		}
	}
	
	// 로그아웃 -> 세션삭제 -> 로그인폼
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {	
		session.invalidate();
		return "redirect:userLoginStatus.do";		//나중에 바꾸기
	}
	
	
	// 아이디찾기폼 -> 디비확인 -> 아이디찾기폼
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	@ResponseBody
	public String findId(@RequestParam("email") String email) {
		String result = userservice.findId(email);
		return result;
	}
	
	// 비밀번호찾기폼 -> 아이디 and 이메일 매칭 디비확인 -> 비밀번호찾기폼
	@RequestMapping(value="/findPw", method=RequestMethod.POST)
	@ResponseBody
	public String findPW(UserVO vo) {
		String result = userservice.findPw(vo);
		//System.out.println("findpw controller : "+result);
		return result;
	}
	
	// 비밀번호찾기 인증번호 -> 디비확인 -> 비밀번호찾기 인증번호 or 비밀번호 재설정   
	@RequestMapping(value="/checkTempPw", method=RequestMethod.POST)
	@ResponseBody
	public Integer checkTempPw(UserVO vo) {
		System.out.println("controller 진입: "+ vo.toString());
		Integer result = userservice.checkTempPw(vo);
		return result;
	}
	
	// 비밀번호 찾기에서 비밀번호 재설정 
	@RequestMapping(value="/resetPw", method=RequestMethod.POST)
	@ResponseBody
	public String resetPw(UserVO vo) {
		System.out.println("resetPw 컨트롤러 진입: "+vo.toString() );
		String result = Integer.toString(userservice.resetPw(vo));
		System.out.println("resetPw 컨트롤러 결과: "+result);
		return result;
	}
	
	// 회원정보수정 비밀번호 확인
	@RequestMapping("/checkPw.do")
	public String checkPw(UserVO vo, HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userid");
		vo.setUserid(userid);
		System.out.println("checkPw 컨트롤러 진입: "+ vo.toString());
		UserVO result = userservice.checkPw(vo);
		if(result!=null) {
			
			System.out.println("result : "+ result.toString());
			
			return "redirect:userMyModifyForm.do";
		}else {
			return "redirect:userMyModify.do";
		}

	}
	
	// 회원정보수정 -> 디비변경
	@RequestMapping(value="/userModify", method=RequestMethod.POST)
	@ResponseBody								//exceptpw - 비밀번호포함여부 true면 제외 false면 포함
	public Integer userModify(UserVO vo, boolean exceptpw, HttpSession session) { 
		System.out.println("userModify 진입 : " + vo.toString() + " 비밀번호포함 : "+exceptpw);
		Integer result = userservice.userModify(vo,exceptpw);
		session.setAttribute("userid", vo.getUserid());
		session.setAttribute("name", vo.getName());
		session.setAttribute("email", vo.getEmail());
		session.setAttribute("phone", vo.getPhone());
		int asplit = vo.getEmail().indexOf("@");
		String emailid = vo.getEmail().substring(0,asplit);
		int emaillength = vo.getEmail().length();
		String mailslc = vo.getEmail().substring(asplit+1,emaillength);
		session.setAttribute("emailid", emailid);
		session.setAttribute("mailslc", mailslc);
		return result;
	}
	
	// 회원탈퇴 -> 디비변경
	@RequestMapping(value="/userMyElimination", method=RequestMethod.POST)
	@ResponseBody
	public Integer userMyElimination(String userid,HttpSession session) {
		System.out.println("controller 진입 : "+ userid);
		session.invalidate();
		return userservice.userMyElimination(userid);
	}
	
	/* ***************************************************************************** */
	
	// 내 주문목록 값 가져오기 
	@RequestMapping("/userMyOrderList.do")
	public void userMyOrderList(HttpSession session, Model m) {
		String userid = (String) session.getAttribute("userid");
		m.addAttribute("order", userservice.userMyOrderList(userid));
	}
	
	// 내 주문목록에서 예매 취소하기
	@ResponseBody
	@RequestMapping("/userMyOrderCancel")
	public String userMyOrderCancel(String orderId, String totalSeat, String ticketName){
		if(userservice.cancelOrder(orderId, totalSeat, ticketName)>0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 내 문의글
	// 문의하기 리스트
	@RequestMapping("/userMyInquiry.do")
	public void userMyInquiry(HttpSession session, Model m) {
		String userid = (String) session.getAttribute("userid");		
		List<UserInquiryVO> inquiryList = new ArrayList<UserInquiryVO>(); 
		inquiryList = userservice.userMyInquiry(userid);
		/*for(UserInquiryVO item : inquiryList) {
			System.out.println(item.getUserid());
		}*/
		m.addAttribute("inquiryList", inquiryList);

	}

	// 문의하기 작성
	@RequestMapping(value="/userMyInquiryInsert.do", method=RequestMethod.POST)
	@ResponseBody
	public Integer userMyInquiryInsert(HttpSession session, UserInquiryVO vo) {
		String userid = (String) session.getAttribute("userid");
		System.out.println(userid);
		vo.setUserid(userid);
		System.out.println(vo.toString());
		Integer result = userservice.userMyInquiryInsert(vo);
		return result;
	}

	
}
