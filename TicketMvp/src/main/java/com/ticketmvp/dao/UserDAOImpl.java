package com.ticketmvp.dao;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;

import com.ticketmvp.domain.UserOrderVO;
import com.ticketmvp.domain.UserVO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	@Autowired
	private JavaMailSender mailsender;
	

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
	public UserVO loginCheck(String id, String pw) {
		System.out.println("===> Mybatis loginCheck() 호출");
		System.out.println("로그인 시도 id:"+id+" pw:"+pw);
		UserVO vo = new UserVO();
		vo.setUserid(id);
		vo.setUserpw(pw);
		UserVO result = mybatis.selectOne("UserDAO.selectlogincheck", vo);
		
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
	
	// 비밀번호 찾기 (아이디와 이메일이 매칭되면 인증번호 생성, 인증메일 전송)
	@Override
	public String findPw(UserVO vo) {
		System.out.println("===> Mybatis findPw() 호출");
		// 아이디와 매칭되는 이메일을 입력한 경우 result에 userid들어옴
		UserVO resultvo = mybatis.selectOne("UserDAO.selectfindpw", vo);
		//System.out.println(resultvo.toString());
		String result = resultvo.getUserid();
		// result에 값이 있으면
		if(resultvo!=null) {
			// 6자리 랜덤수를 뽑아  
			Random random = new Random();
			int randomNum = 0;
			String randomSum = "";
			for(int i=0; i<5; i++) {
				randomNum = random.nextInt(9);
				randomSum += Integer.toString(randomNum);
			}
			//System.out.println("생성된 인증키:"+randomSum);
			// temppw에 넣고
			resultvo.setTemppw(randomSum);
			// 디비에 update하기
			mybatis.update("UserDAO.updatesettemppw",resultvo);
			//System.out.println("name:"+vo.getName()+" userid:"+vo.getUserid()+" email:"+vo.getEmail()+" 인증키:"+vo.getTemppw());
			
			// 메일 보내기
			//sendMail(resultvo);

		}
		// 매칭값이 없으면 null, 값이 있으면 userid 들어옴
		System.out.println(resultvo.toString());
		
		return result;
	}

	// 메일 보내기
	@Override
	public void sendMail(UserVO vo) {
		String mailTitle = "Ticket MVP 인증 이메일 입니다";
		String mailcontent = "<h1> Ticket MVP </h1>"
							+ vo.getName()+"님 저희 사이트를 이용해 주셔서 감사합니다."
							+ "<br/><br/>"
							+ "인증번호는 <strong>["+vo.getTemppw()+"]</strong> 입니다"
							+ "<br/>"
							+ "해당 인증 번호를 인증번호 확인란에 기입하여 주세요";
		try {
			//System.out.println("sendMail 진입 완료");
			MimeMessage message = mailsender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			
			//System.out.println("메일 객체생성 완료");
			
			helper.setFrom("seoungiks@gmail.com");	//from 이메일
			helper.setTo(vo.getEmail());			//to 이메일
			helper.setSubject(mailTitle);			//이메일 제목
			helper.setText(mailcontent, true);		//이메일 내용 (true를 해야 html형식으로 전송됨)
			
			mailsender.send(message);				//메일보내기
			
			//System.out.println("메일 보내기 시도 ");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 비밀번호 찾기 (인증번호 맞게 입력했는지 확인)
	@Override
	public Integer checkTempPw(UserVO vo) {
		Integer result = mybatis.update("UserDAO.selecttemppw",vo);
		return result;
	}

	// 비밀번호 재설정
	@Override
	public Integer resetPw(UserVO vo) {
		Integer result = mybatis.update("UserDAO.updatepw",vo);
		return result;
	}

	// 현재비밀번호 확인
	@Override
	public UserVO checkPw(UserVO vo) {
		UserVO resutl = mybatis.selectOne("UserDAO.selectpw",vo);
		return resutl;
	}

	// 회원정보수정
	@Override
	public Integer userModify(UserVO vo, boolean exceptpw) {
		
		if(exceptpw) {// true면 userpw는 제외하고 나머지 정보 변경
			return mybatis.update("UserDAO.updatemodify_exceptpw", vo);
		}else {	// false면 모든 정보 변경	
			return mybatis.update("UserDAO.updatemodify_all", vo);			
		}
	}

	// 회원탈퇴
	@Override
	public Integer userMyElimination(String userid) {
		return mybatis.update("UserDAO.updateelimination",userid);
	}

	// 내 주문목록
	@Override
	public UserOrderVO userMyOrderList(String userid) {
		return null;
	}
	
	
	
	

	
}
