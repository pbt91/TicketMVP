package com.ticketmvp.dao;

import java.util.List;

import com.ticketmvp.domain.UserCouponVO;
import com.ticketmvp.domain.UserInquiryVO;
import com.ticketmvp.domain.UserLikeVO;
import com.ticketmvp.domain.UserOrderVO;
import com.ticketmvp.domain.UserVO;

public interface UserDAO {

	// 아이디 중복체크
	public Integer selectIdCkeck(String id);			 
	// 회원가입 
	public void insertUser(UserVO vo);				
	// 로그인 체크 
	public UserVO loginCheck(String id, String pw);
	// 아이디 찾기 - 이메일 확인하기
	public String findId(String email);
	// 비밀번호 찾기 - 이름,이메일 확인하기
	public String findPw(UserVO vo);
	// 비밀번호 찾기 - 인증메일 보내기
	public void sendMail(UserVO vo);
	// 비밀번호 찾기 - 인증번호 확인하기
	public Integer checkTempPw(UserVO vo);
	// 비밀번호 재설정
	public Integer resetPw(UserVO vo);
	// 회원정보수정 - 현재비밀번호 확인하기 
	public UserVO checkPw(UserVO vo);
	// 회원정보수정
	public Integer userModify(UserVO vo, boolean exceptpw);
	// 회원탈퇴
	public Integer userMyElimination(String userid);
	
/* *********************************************************** */
	
	// 내 주문목록
	public UserOrderVO userMyOrderList(String userid);
	
	// 문의하기 리스트
	public List<UserInquiryVO> userMyInquiry(String userid);
	
	//문의하기 리스트
	List<UserInquiryVO> userMyInquiryMine(String userid);
	
	// 문의하기 작성
	Integer userMyInquiryInsert(UserInquiryVO vo);
	
	// 문의하기 글 상세
	UserInquiryVO userMyInquiryView(String helpid);
	
	// 문의하기 글 삭제
	Integer userMyInquiryDelete(String helpid);
	
	// 찜목록 리스트
	List<UserLikeVO> userMyLike(String userid);
	
	// 내쿠폰 리스트
	List<UserCouponVO> userMyCoupon(String userid);
	
	// 쿠폰 사용자 등록
	Integer userMyCouponInsert(String userid, String couponid);
}
