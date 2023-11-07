package com.ticketmvp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketmvp.dao.UserDAO;
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
	public UserOrderVO userMyOrderList(UserOrderVO ordervo) {
		return userDAO.userMyOrderList(ordervo);
	}
	
}
