package com.ticketmvp.service;

import java.util.List;

import com.ticketmvp.domain.UserInquiryVO;


import com.ticketmvp.domain.UserCouponVO;
import com.ticketmvp.domain.UserLikeVO;
import com.ticketmvp.domain.UserOrderVO;
import com.ticketmvp.domain.UserVO;

public interface UserService {
	
	//아이디 중복확인
	Integer selectIdCheck(String id);
	
	//회원가입
	void insertUser(UserVO vo);
	
	//로그인 체크
	UserVO loginCheck(String id, String pw);
	
	//아이디 찾기 - 이메일 확인하기
	String findId(String email);
	
	//비밀먼호 찾기 - 아이디,이메일 매칭 확인하기
	String findPw(UserVO vo);
	
	//비밀번호 찾기 - 인증번호 확인하기
	Integer checkTempPw(UserVO vo);
	
	//비밀번호 재설정
	Integer resetPw(UserVO vo);
	
	//현재비밀번호 확인
	UserVO checkPw(UserVO vo);
	
	//회원정보수정
	Integer userModify(UserVO vo, boolean exceptpw);
	
	//회원탈퇴
	Integer userMyElimination(String userid);
	
/* ********************************************* */
	
	//내 주문목록
	List<UserOrderVO> userMyOrderList(String userid);
	
	//내 주문목록에서 예매취소
	int cancelOrder(String orderid, String totalSeat, String ticketName);
	
	//문의하기 리스트
	List<UserInquiryVO> userMyInquiry(String us);
	
	//문의하기 리스트 내거만
	List<UserInquiryVO> userMyInquiryMine(String userid);
	
	//문의하기 작성
	Integer userMyInquiryInsert(UserInquiryVO vo);
	
	//문의하기 글 상세
	UserInquiryVO userMyInquiryView(String helpid);
	
	//문의하기 글삭제
	Integer userMyInquiryDelete(String helpid);
	
	//찜목록
	List<UserLikeVO> userMyLike(String userid);
	
	//내쿠폰 
	List<UserCouponVO> userMyCoupon(String userid);
	
	//내쿠폰 등록
	Integer userMyCouponInsert(String userid, String couponid);

	//찜 목록에서 찜 삭제
	void removeLike(String userId, Integer matchId);
	
	//문의하기 리스트 페이지 번호
	List<UserInquiryVO> userMyInquiry(String userId, Integer page, Integer size);

	//문의하기 리스트 글 숫자 세기
	int countUserInquiries(String userId);
}
