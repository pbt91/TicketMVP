package com.ticketmvp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ticketmvp.domain.UserInquiryVO;
import com.ticketmvp.domain.UserCouponVO;
import com.ticketmvp.domain.UserLikeVO;
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
		return "user/" + step; 
	 }
 

	// 회원가입폼_아이디중복체크
	@RequestMapping(value = "/userIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public Integer idCheck(@RequestParam("id") String id) {
		Integer idCheckResult = userservice.selectIdCheck(id);
		//System.out.println("가져온 값 : " + id + "디비갔다온값 : " + idCheckResult);

		return idCheckResult;
	}

	// 회원가입폼 -> 디비저장 -> 회원가입완료페이지
	@RequestMapping("/insertUser.do")
	public String userInsertUser(UserVO vo) {
		userservice.insertUser(vo);	
		return "redirect:/user/userLoginForm.do";
	}

	// 로그인버튼 눌렀을 때 전페이지 세션저장 
	@RequestMapping("/userLoginForm.do")
	public void userLoginForm (HttpSession session, HttpServletRequest request) { 
		String uri = request.getHeader("Referer"); 
		System.out.println("저장된 유알아이"+ uri); 
		if(uri != null && !uri.contains("/login")) { 
			session.setAttribute("prevPage", uri); 
		} 
		System.out.println("session:"+session.getAttribute("prevPage"));
	}
	 
	
	// 로그인폼 -> 디비확인 -> 로그인 결과페이지
	@RequestMapping("/loginCheck.do")
	public String login(String userid, String userpw, HttpSession session, HttpServletRequest request) {
		System.out.println("로그인 컨드롤러 진입");
		UserVO result = userservice.loginCheck(userid, userpw);
		if (result != null && result.isJoinstatus() == true) {
			if(result.isAdmin()) {
				return "redirect:/adminViewsJspFile/adminMain.do";
			}
			System.out.println("로그인 컨드롤러 회원 정보있음");
			
			// 검색된 회원정보 있으면 로그인한 사용자 이름 세션에 저장해야함
			session.setAttribute("userid", result.getUserid());
			session.setAttribute("name", result.getName());
			session.setAttribute("email", result.getEmail());
			session.setAttribute("phone", result.getPhone());
			int asplit = result.getEmail().indexOf("@");
			String emailid = result.getEmail().substring(0, asplit);
			int emaillength = result.getEmail().length();
			String mailslc = result.getEmail().substring(asplit + 1, emaillength);
			session.setAttribute("emailid", emailid);
			session.setAttribute("mailslc", mailslc);

			//세션시간 1시간
			session.setMaxInactiveInterval(60*60);
			
		    if (session.getAttribute("prevPage") != null) {
			    return "redirect:" + session.getAttribute("prevPage");
			} else {
				return "redirect:/athlete/main_page.do";
			}

		} else {
			// 회원정보 안맞으면 DB검색된 값 없음 -> 로그인 폼 그대로 있음. (비밀번호 틀렸다는 값 넘겨줘야 됨)
			System.out.println("왜 여길 들어와");
			return "redirect:userLoginForm.do";
		}
	}

	// 로그아웃 -> 세션삭제 -> 로그인폼
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/athlete/main_page.do"; 
	}

	// 아이디찾기폼 -> 디비확인 -> 아이디찾기폼
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	@ResponseBody
	public String findId(@RequestParam("email") String email) {
		String result = userservice.findId(email);
		return result;
	}

	// 비밀번호찾기폼 -> 아이디 and 이메일 매칭 디비확인 -> 비밀번호찾기폼
	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	@ResponseBody
	public String findPW(UserVO vo) {
		String result = userservice.findPw(vo);
		//System.out.println("findpw controller : "+result);
		return result;
	}

	// 비밀번호찾기 인증번호 -> 디비확인 -> 비밀번호찾기 인증번호 or 비밀번호 재설정   
	@RequestMapping(value = "/checkTempPw", method = RequestMethod.POST)
	@ResponseBody
	public Integer checkTempPw(UserVO vo) {
		//System.out.println("controller 진입: " + vo.toString());
		Integer result = userservice.checkTempPw(vo);
		return result;
	}

	// 비밀번호 찾기에서 비밀번호 재설정 
	@RequestMapping(value = "/resetPw", method = RequestMethod.POST)
	@ResponseBody
	public String resetPw(UserVO vo) {
		//System.out.println("resetPw 컨트롤러 진입: " + vo.toString());
		String result = Integer.toString(userservice.resetPw(vo));
		//System.out.println("resetPw 컨트롤러 결과: " + result);
		return result;
	}

	// 회원정보수정 비밀번호 확인
	@RequestMapping("/checkPw.do")
	public String checkPw(UserVO vo, HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userid");
		vo.setUserid(userid);
		//System.out.println("checkPw 컨트롤러 진입: " + vo.toString());
		UserVO result = userservice.checkPw(vo);
		if (result != null) {

			System.out.println("result : " + result.toString());

			return "redirect:userMyModifyForm.do";
		} else {
			return "redirect:userMyModify.do";
		}

	}

	// 회원정보수정 -> 디비변경
	@RequestMapping(value = "/userModify", method = RequestMethod.POST)
	@ResponseBody //exceptpw - 비밀번호포함여부 true면 제외 false면 포함
	public Integer userModify(UserVO vo, boolean exceptpw, HttpSession session) {
		//System.out.println("userModify 진입 : " + vo.toString() + " 비밀번호포함 : " + exceptpw);
		Integer result = userservice.userModify(vo, exceptpw);
		session.setAttribute("userid", vo.getUserid());
		session.setAttribute("name", vo.getName());
		session.setAttribute("email", vo.getEmail());
		session.setAttribute("phone", vo.getPhone());
		int asplit = vo.getEmail().indexOf("@");
		String emailid = vo.getEmail().substring(0, asplit);
		int emaillength = vo.getEmail().length();
		String mailslc = vo.getEmail().substring(asplit + 1, emaillength);
		session.setAttribute("emailid", emailid);
		session.setAttribute("mailslc", mailslc);
		return result;
	}

	// 회원탈퇴 -> 디비변경
	@RequestMapping(value = "/userMyElimination", method = RequestMethod.POST)
	@ResponseBody
	public Integer userMyElimination(String userid, HttpSession session) {
		System.out.println("controller 진입 : " + userid);
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
	@RequestMapping("/userMyOrderCancel.do")
	public String userMyOrderCancel(String orderId, String totalSeat, String ticketName){
		if(userservice.cancelOrder(orderId, totalSeat, ticketName)>0) {
			return "success";
		} else {
			return null;
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

	// 문의하기 리스트 내것만
	// 아작으로 할지 그냥 할지 못정함..
	public void userMyInquiryMine(HttpSession session, Model m) {
		String userid = (String) session.getAttribute("userid");		
		List<UserInquiryVO> inquiryList = new ArrayList<UserInquiryVO>(); 
		inquiryList = userservice.userMyInquiry(userid);
		for(UserInquiryVO item : inquiryList) {
			System.out.println(item.getUserid());
		}
		m.addAttribute("inquiryList", inquiryList);
	}

	// 문의하기 작성
	@RequestMapping(value = "/userMyInquiryInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public Integer userMyInquiryInsert(HttpSession session, UserInquiryVO vo) {
		String userid = (String) session.getAttribute("userid");
		System.out.println(userid);

		vo.setUserid(userid);

		Integer result = userservice.userMyInquiryInsert(vo);
		return result;
	}

	// 문의하기 게시글 상세
	@RequestMapping(value = "/userMyInquiryView.do", method = RequestMethod.POST)
	@ResponseBody
	public UserInquiryVO userMyInquiryView(String helpid) {
		System.out.println(helpid);
		UserInquiryVO result = userservice.userMyInquiryView(helpid);
		//System.out.println("controller:"+result.getHelptitle());
		//System.out.println(helpid);
		return result;
	}

	// 문의하기 내 게시글 삭제
	@RequestMapping(value = "/userMyInquiryDelete.do", method = RequestMethod.POST)
	@ResponseBody 						// 삭제할 글번호랑 해당 글번호의 작성자
	public boolean userMyInquiryDelete(String helpid, String helpuserid, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		//System.out.println("로그인 아이디 :"+userid+" 작성자아이디 :"+helpuserid+" 글번호: "+helpid);
		//아이디가 같으면 삭제
		if (userid.equals(helpuserid)) {
			userservice.userMyInquiryDelete(helpid);
			return true;
		}else {
			return false;
		}
	}
	
	// 찜목록 리스트
	@RequestMapping("/userMyLike.do")
	public void userMyLike(HttpSession session, Model m) {
		String userid = (String) session.getAttribute("userid");
		//System.out.println(userid);
		List<UserLikeVO> likeList = new ArrayList<UserLikeVO>();
		likeList = userservice.userMyLike(userid);
		/*for(UserLikeVO item : likeList) {
			System.out.println(item.getUserid());
		}*/
		//System.out.println("찜목록 컨드롤러 들어옴");
		m.addAttribute("likeList",likeList);
		
	}
	

	// 쿠폰 리스트
	@RequestMapping("/userMyCoupon.do")
	public void userMyCoupon(HttpSession session, Model m) {
		String userid = (String) session.getAttribute("userid");
		List<UserCouponVO> coupon = new ArrayList<UserCouponVO>();
		coupon = userservice.userMyCoupon(userid);
		m.addAttribute("couponList",coupon);
	}
	
	// 쿠폰 사용자 등록
	@RequestMapping("/userMyCouponInsert.do")
	public String userMyCouponInsert(HttpSession session, String in1, String in2, String in3, String in4 ) {
		String userid = (String) session.getAttribute("userid");
		//System.out.println(in1+in2+in3+in4);
		//쿠폰 번호 가져오기
		StringBuffer buf = new StringBuffer();
		buf.append(in1);
		buf.append(in2);
		buf.append(in3);
		buf.append(in4);
		String couponid = buf.toString();
		//System.out.println(couponid);
		Integer result = userservice.userMyCouponInsert(userid, couponid);
		
		if(result!=null) {
			return "redirect:userMyCoupon.do";
			
		}else {
			return "redirect:userMyCoupon.do";
		}
	}
	
	//찜 목록에서 찜 삭제
	@RequestMapping("/userMyLikeDelete.do")
	public String userMyLikeDelete(HttpSession session, Integer matchId) {
		System.out.println("컨트롤러:"+matchId);
		String userId = (String) session.getAttribute("userid");
		userservice.removeLike(userId, matchId);
		return "redirect:/user/userMyLike.do";
	}
	

	//로그인 확인
	@RequestMapping(value = "/isLoggedIn", method = RequestMethod.GET)
	@ResponseBody public ResponseEntity<Map<String, Boolean>>isLoggedIn(HttpSession session) {
		Map<String, Boolean> response = new	HashMap<>(); 
		response.put("isLoggedIn", session.getAttribute("userid") != null); 
		return ResponseEntity.ok(response); 
	}

}
