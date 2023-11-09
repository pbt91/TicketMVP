package com.ticketmvp.service;

import java.util.List;

import com.ticketmvp.domain.UserInquiryVO;
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
	
	//문의하기 작성
	Integer userMyInquiryInsert(UserInquiryVO vo);

}
