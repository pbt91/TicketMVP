package com.ticketmvp.dao;

import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketmvp.domain.UserVO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	

	// 아이디 중복체크
	@Override
	public Integer selectIdCkeck(String id) {
		System.out.println("===> Mybatis selectIdCheck() 호출");
		System.out.println(id);
		String userid = mybatis.selectOne("UserDAO.selectidcheck", id);
		System.out.println(userid);
		Integer result;
		if(userid != null) { result = 1; }
		else { result = 0; }
		return result; 
		
	}
	
	// 회원가입
	@Override
	public void insertUser(UserVO vo) {
		System.out.println("===> Mybatis insertUser() 호출");
		System.out.println(vo.toString());		
		mybatis.insert("UserDAO.insertuser", vo);
	}

	// 로그인 체크
	@Override
	public String loginCheck(String id, String pw) {
		System.out.println("===> Mybatis loginCheck() 호출");
		System.out.println("로그인 시도 id:"+id+" pw:"+pw);
		UserVO vo = new UserVO();
		vo.setUserid(id);
		vo.setUserpw(pw);
		String result = mybatis.selectOne("UserDAO.selectlogincheck", vo);
		
		return result;
	}

	// 아이디 찾기
	@Override
	public String findId(String email) {
		System.out.println("===> Mybatis findId() 호출");
		System.out.println("아이디 찾기 시도 email:"+ email);
		// result에 userid값 들어옴
		String result = mybatis.selectOne("UserDAO.selectfindid",email);
		return result;
	}
	
	// 비밀번호 찾기
//	@Override
//	public String findPw(UserVO vo) {
//		System.out.println("===> Mybatis findPw() 호출");
//		
//		// 아이디와 매칭되는 이메일을 입력한 경우
//		if(result!=null) {
//			// 6자리 랜덤수를 뽑아 vo.temppw에 넣고 
//			Random random = new Random();
//			int randomNum = 0;
//			String randomSum = "";
//			for(int i=0; i<5; i++) {
//				randomNum = random.nextInt(9);
//				randomSum += Integer.toString(randomNum);
//			}
//			System.out.println("생성된 인증키:"+randomSum);
//			UserVO vo = new UserVO();
//			vo.setEmail(email);
//			vo.setTemppw(randomSum);
//			//디비에 update하기
//			mybatis.update("UserDAO.updatesettemppw",vo);
//		}
//		
//		return result;
//	}
	

	
}
