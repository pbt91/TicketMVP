package com.ticketmvp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public void insertUser(UserVO vo) {
		userservice.insertUser(vo);
	}
	
	// 로그인폼 -> 디비확인 -> 로그인 결과페이지
	@RequestMapping("/loginCheck.do")
	public String login(String userid, String userpw, HttpSession session) {
		String result = userservice.loginCheck(userid, userpw);
		System.out.println(result);
		if(result == null) {
			// 회원정보 안맞으면 DB검색된 값 없음 -> 로그인 폼 그대로 있음. (비밀번호 틀렸다는 값 넘겨줘야 됨)
			return "redirect:userLoginForm.do";
		}else {
			// 검색된 회원정보 있으면 로그인한 사용자 이름 세션에 저장해야함
			session.setAttribute("userid", userid);
			session.setAttribute("name", result);
			//세션시간 1시간
			//session.setMaxInactiveInterval(60*60);
			return "redirect:userLoginStatus.do";
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
	
	// 비밀번호 재설정 
	@RequestMapping(value="/resetPw", method=RequestMethod.POST)
	@ResponseBody
	public String resetPw(UserVO vo) {
		System.out.println("resetPw 컨트롤러 진입: "+vo.toString() );
		String result = Integer.toString(userservice.resetPw(vo));
		System.out.println("resetPw 컨트롤러 결과: "+result);
		return result;
	}
	
	@RequestMapping("/userMymodify.do")
	public String checkPw(UserVO vo, HttpSession session) {
		String userid = (String) session.getAttribute("id");
		vo.setUserid(userid);
		System.out.println("checkPw 컨트롤러 진입: "+ vo.toString());
		String result = userservice.checkPw(vo);
		if(result!=null) {
			return "";
		}else {
			return "redirect:userMyModify.do";
		}

	}
	
}
