package com.ticketmvp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ticketmvp.dao.UserDAO;
import com.ticketmvp.domain.UserCouponVO;
import com.ticketmvp.domain.UserInquiryVO;
import com.ticketmvp.domain.UserLikeVO;
import com.ticketmvp.domain.UserOrderVO;
import com.ticketmvp.domain.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	// 아이디 중복확인
	public Integer selectIdCheck(String id) {
		Integer result = userDAO.selectIdCkeck(id);
		System.out.println(result.toString());
		return result;
	}
	
	// 회원가입
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}
	
	// 로그인 체크
	public UserVO loginCheck(String id, String pw) {
		UserVO result =  userDAO.loginCheck(id, pw);
		return result;
	}

	// 아이디 찾기
	public String findId(String email) {
		String result = userDAO.findId(email);
		return result;
	}

	// 비밀번호 찾기
	public String findPw(UserVO vo) {
		String result = userDAO.findPw(vo);
		return result;
	}

	// 비밀번호 찾기에서 인증번호 확인하기
	public Integer checkTempPw(UserVO vo) {
		Integer result = userDAO.checkTempPw(vo);
		return result;
	}

	// 비밀번호 재설정
	public Integer resetPw(UserVO vo) {
		Integer result = userDAO.resetPw(vo);
		return result;
	}
	
	// 현재비밀번호 확인
	public UserVO checkPw(UserVO vo) {
		UserVO result = userDAO.checkPw(vo);
		return result;
	}

	// 회원정보 수정
	public Integer userModify(UserVO vo, boolean exceptpw) {	
		return userDAO.userModify(vo, exceptpw);
	}

	// 회원탈퇴
	public Integer userMyElimination(String userid) {
		return userDAO.userMyElimination(userid);
	}

/* *********************************************************** */
	
	// 내 주문목록
	public List<UserOrderVO> userMyOrderList(String userid) {
		return userDAO.userMyOrderList(userid);
	}

	// 문의하기 리스트
	public List<UserInquiryVO> userMyInquiry(String userid) {
		return userDAO.userMyInquiry(userid);
	}
	
	// 문의하기 리스트 내것만
	public List<UserInquiryVO> userMyInquiryMine(String userid){
		return userDAO.userMyInquiryMine(userid);
	};

	// 문의하기 작성
	public Integer userMyInquiryInsert(UserInquiryVO vo) {
		return userDAO.userMyInquiryInsert(vo);
	}

	// 문의하기 글 상세
	public UserInquiryVO userMyInquiryView(String helpid) {
		return userDAO.userMyInquiryView(helpid);
	}

	// 문의하기 글 삭제
	public Integer userMyInquiryDelete(String helpid) {
		return userDAO.userMyInquiryDelete(helpid);
	}
	
	// 찜목록 리스트
	public List<UserLikeVO> userMyLike(String userid) {
		return userDAO.userMyLike(userid);
	}

	// 내쿠폰 리스트
	public List<UserCouponVO> userMyCoupon(String userid) {
		return userDAO.userMyCoupon(userid);
	}
	
	// 내쿠폰 등록하기
	public Integer userMyCouponInsert(String userid, String couponid) {
		return userDAO.userMyCouponInsert(userid, couponid);
	}
		
	// 내 주문목록에서 예매 취소
	@Transactional
	public int cancelOrder(String orderid, String totalSeat, String ticketName) {
		if(userDAO.checkOrderStatus(orderid) > 0) {
			return -1;
		} else {
			userDAO.cancelOrderCoupon(orderid);
			userDAO.cancelOrderSeat(orderid);
			userDAO.updateTicket(totalSeat, ticketName);
			return userDAO.cancelOrderReservation(orderid);
		}
	}

	//찜 목록에서 찜 삭제
	@Override
	public void removeLike(String userId, Integer matchId) {
		userDAO.removeLike(userId, matchId);
	}

	//문의하기 리스트 페이지 번호
	public List<UserInquiryVO> userMyInquiry(String userId, Integer page, Integer size) {
		int startRow = (page - 1) * size; 
		return userDAO.getUserInquiriesPaginated(userId, startRow, size);
	}

	//문의하기 리스트 글 숫자 세기	
	public int countUserInquiries(String userId) {
	    List<UserInquiryVO> inquiries = userDAO.userMyInquiry(userId);
	    return inquiries.size();
	}
	
}
